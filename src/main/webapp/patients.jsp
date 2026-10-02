<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Registered Patients</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600;700&family=Plus+Jakarta+Sans:wght@600;700&display=swap" rel="stylesheet">

    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Inter", sans-serif;
            background: #f8f9ff;
            color: #0b1c30;
            min-height: 100vh;
        }

        .page {
            width: 100%;
            min-height: 100vh;
            padding: 24px;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }

        /* --------------------------------
           Header
        -------------------------------- */

        .header {
            background: #ffffff;
            border: 1px solid #c3c6d5;
            border-radius: 10px;
            padding: 18px 20px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 16px;

            box-shadow: 0 2px 6px rgba(11, 28, 48, 0.05);
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-icon {
            width: 42px;
            height: 42px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;
            background: #d9e2ff;
            color: #003c90;
        }

        .header-icon span {
            font-size: 22px;
        }

        .header h1 {
            font-family: "Plus Jakarta Sans", sans-serif;
            font-size: 20px;
            font-weight: 700;
        }

        .header p {
            margin-top: 3px;
            color: #434653;
            font-size: 12px;
        }

        .patient-count {
            padding: 6px 10px;
            border-radius: 6px;

            background: #eff4ff;
            color: #003c90;

            font-size: 12px;
            font-weight: 600;
        }

        /* --------------------------------
           Toolbar
        -------------------------------- */

        .toolbar {
            background: #ffffff;
            border: 1px solid #c3c6d5;
            border-radius: 10px;

            padding: 12px;

            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;

            margin-bottom: 16px;
        }

        .search-box {
            position: relative;
            flex: 1;
        }

        .search-box span {
            position: absolute;
            left: 11px;
            top: 50%;
            transform: translateY(-50%);

            color: #737784;
            font-size: 19px;
        }

        .search-box input {
            width: 100%;

            padding: 9px 12px 9px 38px;

            border: 1px solid transparent;
            border-radius: 7px;

            background: #eff4ff;
            color: #0b1c30;

            font-size: 12px;
            font-family: "Inter", sans-serif;

            outline: none;
        }

        .search-box input:focus {
            background: #ffffff;
            border-color: #003c90;
        }

        .date-filter {
            padding: 9px 12px;

            border: 1px solid transparent;
            border-radius: 7px;

            background: #eff4ff;

            color: #0b1c30;
            font-family: "Inter", sans-serif;
            font-size: 12px;

            outline: none;
        }

        .add-button {
            display: flex;
            align-items: center;
            gap: 7px;

            padding: 9px 14px;

            border: none;
            border-radius: 7px;

            background: #003c90;
            color: #ffffff;

            font-size: 12px;
            font-weight: 600;

            text-decoration: none;

            cursor: pointer;
        }

        .add-button:hover {
            background: #0f52ba;
        }

        .add-button span {
            font-size: 18px;
        }

        /* --------------------------------
           Patients Card
        -------------------------------- */

        .patients-card {
            background: #ffffff;
            border: 1px solid #c3c6d5;
            border-radius: 10px;

            box-shadow: 0 2px 6px rgba(11, 28, 48, 0.05);

            overflow: hidden;
        }

        .card-header {
            padding: 14px 16px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            border-bottom: 1px solid #e1e4ed;
        }

        .card-header h2 {
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .card-header span {
            font-family: "JetBrains Mono", monospace;
            font-size: 11px;
            color: #737784;
        }

        /* --------------------------------
           Table
        -------------------------------- */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #eff4ff;
        }

        th {
            padding: 11px 14px;

            text-align: left;

            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.4px;

            color: #434653;

            white-space: nowrap;
        }

        td {
            padding: 13px 14px;

            border-top: 1px solid #e7e9f0;

            font-size: 12px;
            color: #0b1c30;

            white-space: nowrap;
        }

        tbody tr:hover {
            background: #f8f9ff;
        }

        /* --------------------------------
           Patient Identity
        -------------------------------- */

        .patient {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .patient-avatar {
            width: 34px;
            height: 34px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #d9e2ff;
            color: #003c90;

            font-size: 11px;
            font-weight: 700;
        }

        .patient-name {
            font-weight: 600;
        }

        .patient-id {
            margin-top: 2px;

            font-family: "JetBrains Mono", monospace;
            font-size: 10px;

            color: #737784;
        }

        /* --------------------------------
           Vital Signs
        -------------------------------- */

        .vitals {
            display: flex;
            gap: 5px;
        }

        .vital {
            padding: 4px 6px;

            border-radius: 5px;

            background: #eff4ff;

            font-family: "JetBrains Mono", monospace;
            font-size: 10px;

            color: #434653;
        }

        /* --------------------------------
           Status
        -------------------------------- */

        .status {
            display: inline-flex;
            align-items: center;
            gap: 5px;

            padding: 4px 7px;

            border-radius: 5px;

            font-size: 10px;
            font-weight: 600;
        }

        .status-active {
            background: #e2f7f3;
            color: #006a61;
        }

        .status-waiting {
            background: #fff3d6;
            color: #855f00;
        }

        .status-completed {
            background: #e8edf7;
            color: #434653;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }

        /* --------------------------------
           Actions
        -------------------------------- */

        .actions {
            display: flex;
            gap: 6px;
        }

        .action-button {
            width: 30px;
            height: 30px;

            display: flex;
            align-items: center;
            justify-content: center;

            border: 1px solid #c3c6d5;
            border-radius: 6px;

            background: #ffffff;
            color: #434653;

            text-decoration: none;
        }

        .action-button:hover {
            background: #eff4ff;
            color: #003c90;
            border-color: #b0c6ff;
        }

        .action-button span {
            font-size: 17px;
        }

        /* --------------------------------
           Empty State
        -------------------------------- */

        .empty-state {
            padding: 55px 20px;

            text-align: center;

            display: none;
        }

        .empty-icon {
            width: 48px;
            height: 48px;

            margin: 0 auto 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #eff4ff;
            color: #003c90;
        }

        .empty-state h3 {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .empty-state p {
            color: #737784;
            font-size: 12px;
        }

        /* --------------------------------
           Responsive
        -------------------------------- */

        @media (max-width: 700px) {

            .page {
                padding: 12px;
            }

            .header {
                padding: 14px;
            }

            .toolbar {
                flex-direction: column;
                align-items: stretch;
            }

            .add-button {
                justify-content: center;
            }

            .date-filter {
                width: 100%;
            }

            .patient-count {
                display: none;
            }
        }

    </style>
</head>

<body>

<div class="page">

    <div class="container">

        <!-- HEADER -->
        <header class="header">

            <div class="header-left">

                <div class="header-icon">
                    <span class="material-symbols-outlined">
                        group
                    </span>
                </div>

                <div>
                    <h1>Registered Patients</h1>
                    <p>Nurse patient registry and daily intake records</p>
                </div>

            </div>

            <div class="patient-count">
                8 Patients Today
            </div>

        </header>


        <!-- TOOLBAR -->
        <div class="toolbar">

            <div class="search-box">

                <span class="material-symbols-outlined">
                    search
                </span>

                <input
                    type="text"
                    placeholder="Search by name, patient ID or national ID..."
                >

            </div>

            <input
                class="date-filter"
                type="date"
                value="2026-10-02"
            >

            <a href="#" class="add-button">

                <span class="material-symbols-outlined">
                    person_add
                </span>

                Add Patient

            </a>

        </div>


        <!-- PATIENTS -->
        <section class="patients-card">

            <div class="card-header">

                <h2>Patient Registry</h2>

                <span>02 OCT 2026</span>

            </div>


            <div class="table-wrapper">

                <table>

                    <thead>

                    <tr>

                        <th>Patient</th>

                        <th>Arrival</th>

                        <th>National ID</th>

                        <th>Vital Signs</th>

                        <th>Insurance</th>

                        <th>Status</th>

                        <th>Actions</th>

                    </tr>

                    </thead>


                    <tbody>

                    <!-- Patient 1 -->

                    <tr>

                        <td>

                            <div class="patient">

                                <div class="patient-avatar">
                                    EA
                                </div>

                                <div>

                                    <div class="patient-name">
                                        Eleanor Adams
                                    </div>

                                    <div class="patient-id">
                                        PT-00124
                                    </div>

                                </div>

                            </div>

                        </td>

                        <td>
                            08:42
                        </td>

                        <td>
                            ********4829
                        </td>

                        <td>

                            <div class="vitals">

                                <span class="vital">
                                    120/80
                                </span>

                                <span class="vital">
                                    72 bpm
                                </span>

                                <span class="vital">
                                    37.0°C
                                </span>

                            </div>

                        </td>

                        <td>
                            Active
                        </td>

                        <td>

                            <span class="status status-waiting">

                                <span class="status-dot"></span>

                                Waiting

                            </span>

                        </td>

                        <td>

                            <div class="actions">

                                <a href="#" class="action-button" title="View">

                                    <span class="material-symbols-outlined">
                                        visibility
                                    </span>

                                </a>

                                <a href="#" class="action-button" title="Edit">

                                    <span class="material-symbols-outlined">
                                        edit
                                    </span>

                                </a>

                            </div>

                        </td>

                    </tr>


                    <!-- Patient 2 -->

                    <tr>

                        <td>

                            <div class="patient">

                                <div class="patient-avatar">
                                    JM
                                </div>

                                <div>

                                    <div class="patient-name">
                                        James Miller
                                    </div>

                                    <div class="patient-id">
                                        PT-00125
                                    </div>

                                </div>

                            </div>

                        </td>

                        <td>
                            09:05
                        </td>

                        <td>
                            ********1732
                        </td>

                        <td>

                            <div class="vitals">

                                <span class="vital">
                                    128/82
                                </span>

                                <span class="vital">
                                    78 bpm
                                </span>

                                <span class="vital">
                                    36.8°C
                                </span>

                            </div>

                        </td>

                        <td>
                            Active
                        </td>

                        <td>

                            <span class="status status-active">

                                <span class="status-dot"></span>

                                In Consultation

                            </span>

                        </td>

                        <td>

                            <div class="actions">

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        visibility
                                    </span>

                                </a>

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        edit
                                    </span>

                                </a>

                            </div>

                        </td>

                    </tr>


                    <!-- Patient 3 -->

                    <tr>

                        <td>

                            <div class="patient">

                                <div class="patient-avatar">
                                    SO
                                </div>

                                <div>

                                    <div class="patient-name">
                                        Sarah Olsen
                                    </div>

                                    <div class="patient-id">
                                        PT-00126
                                    </div>

                                </div>

                            </div>

                        </td>

                        <td>
                            09:21
                        </td>

                        <td>
                            ********8341
                        </td>

                        <td>

                            <div class="vitals">

                                <span class="vital">
                                    118/76
                                </span>

                                <span class="vital">
                                    69 bpm
                                </span>

                                <span class="vital">
                                    36.7°C
                                </span>

                            </div>

                        </td>

                        <td>
                            Self-Pay
                        </td>

                        <td>

                            <span class="status status-waiting">

                                <span class="status-dot"></span>

                                Waiting

                            </span>

                        </td>

                        <td>

                            <div class="actions">

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        visibility
                                    </span>

                                </a>

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        edit
                                    </span>

                                </a>

                            </div>

                        </td>

                    </tr>


                    <!-- Patient 4 -->

                    <tr>

                        <td>

                            <div class="patient">

                                <div class="patient-avatar">
                                    RK
                                </div>

                                <div>

                                    <div class="patient-name">
                                        Robert King
                                    </div>

                                    <div class="patient-id">
                                        PT-00127
                                    </div>

                                </div>

                            </div>

                        </td>

                        <td>
                            09:47
                        </td>

                        <td>
                            ********2940
                        </td>

                        <td>

                            <div class="vitals">

                                <span class="vital">
                                    122/79
                                </span>

                                <span class="vital">
                                    74 bpm
                                </span>

                                <span class="vital">
                                    37.1°C
                                </span>

                            </div>

                        </td>

                        <td>
                            Active
                        </td>

                        <td>

                            <span class="status status-completed">

                                <span class="status-dot"></span>

                                Completed

                            </span>

                        </td>

                        <td>

                            <div class="actions">

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        visibility
                                    </span>

                                </a>

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        edit
                                    </span>

                                </a>

                            </div>

                        </td>

                    </tr>


                    <!-- Patient 5 -->

                    <tr>

                        <td>

                            <div class="patient">

                                <div class="patient-avatar">
                                    LM
                                </div>

                                <div>

                                    <div class="patient-name">
                                        Laura Martin
                                    </div>

                                    <div class="patient-id">
                                        PT-00128
                                    </div>

                                </div>

                            </div>

                        </td>

                        <td>
                            10:12
                        </td>

                        <td>
                            ********6183
                        </td>

                        <td>

                            <div class="vitals">

                                <span class="vital">
                                    130/85
                                </span>

                                <span class="vital">
                                    81 bpm
                                </span>

                                <span class="vital">
                                    37.2°C
                                </span>

                            </div>

                        </td>

                        <td>
                            Active
                        </td>

                        <td>

                            <span class="status status-waiting">

                                <span class="status-dot"></span>

                                Waiting

                            </span>

                        </td>

                        <td>

                            <div class="actions">

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        visibility
                                    </span>

                                </a>

                                <a href="#" class="action-button">

                                    <span class="material-symbols-outlined">
                                        edit
                                    </span>

                                </a>

                            </div>

                        </td>

                    </tr>

                    </tbody>

                </table>

            </div>


            <!-- Pagination -->

            <div style="
                padding: 12px 16px;
                border-top: 1px solid #e1e4ed;
                display: flex;
                justify-content: space-between;
                align-items: center;
            ">

                <span style="
                    font-size: 11px;
                    color: #737784;
                ">
                    Showing 1–5 of 8 patients
                </span>

                <div style="display:flex; gap:5px;">

                    <button class="action-button">
                        <span class="material-symbols-outlined">
                            chevron_left
                        </span>
                    </button>

                    <button
                        style="
                            width:30px;
                            height:30px;
                            border:none;
                            border-radius:6px;
                            background:#003c90;
                            color:white;
                            font-size:11px;
                            font-weight:600;
                        ">
                        1
                    </button>

                    <button class="action-button">
                        <span class="material-symbols-outlined">
                            chevron_right
                        </span>
                    </button>

                </div>

            </div>

        </section>

    </div>

</div>

</body>
</html>
