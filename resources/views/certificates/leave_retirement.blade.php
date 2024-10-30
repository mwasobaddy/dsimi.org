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
        CERTIFICAT DE CESSATION DE SERVICE
    </div>

    <div class="content">
        Je soussigné, Docteur MEITE Djoussoufou, Directeur des Soins Infirmiers, Maternels
        et Infantiles (DSIMI) certifie que {{ $leave->employee->gender == 'M' ? 'Monsieur' : 'Madame' }}
        {{ $leave->employee->name }}, matricule {{ $leave->employee->employee_id }},
        emploi {{ $leave->employee->position }}, précédemment au service de DSIMI,
        atteinte par l'âge limite statutaire, admis(e) à faire valoir ses droits à la retraite
        le {{ \Carbon\Carbon::parse($leave->end_date)->format('d/m/Y') }} conformément à
        l'arrêté n° {{ $leave->retirement_order_number }} du {{ $leave->retirement_order_date }}
        et radiée du contrôle des effectifs de la Fonction Publique à compter
        du {{ \Carbon\Carbon::parse($leave->end_date)->format('d/m/Y') }}, cessera
        définitivement service le {{ \Carbon\Carbon::parse($leave->end_date)->format('d/m/Y') }}.
    </div>

    <div class="content">
        En foi de quoi, le présent certificat est établi pour servir et valoir ce que de droit.
    </div>

    <div class="signature-section">
        <div>Dr MEITE Djoussoufou</div>
        <img src="data:image/png;base64,{{ $signature }}" class="signature-image">
    </div>
</body>
</html>
