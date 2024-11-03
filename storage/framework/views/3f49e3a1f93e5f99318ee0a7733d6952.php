<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
         body {
            font-family: DejaVu Sans, Arial, sans-serif;
            line-height: 1.6;
            margin: 40px;
            font-size: 12pt;
        }
        .header-container {
            margin-bottom: 30px;
        }
        .header-block {
            display: table;
            width: 100%;
            margin-bottom: 15px;
        }
        .logo-container {
            display: table-cell;
            vertical-align: top;
            width: 80px; /* Fixed width for logo container */
        }
        .logo {
            width: 80px;
            height: auto;
        }
        .header-text {
            display: table-cell;
            vertical-align: top;
            padding-left: 15px;
            width: 300px; /* Fixed width for header text */
        }
        .header-text div {
            margin: 0;
            line-height: 1.4;
            font-size: 11pt;
        }
        .reference {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .title {
            text-align: center;
            font-weight: bold;
            margin: 20px 0;
            text-transform: uppercase;
        }
        .content {
            text-align: justify;
            margin: 20px 0;
        }
        .leave-details {
            margin: 20px 0;
            padding: 10px;
            border: 1px solid #ddd;
        }
        .signature-section {
            margin-top: 50px;
            text-align: right;
        }
        .signature-image {
            max-width: 200px;
            margin-top: 10px;
        }
        .date {
            text-align: right;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <div class="header-block">
            <div class="logo-container">
                <?php if(isset($logo2)): ?>
                    <img src="data:image/png;base64,<?php echo e($logo2); ?>" alt="Logo" class="logo">
                <?php endif; ?>
            </div>
            <div class="header-text">
                <div>MINISTERE DE LA SANTE DE</div>
                <div>L'HYGIENE PUBLIQUE ET DE LA</div>
                <div>COUVERTURE MALADIE UNIVERSELLE</div>
            </div>
        </div>

        <div class="header-block">
            <div class="logo-container">
                <?php if(isset($logo1)): ?>
                    <img src="data:image/png;base64,<?php echo e($logo1); ?>" alt="Logo" class="logo">
                <?php endif; ?>
            </div>
            <div class="header-text">
                <div>DIRECTION GENERALE DE LA SANTE</div>
                <div>DIRECTION DES SOINS INFIRMIERS</div>
                <div>ET MATERNELS</div>
            </div>
        </div>
    </div>

    <div class="date">
        Abidjan, le <?php echo e($date); ?>

    </div>

    <div class="reference">
        N°___________ /MSHPCMU/DGS/DSIMI
    </div>

    <div class="title">
        AUTORISATION D'ABSENCE
    </div>

    <div class="content">
        Je soussigné, Docteur MEITE Djoussoufou, Directeur des Soins Infirmiers, Maternels
        et Infantiles (DSIMI) autorise <br>
        <?php if($permission->employee): ?>
            
        Monsieur/Madame:<?php echo e($permission->employee->name); ?>, 
            matricule <?php echo e($permission->employee->employee_id); ?>, 
            <?php echo e($permission->employee->designation ? $permission->employee->designation->name : $permission->employee->position); ?>

            <?php if($permission->employee->department): ?>
                au service de <?php echo e($permission->employee->department->name); ?>,
            <?php endif; ?>
        <?php endif; ?>
        à s'absenter le <?php echo e(\Carbon\Carbon::parse($permission->request_date)->format('d/m/Y')); ?>

        de <?php echo e(\Carbon\Carbon::parse($permission->start_time)->format('H:i')); ?> 
        à <?php echo e(\Carbon\Carbon::parse($permission->end_time)->format('H:i')); ?>

        <?php if($permission->reason): ?>
            pour le motif suivant: <?php echo e($permission->reason); ?>

        <?php endif; ?>
    </div>

    <div class="content">
        En foi de quoi, la présente autorisation lui est délivrée pour
        servir et valoir ce que de droit.
    </div>

    <div class="signature-section">
        <div>Dr MEITE Djoussoufou</div>
        <?php if(isset($signature)): ?>
            <img src="data:image/png;base64,<?php echo e($signature); ?>" class="signature-image">
        <?php endif; ?>
    </div>
</body>
</html><?php /**PATH /home/earljoe/Documents/freelance/Assignment 1/segmented/updated/dsimi.org/resources/views/certificates/hourly_leave.blade.php ENDPATH**/ ?>