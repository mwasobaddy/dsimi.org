<?php

namespace App\Services;

use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use App\Models\Leave;
use Illuminate\Support\Facades\Storage;

class LeaveCertificateService
{
    /**
     * Generate the appropriate certificate based on leave type
     */
    public function generateCertificate(Leave $leave)
    {
        // Get the signature image and encode it to base64
        $signaturePath = public_path('signatures/director_signature.jpg');  
        $signatureBase64 = base64_encode(file_get_contents($signaturePath));

        // Determine which template to use based on leave type
        $template = $this->getTemplateForLeaveType($leave->leave_type_id);

        // Load the PDF view with data
        $pdf = PDF::loadView($template, [
            'leave' => $leave,
            'signature' => $signatureBase64,
            'date' => Carbon::now()->format('d/m/Y')
        ]);

        // Generate unique filename
        $filename = 'leave_certificate_' . $leave->id . '_' . time() . '.pdf';
        
        // Store the PDF
        Storage::disk('public')->put('certificates/' . $filename, $pdf->output());

        return $filename;
    }

    /**
     * Get the appropriate template based on leave type
     */
    private function getTemplateForLeaveType($leaveTypeId)
    {
        // You'll need to match these IDs with your leave_types table
        $templates = [
            1 => 'certificates.leave_annual',     // Annual leave
            2 => 'certificates.leave_maternity',  // Maternity leave
            3 => 'certificates.leave_daily',      // Daily leave
            // 3 => 'certificates.leave_retirement', // Retirement
            // Add more leave types as needed
        ];

        return $templates[$leaveTypeId] ?? 'certificates.leave_annual';
    }
}