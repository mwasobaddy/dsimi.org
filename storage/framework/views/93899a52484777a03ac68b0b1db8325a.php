<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 40px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
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
    <div class="header">
        <div>MINISTERE DE LA SANTE DE</div>
        <div>L'HYGIENE PUBLIQUE ET DE LA</div>
        <div>COUVERTURE MALADIE UNIVERSELLE</div>
        <div style="margin-top: 15px;">DIRECTION GENERALE DE LA SANTE</div>
        <div>DIRECTION DES SOINS INFIRMIERS</div>
        <div>ET MATERNELS</div>
    </div>

    <div class="date">
        Abidjan, le <?php echo e($date); ?>

    </div>

    <div class="reference">
        N°___________ /MSHPCMU/DGS/DSIMI
    </div>

    <div class="title">
        CERTIFICAT DE <?php echo e($leave->leave_type_name); ?>

    </div>

    <div class="content">
        Je soussigné, Docteur MEITE Djoussoufou, Directeur des Soins Infirmiers, Maternels
        et Infantiles (DSIMI) certifie que <?php echo e($leave->employee_title); ?> 
        <?php echo e($leave->employee_name); ?>, matricule <?php echo e($leave->employee_id_number); ?>, 
        <?php echo e($leave->employee_position); ?> à <?php echo e($leave->employee_department); ?>, bénéficiaire 
        d'une <?php echo e(strtolower($leave->leave_type_name)); ?> de <?php echo e($leave->total_leave_days); ?> jours 
        au titre de l'année <?php echo e($leave->year); ?>, cesse service le 
        <?php echo e(\Carbon\Carbon::parse($leave->start_date)->format('d/m/Y')); ?>.
    </div>

    <div class="leave-details">
        <strong>Type de congé:</strong> <?php echo e($leave->leave_type_name); ?><br>
        <strong>Motif:</strong> <?php echo e($leave->leave_reason ?? 'Non spécifié'); ?><br>
        <strong>Durée:</strong> <?php echo e($leave->total_leave_days); ?> jours
    </div>

    <div class="content">
        L'intéressé(e) reprendra service le 
        <?php echo e(\Carbon\Carbon::parse($leave->end_date)->addDays(1)->format('d/m/Y')); ?>, 
        à son poste habituel.
    </div>

    <div class="content">
        En foi de quoi, le présent certificat est établi pour servir et valoir ce que de droit.
    </div>

    <div class="signature-section">
        <div>Dr MEITE Djoussoufou</div>
        <img src="data:image/png;base64,<?php echo e($signature); ?>" class="signature-image">
    </div>
</body>
</html><?php /**PATH /home/earljoe/Documents/freelance/Assignment 1/segmented/dsimi.org/resources/views/certificates/leave_daily.blade.php ENDPATH**/ ?>