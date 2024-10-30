<?php

namespace App\Services;

use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use App\Models\Leave;
use Illuminate\Support\Facades\Storage;
use Exception;
use Illuminate\Support\Facades\Log;

class LeaveCertificateService
{
    /**
     * Maximum memory limit for PDF generation (in MB)
     */
    private const MEMORY_LIMIT = 512;

    /**
     * Image optimization settings
     */
    private const IMAGE_SETTINGS = [
        'max_width' => 800,
        'max_height' => 800,
        'quality' => 80,
        'format' => 'jpg'
    ];

    public function __construct()
    {
        $this->configureMemorySettings();
    }

    /**
     * Configure memory settings for PDF generation
     */
    private function configureMemorySettings(): void
    {
        ini_set('memory_limit', self::MEMORY_LIMIT . 'M');
        gc_enable();
    }

    /**
     * Generate the appropriate certificate based on leave type
     */
    public function generateCertificate(Leave $leave)
    {
        try {
            Log::info('Starting image optimization');
            
            // Optimize and encode signature
            $signaturePath = public_path('signatures/director_signature.jpg');
            $optimizedSignature = $this->optimizeAndEncodeImage($signaturePath);
            Log::info('Signature optimization completed');

            // Optimize logo if it exists
            $logo1Path = public_path('logo/logo1.png');
            $logo2Path = public_path('logo/logo2.jpeg');
            $optimizedLogo1 = null;
            $optimizedLogo2 = null;
            if (file_exists($logo1Path) && file_exists($logo2Path)) {
                $optimizedLogo1 = $this->optimizeAndEncodeImage($logo1Path);
                $optimizedLogo2 = $this->optimizeAndEncodeImage($logo2Path);
                Log::info('Logo optimization completed');
            }

            // Determine template
            $template = $this->getTemplateForLeaveType($leave->leave_type_id);
            Log::info('Using template: ' . $template);

            // Load the PDF view with optimized images
            $pdf = PDF::loadView($template, [
                'leave' => $leave,
                'signature' => $optimizedSignature,
                'logo1' => $optimizedLogo1,
                'logo2' => $optimizedLogo2,
                'date' => Carbon::now()->format('d/m/Y')
            ]);

            Log::info('PDF view loaded successfully');

            // Set PDF options to optimize memory usage
            $pdf->setPaper('A4');
            $pdf->setWarnings(false);
            
            // Generate unique filename
            $filename = 'leave_certificate_' . $leave->id . '_' . time() . '.pdf';
            
            Log::info('Generating PDF output');
            
            // Store the PDF and get its content
            $pdfContent = $pdf->output();
            Storage::disk('public')->put('certificates/' . $filename, $pdfContent);
            
            Log::info('PDF stored successfully');

            // Clean up memory
            unset($pdf);
            unset($pdfContent);
            unset($optimizedSignature);
            unset($optimizedLogo1);
            gc_collect_cycles();

            return $filename;

        } catch (Exception $e) {
            Log::error('PDF Generation Error: ' . $e->getMessage());
            throw new Exception('Failed to generate leave certificate: ' . $e->getMessage());
        }
    }

    /**
     * Optimize and encode image for PDF
     */
    private function optimizeAndEncodeImage(string $imagePath): string
    {
        try {
            if (!file_exists($imagePath)) {
                Log::error('Image not found: ' . $imagePath);
                throw new Exception('Image file not found');
            }

            // Create image resource based on file type
            $imageInfo = getimagesize($imagePath);
            if ($imageInfo === false) {
                Log::error('Invalid image file: ' . $imagePath);
                throw new Exception('Invalid image file');
            }

            switch ($imageInfo[2]) {
                case IMAGETYPE_JPEG: 
                    $image = imagecreatefromjpeg($imagePath);
                    break;
                case IMAGETYPE_PNG:
                    $image = imagecreatefrompng($imagePath);
                    break;
                default:
                    throw new Exception('Unsupported image type');
            }

            if ($image === false) {
                throw new Exception('Failed to create image resource');
            }

            // Calculate new dimensions
            $width = imagesx($image);
            $height = imagesy($image);
            
            $ratio = min(
                self::IMAGE_SETTINGS['max_width'] / $width,
                self::IMAGE_SETTINGS['max_height'] / $height
            );

            if ($ratio < 1) {
                $newWidth = (int)($width * $ratio);
                $newHeight = (int)($height * $ratio);
                
                $newImage = imagecreatetruecolor($newWidth, $newHeight);
                
                // Preserve transparency for PNG
                if ($imageInfo[2] === IMAGETYPE_PNG) {
                    imagealphablending($newImage, false);
                    imagesavealpha($newImage, true);
                    $transparent = imagecolorallocatealpha($newImage, 0, 0, 0, 127);
                    imagefilledrectangle($newImage, 0, 0, $newWidth, $newHeight, $transparent);
                }

                imagecopyresampled(
                    $newImage, $image,
                    0, 0, 0, 0,
                    $newWidth, $newHeight,
                    $width, $height
                );
            } else {
                $newImage = $image;
            }

            // Start output buffering
            ob_start();
            
            // Output image to buffer
            if (self::IMAGE_SETTINGS['format'] === 'jpg') {
                imagejpeg($newImage, null, self::IMAGE_SETTINGS['quality']);
            } else {
                imagepng($newImage, null, round((100 - self::IMAGE_SETTINGS['quality']) / 10));
            }
            
            // Get buffer contents and encode
            $imageData = ob_get_clean();
            
            // Clean up
            imagedestroy($newImage);
            if (isset($image) && $image !== $newImage) {
                imagedestroy($image);
            }

            return base64_encode($imageData);

        } catch (Exception $e) {
            Log::error('Image optimization error: ' . $e->getMessage());
            // Fall back to original image if optimization fails
            return base64_encode(file_get_contents($imagePath));
        }
    }

    /**
     * Get the appropriate template based on leave type
     */
    private function getTemplateForLeaveType($leaveTypeId)
    {
        $templates = [
            1 => 'certificates.leave_annual',
            2 => 'certificates.leave_maternity',
            3 => 'certificates.leave_daily',
        ];

        return $templates[$leaveTypeId] ?? 'certificates.leave_annual';
    }
}