<%@ page import="java.util.List" %>
    <%@ page import="org.example.Models.Patient" %>

        <% List<Patient> patients = (List<Patient>) request.getAttribute("patients");
                %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <script src="https://cdn.tailwindcss.com"></script>
                    <title>Registered Patients</title>

                    <!-- Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

                    <link
                        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600;700&family=Plus+Jakarta+Sans:wght@600;700&display=swap"
                        rel="stylesheet">

                    <!-- Material Icons -->
                    <link
                        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
                        rel="stylesheet">

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
                                        <h1>Consultation Management</h1>

                                    </div>

                                </div>

                                <div class="patient-count">
                                    8 Patients Today
                                </div>

                            </header>

                            <div class="toolbar">

                                <div class="search-box">

                                    <span class="material-symbols-outlined">
                                        search
                                    </span>

                                    <input type="text" placeholder="Search by name, patient ID or national ID...">

                                </div>

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

                                                <th>Insurance</th>

                                                <th>Status</th>

                                                <th>Actions</th>

                                            </tr>

                                        </thead>


                                        <tbody>

                                            <!-- Patient 1 -->
                                            <% for (Patient patient : patients) { %>

                                                <tr>

                                                    <td>

                                                        <div class="patient">

                                                            <div class="patient-avatar">
                                                                EA
                                                            </div>

                                                            <div>

                                                                <div class="patient-name">
                                                                    <%= patient.getFullName() %>
                                                                </div>

                                                                <div class="patient-id">
                                                                    PT-00124
                                                                </div>

                                                            </div>

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
                                                    <!-- <td>

                            <span class="status status-active">

                                <span class="status-dot"></span>

                                In Consultation

                            </span>

                        </td> -->

                                              <td>
    <div class="actions flex items-center gap-2">

        <form action="${pageContext.request.contextPath}/"
              method="GET">

            <input type="hidden"
                   name="patientId"
                   value="<%= patient.getId() %>">

            <button type="submit"
                    class="inline-flex items-center gap-2
                           rounded-lg bg-gray-600 px-4 py-2
                           text-sm font-semibold text-white
                           shadow-sm
                           transition-all duration-200
                           hover:bg-gray-700 hover:shadow-md
                           active:scale-95"
                    title="View patient">

                <span class="material-symbols-outlined text-[18px]">
                    visibility
                </span>

                View
            </button>
        </form>

    </div>
</td>

                                                </tr>

                                                <% } %>

                                        </tbody>

                                    </table>

                                </div>

                            </section>

                        </div>

                    </div>

                    <script>
                        //error and success popup logic

                        function showSuccess() {
                            const popup = document.getElementById("successPopup");

                            popup.classList.remove("hidden");

                            setTimeout(() => {
                                popup.classList.add("hidden");
                            }, 5000);
                        }

                        function showError() {
                            const popup = document.getElementById("errorPopup");

                            popup.classList.remove("hidden");

                            setTimeout(() => {
                                popup.classList.add("hidden");
                            }, 5000);
                        }

                    </script>

                    <% if(session.getAttribute("success") !=null){ %>
                        <!-- SUCCESS POPUP -->
                        <div id="successPopup"
                            class="fixed top-5 right-5 z-50 hidden w-80 rounded-lg border border-green-200 bg-white p-4 shadow-lg">

                            <div class="flex items-start gap-3">

                                <div>
                                    <h3 class="font-semibold text-green-700">
                                        <%= session.getAttribute("success") %>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <script>showSuccess()</script>
                        <% } %>

                            <% if(session.getAttribute("error") !=null){ %>
                                <!-- ERROR POPUP -->
                                <div id="errorPopup"
                                    class="fixed top-5 right-5 z-50 hidden w-80 rounded-lg border border-red-200 bg-white p-4 shadow-lg">

                                    <div class="flex items-start gap-3">

                                        <div>
                                            <h3 class="font-semibold text-red-700">
                                                <%= session.getAttribute("error") %>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                                <script>showError()</script>
                                <% } %>
                </body>

                </html>