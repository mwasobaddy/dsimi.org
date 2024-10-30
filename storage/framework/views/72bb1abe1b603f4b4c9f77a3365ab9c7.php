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
            margin: 20px 0;
            clear: both;
        }
        .title {
            text-align: center;
            font-weight: bold;
            margin: 20px 0;
            font-size: 14pt;
        }
        .content {
            text-align: justify;
            margin: 20px 0;
            clear: both;
        }
        .signature-section {
            margin-top: 50px;
            text-align: right;
        }
        .signature-image {
            max-width: 150px;
            height: auto;
            margin-top: 10px;
        }
        .date {
            text-align: right;
            margin: 20px 0;
            clear: both;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <!-- First header block -->
        <div class="header-block">
            <div class="logo-container">
            <?php if(isset($logo2)): ?>
            <img src="data:image/png;base64,<?php echo e($logo2); ?>" alt="Logo" class="logo">
        <?php endif; ?>            </div>
            <div class="header-text">
                <div>MINISTERE DE LA SANTE DE</div>
                <div>L'HYGIENE PUBLIQUE ET DE LA</div>
                <div>COUVERTURE MALADIE UNIVERSELLE</div>
            </div>
        </div>

        <!-- Second header block -->
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
        CERTIFICAT DE CESSATION DE SERVICE
    </div>

    <div class="content">
        Je soussigné, Docteur MEITE Djoussoufou, Directeur des Soins Infirmiers, Maternels
        et Infantiles (DSIMI) certifie que <?php echo e($leave->employee_title); ?> 
        <?php echo e($leave->employee_name); ?>, matricule <?php echo e($leave->employee_id); ?>, 
        emploi <?php echo e($leave->employee_position); ?> à ladite Direction, bénéficiaire de son 
        congé annuel de <?php echo e($leave->total_leave_days); ?> jours au titre de l'année <?php echo e(date('Y')); ?>, 
        cesse service le <?php echo e(\Carbon\Carbon::parse($leave->start_date)->format('d/m/Y')); ?>.
    </div>

    <div class="content">
        A l'issue de son congé, l'intéressé(e) reprendra service le 
        <?php echo e(\Carbon\Carbon::parse($leave->end_date)->addDays(1)->format('d/m/Y')); ?>, 
        à son poste habituel.
    </div>

    <div class="content">
        En foi de quoi, le présent certificat est établi pour servir et valoir ce que de droit.
    </div>

    <div class="signature-section">
        <div>Dr MEITE Djoussoufou</div>
        <?php if(isset($signature)): ?>
            <img src="data:image/png;base64,<?php echo e($signature); ?>" class="signature-image">
        <?php endif; ?>
    </div>
</body>
</html><?php /**PATH /home/earljoe/Documents/freelance/Assignment 1/segmented/dsimi.org (copy)/resources/views/certificates/leave_annual.blade.php ENDPATH**/ ?>