<%@ page import="org.example.Models.Patient" %>

<%
    Patient patient = (Patient) request.getAttribute("patient");

    String patientName = (patient != null && patient.getFullName() != null)
            ? patient.getFullName()
            : "Unknown Patient";

    String initials = "PT";
    if (patientName != null && !patientName.trim().isEmpty()) {
        String[] nameParts = patientName.trim().split("\\s+");
        initials = "";
        for (String part : nameParts) {
            if (!part.isEmpty()) {
                initials += part.substring(0, 1).toUpperCase();
                if (initials.length() >= 2) break;
            }
        }
        if (initials.isEmpty()) initials = "PT";
    }

    String patientId = (patient != null) ? "PT-" + patient.getId() : "PT-0000";
    String email = (patient != null && patient.getEmail() != null) ? patient.getEmail() : "Not provided";
    String phone = (patient != null && patient.getPhoneNumber() != null) ? patient.getPhoneNumber() : "Not provided";
    String socialNumber = (patient != null && patient.getSocialNumber() != null) ? patient.getSocialNumber() : "Not provided";
    String insurance = (patient != null && patient.getHealthInsurance() != null) ? patient.getHealthInsurance() : "Not provided";
    int bloodPressure = (patient != null) ? patient.getBloodPressure() : 0;
    int heartRate = (patient != null) ? patient.getHeartRate() : 0;
    int temperature = (patient != null) ? patient.getBodyTemperature() : 0;
    int respiratoryRate = (patient != null) ? patient.getRespiratoryRate() : 0;
    int weight = (patient != null) ? patient.getWeight() : 0;
    int height = (patient != null) ? patient.getHeight() : 0;

    double bmi = 0;
    if (height > 0 && weight > 0) {
        bmi = weight / ((height / 100.0) * (height / 100.0));
    }

    String queueStatus = (patient != null && patient.getInQueue() == 1) ? "Waiting" : "Not in queue";
    String queueBadge = (patient != null && patient.getInQueue() == 1)
            ? "bg-secondary-container/40 text-secondary"
            : "bg-surface-container text-on-surface";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://cdn.tailwindcss.com"></script>

    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#003c90",
                        "primary-container": "#0f52ba",
                        "secondary": "#006a61",
                        "secondary-container": "#86f2e4",

                        "surface": "#f8f9ff",
                        "surface-container-low": "#eff4ff",
                        "surface-container": "#e5eeff",
                        "surface-container-high": "#dce9ff",
                        "surface-container-highest": "#d3e4fe",
                        "surface-container-lowest": "#ffffff",

                        "on-surface": "#0b1c30",
                        "on-surface-variant": "#434653",

                        "outline": "#737784",
                        "outline-variant": "#c3c6d5",

                        "error": "#ba1a1a",
                        "error-container": "#ffdad6",

                        "tertiary": "#860025",
                        "tertiary-container": "#b20035"
                    },

                    fontFamily: {
                        "body": ["Inter"],
                        "headline": ["Plus Jakarta Sans"],
                        "mono": ["JetBrains Mono"]
                    }
                }
            }
        };
    </script>

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600;700&family=Plus+Jakarta+Sans:wght@600;700&display=swap"
        rel="stylesheet">

    <style>
        @layer base {
            html,
            body {
                margin: 0;
                padding: 0;
            }

            body {
                overscroll-behavior: none;
            }
        }

        ::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>

<body class="bg-surface font-body text-on-surface">

    <main class="w-full min-h-screen px-4 md:px-8 py-6">

        <div class="max-w-5xl mx-auto flex flex-col gap-5">

            <section class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">
                <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                    <div class="flex items-center gap-4">
                        <div class="w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                            <span class="text-xl font-bold text-primary"><%= initials %></span>
                        </div>

                        <div>
                            <h1 class="font-headline text-xl font-bold text-on-surface"><%= patientName %></h1>
                            <p class="text-sm text-on-surface-variant mt-1">Patient ID: <%= patientId %></p>
                            <p class="text-xs text-outline mt-1">
                                <% if (patient != null) { %>
                                    Patient record loaded
                                <% } else { %>
                                    No patient found
                                <% } %>
                            </p>
                        </div>
                    </div>

                    <div class="flex flex-col md:items-end gap-1">
                        <span class="text-[11px] text-outline uppercase tracking-wide font-semibold">Patient Status</span>
                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-md <%= queueBadge %> text-xs font-semibold">
                            <span class="w-2 h-2 rounded-full bg-secondary"></span>
                            <%= queueStatus %>
                        </span>
                    </div>
                </div>
            </section>

            <section
                class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">

                <div class="flex items-center justify-between border-b border-outline-variant/20 pb-3 mb-4">

                    <div>

                        <h2 class="text-xs font-bold uppercase tracking-wide text-on-surface">
                            1. Demographics & Identification
                        </h2>

                        <p class="text-[11px] text-outline mt-1">
                            Patient identification and contact information
                        </p>

                    </div>

                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                    <div class="bg-surface-container-low rounded-md p-3">
                        <p class="text-[11px] text-outline uppercase font-semibold">Full Name</p>
                        <p class="text-sm font-medium text-on-surface mt-1"><%= patientName %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3">
                        <p class="text-[11px] text-outline uppercase font-semibold">Email</p>
                        <p class="text-sm font-medium text-on-surface mt-1 break-all"><%= email %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3">
                        <p class="text-[11px] text-outline uppercase font-semibold">Phone Number</p>
                        <p class="text-sm font-medium text-on-surface mt-1"><%= phone %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3">
                        <p class="text-[11px] text-outline uppercase font-semibold">National ID</p>
                        <p class="text-sm font-medium text-on-surface mt-1"><%= socialNumber %></p>
                    </div>
                </div>

                <div class="mt-4 pt-4 border-t border-outline-variant/20 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                    <div>
                        <p class="text-[11px] text-outline uppercase font-semibold">Health Insurance</p>
                        <p class="text-sm font-medium text-on-surface mt-1"><%= insurance %></p>
                    </div>
                    <span class="px-3 py-1 rounded-md bg-secondary-container/40 text-secondary text-xs font-semibold">
                        <% if ("Not provided".equals(insurance)) { %>UNAVAILABLE<% } else { %>COVERED<% } %>
                    </span>
                </div>

            </section>


            <!-- ================================================= -->
            <!-- VITAL SIGNS -->
            <!-- ================================================= -->

            <section
                class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">

                <div class="flex items-center justify-between border-b border-outline-variant/20 pb-3 mb-4">

                    <div>

                        <h2 class="text-xs font-bold uppercase tracking-wide text-on-surface">
                            2. Latest Vital Signs
                        </h2>

                        <p class="text-[11px] text-outline mt-1">
                            Most recently recorded measurements
                        </p>

                    </div>

                    <span
                        class="px-2 py-1 rounded bg-secondary-container/40 text-secondary text-[10px] font-semibold">
                        RECENT
                    </span>

                </div>


                <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
                    <div class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">
                        <p class="text-[11px] text-outline font-medium">Blood Pressure</p>
                        <p class="text-xl font-bold font-mono text-primary mt-2"><%= bloodPressure %></p>
                        <p class="text-[10px] text-outline mt-1">mmHg</p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">
                        <p class="text-[11px] text-outline font-medium">Heart Rate</p>
                        <p class="text-xl font-bold font-mono text-primary mt-2"><%= heartRate %></p>
                        <p class="text-[10px] text-outline mt-1">bpm</p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">
                        <p class="text-[11px] text-outline font-medium">Temperature</p>
                        <p class="text-xl font-bold font-mono text-primary mt-2"><%= temperature %></p>
                        <p class="text-[10px] text-outline mt-1">°F</p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">
                        <p class="text-[11px] text-outline font-medium">Respiratory Rate</p>
                        <p class="text-xl font-bold font-mono text-primary mt-2"><%= respiratoryRate %></p>
                        <p class="text-[10px] text-outline mt-1">breaths/min</p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">
                        <p class="text-[11px] text-outline font-medium">Weight</p>
                        <p class="text-xl font-bold font-mono text-primary mt-2"><%= weight %></p>
                        <p class="text-[10px] text-outline mt-1">kg</p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">
                        <p class="text-[11px] text-outline font-medium">Height</p>
                        <p class="text-xl font-bold font-mono text-primary mt-2"><%= height %></p>
                        <p class="text-[10px] text-outline mt-1">cm</p>
                    </div>
                </div>

                <div class="mt-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 bg-surface-container p-3 rounded-md">
                    <div>
                        <p class="text-[11px] text-outline uppercase font-semibold">Body Mass Index</p>
                        <p class="text-lg font-bold font-mono text-on-surface mt-1"><%= String.format("%.1f", bmi) %></p>
                    </div>
                    <span class="px-3 py-1 rounded-md bg-secondary-container/50 text-secondary text-xs font-semibold">
                        
                    </span>
                </div>

            </section>


            <section class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">
                <div class="border-b border-outline-variant/20 pb-3 mb-4">
                    <h2 class="text-xs font-bold uppercase tracking-wide text-on-surface">3. Full Patient Record</h2>
                    <p class="text-[11px] text-outline mt-1">All information saved in the current patient record</p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="bg-surface-container-low rounded-md p-4">
                        <p class="text-[11px] uppercase font-semibold text-outline">Patient ID</p>
                        <p class="mt-2 text-sm font-semibold text-on-surface"><%= patientId %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-4">
                        <p class="text-[11px] uppercase font-semibold text-outline">Queue Status</p>
                        <p class="mt-2 text-sm font-semibold text-on-surface"><%= queueStatus %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-4">
                        <p class="text-[11px] uppercase font-semibold text-outline">Email</p>
                        <p class="mt-2 text-sm font-semibold text-on-surface break-all"><%= email %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-4">
                        <p class="text-[11px] uppercase font-semibold text-outline">Phone Number</p>
                        <p class="mt-2 text-sm font-semibold text-on-surface"><%= phone %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-4">
                        <p class="text-[11px] uppercase font-semibold text-outline">Social Number</p>
                        <p class="mt-2 text-sm font-semibold text-on-surface"><%= socialNumber %></p>
                    </div>

                    <div class="bg-surface-container-low rounded-md p-4">
                        <p class="text-[11px] uppercase font-semibold text-outline">Insurance</p>
                        <p class="mt-2 text-sm font-semibold text-on-surface"><%= insurance %></p>
                    </div>
                </div>
            </section>


            <!-- ================================================= -->
            <!-- ACTIONS -->
            <!-- ================================================= -->

            <div class="flex flex-col sm:flex-row items-stretch sm:items-center justify-end gap-2 pt-1">

                <a
                href="${pageContext.request.contextPath}/consultation"
                    type="button"
                    class="px-4 py-2 rounded-md bg-surface-container text-xs font-semibold text-on-surface hover:bg-surface-container-high transition-colors">
                    Back to Patients
                </a>

                <a
                href="${pageContext.request.contextPath}/Specialist"
                    type="button"
                    class="px-4 py-2 rounded-md bg-primary text-xs font-semibold text-white hover:bg-primary-container transition-colors shadow-sm">
                    Send To Specialist
                </a>

            </div>

        </div>

    </main>

</body>

</html>