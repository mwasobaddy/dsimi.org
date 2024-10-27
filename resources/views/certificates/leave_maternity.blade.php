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
        }
        .content {
            text-align: justify;
            margin: 20px 0;
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
        Abidjan, le {{ $date }}
    </div>

    <div class="reference">
        N°___________ /MSHPCMU/DGS/DSIMI
    </div>

    <div class="title">
        ATTESTATION DE REPRISE DE SERVICE
    </div>

    <div class="content">
        Je soussigné, Docteur MEITE Djoussoufou, Directeur de la Direction des Soins
        Infirmiers Maternels et Infantiles, atteste que :
    </div>

    <div class="content" style="margin-left: 40px;">
        Madame : {{ $leave->employee_name }}<br>
        Matricule : {{ $leave->employee_id }}<br>
        Emploi : {{ $leave->employee_position }}<br>
        <!-- Grade : {{ $leave->employee_}}<br> -->
        Service : DSIMI<br>
    </div>

    <div class="content">
        A effectivement repris fonction le {{ \Carbon\Carbon::parse($leave->end_date)->addDays(1)->format('d/m/Y') }}
    </div>

    <div class="content">
        Motif : de retour de son congé de maternité de 14 semaines valable du 
        {{ \Carbon\Carbon::parse($leave->start_date)->format('d/m/Y') }} 
        au {{ \Carbon\Carbon::parse($leave->end_date)->format('d/m/Y') }} inclus.
    </div>

    <div class="signature-section">
        <div>Dr MEITE Djoussoufou</div>
        <img src="data:image/png;base64,{{ $signature }}" class="signature-image">
    </div>
</body>
</html>
