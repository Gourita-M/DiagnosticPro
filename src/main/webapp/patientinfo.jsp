<%@ page import="org.example.Models.Patient" %>

<%
    Patient patient = (Patient) request.getAttribute("patient");
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

            <!-- ================================================= -->
            <!-- PATIENT PROFILE -->
            <!-- ================================================= -->

            <section
                class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">

                <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">

                    <!-- Patient Identity -->

                    <div class="flex items-center gap-4">

                        <div
                            class="w-16 h-16 rounded-full bg-primary-fixed flex items-center justify-center shrink-0">

                            <span class="text-xl font-bold text-primary">
                                EV
                            </span>

                        </div>

                        <div>

                            <div class="flex items-center gap-2 flex-wrap">

                                <h1 class="font-headline text-xl font-bold text-on-surface">
                                    ${patient.fullName}
                                </h1>

                            </div>

                            <p class="text-sm text-on-surface-variant mt-1">
                                Patient ID: PT-90412
                            </p>

                            <p class="text-xs text-outline mt-1">
                                Female • 35 years old • Date of Birth: 14 March 1991
                            </p>

                        </div>

                    </div>

                    <!-- Patient Status -->

                    <div class="flex flex-col md:items-end gap-1">

                        <span class="text-[11px] text-outline uppercase tracking-wide font-semibold">
                            Patient Status
                        </span>

                        <span
                            class="inline-flex items-center gap-1.5 px-3 py-1 rounded-md bg-secondary-container/40 text-secondary text-xs font-semibold">

                            <span class="w-2 h-2 rounded-full bg-secondary"></span>

                            Under Care

                        </span>

                    </div>

                </div>

            </section>

            <!-- ================================================= -->
            <!-- DEMOGRAPHICS & CONTACT -->
            <!-- ================================================= -->

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

                    <!-- Full Name -->

                    <div class="bg-surface-container-low rounded-md p-3">

                        <p class="text-[11px] text-outline uppercase font-semibold">
                            Full Name
                        </p>

                        <p class="text-sm font-medium text-on-surface mt-1">
                            ${patient.fullName}
                        </p>

                    </div>


                    <!-- Email -->

                    <div class="bg-surface-container-low rounded-md p-3">

                        <p class="text-[11px] text-outline uppercase font-semibold">
                            Email
                        </p>

                        <p class="text-sm font-medium text-on-surface mt-1 break-all">
                            ${patient.getEmail()}
                        </p>

                    </div>


                    <!-- Phone -->

                    <div class="bg-surface-container-low rounded-md p-3">

                        <p class="text-[11px] text-outline uppercase font-semibold">
                            Phone Number
                        </p>

                        <p class="text-sm font-medium text-on-surface mt-1">
                            +1 (555) 234-5678
                        </p>

                    </div>


                    <!-- National ID -->

                    <div class="bg-surface-container-low rounded-md p-3">

                        <p class="text-[11px] text-outline uppercase font-semibold">
                            National ID
                        </p>

                        <p class="text-sm font-medium text-on-surface mt-1">
                            ••• - •• - 4829
                        </p>

                    </div>

                </div>


                <!-- Insurance -->

                <div
                    class="mt-4 pt-4 border-t border-outline-variant/20 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">

                    <div>

                        <p class="text-[11px] text-outline uppercase font-semibold">
                            Health Insurance
                        </p>

                        <p class="text-sm font-medium text-on-surface mt-1">
                            Active Coverage
                        </p>

                    </div>

                    <span
                        class="px-3 py-1 rounded-md bg-secondary-container/40 text-secondary text-xs font-semibold">
                        COVERED
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

                    <!-- Blood Pressure -->

                    <div
                        class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">

                        <p class="text-[11px] text-outline font-medium">
                            Blood Pressure
                        </p>

                        <p class="text-xl font-bold font-mono text-primary mt-2">
                            120/80
                        </p>

                        <p class="text-[10px] text-outline mt-1">
                            mmHg
                        </p>

                    </div>


                    <!-- Heart Rate -->

                    <div
                        class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">

                        <p class="text-[11px] text-outline font-medium">
                            Heart Rate
                        </p>

                        <p class="text-xl font-bold font-mono text-primary mt-2">
                            72
                        </p>

                        <p class="text-[10px] text-outline mt-1">
                            bpm
                        </p>

                    </div>


                    <!-- Temperature -->

                    <div
                        class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">

                        <p class="text-[11px] text-outline font-medium">
                            Temperature
                        </p>

                        <p class="text-xl font-bold font-mono text-primary mt-2">
                            98.6
                        </p>

                        <p class="text-[10px] text-outline mt-1">
                            °F
                        </p>

                    </div>


                    <!-- Respiratory -->

                    <div
                        class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">

                        <p class="text-[11px] text-outline font-medium">
                            Respiratory Rate
                        </p>

                        <p class="text-xl font-bold font-mono text-primary mt-2">
                            16
                        </p>

                        <p class="text-[10px] text-outline mt-1">
                            breaths/min
                        </p>

                    </div>


                    <!-- Weight -->

                    <div
                        class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">

                        <p class="text-[11px] text-outline font-medium">
                            Weight
                        </p>

                        <p class="text-xl font-bold font-mono text-primary mt-2">
                            68
                        </p>

                        <p class="text-[10px] text-outline mt-1">
                            kg
                        </p>

                    </div>


                    <!-- Height -->

                    <div
                        class="bg-surface-container-low rounded-md p-3 border border-outline-variant/10">

                        <p class="text-[11px] text-outline font-medium">
                            Height
                        </p>

                        <p class="text-xl font-bold font-mono text-primary mt-2">
                            175
                        </p>

                        <p class="text-[10px] text-outline mt-1">
                            cm
                        </p>

                    </div>

                </div>


                <!-- BMI -->

                <div
                    class="mt-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 bg-surface-container p-3 rounded-md">

                    <div>

                        <p class="text-[11px] text-outline uppercase font-semibold">
                            Body Mass Index
                        </p>

                        <p class="text-lg font-bold font-mono text-on-surface mt-1">
                            22.2
                        </p>

                    </div>

                    <span
                        class="px-3 py-1 rounded-md bg-secondary-container/50 text-secondary text-xs font-semibold">
                        Healthy Normal Weight
                    </span>

                </div>

            </section>


            <!-- ================================================= -->
            <!-- MEDICAL CONDITIONS -->
            <!-- ================================================= -->

            <section
                class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">

                <div class="flex items-center justify-between border-b border-outline-variant/20 pb-3 mb-4">

                    <div>

                        <h2 class="text-xs font-bold uppercase tracking-wide text-on-surface">
                            3. Medical Conditions & Treatment
                        </h2>

                        <p class="text-[11px] text-outline mt-1">
                            Current medical conditions and treatments
                        </p>

                    </div>

                    <span
                        class="px-2 py-1 rounded bg-tertiary-fixed-dim/30 text-tertiary text-[10px] font-semibold">
                        1 CONDITION
                    </span>

                </div>


                <!-- Condition -->

                <div
                    class="border border-outline-variant/30 rounded-lg overflow-hidden">

                    <div
                        class="bg-surface-container-low px-4 py-3 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">

                        <div>

                            <h3 class="text-sm font-semibold text-on-surface">
                                Type 2 Diabetes Mellitus
                            </h3>

                            <p class="text-[11px] text-outline mt-1">
                                ICD-10: E11.9
                            </p>

                        </div>

                        <span
                            class="px-2 py-1 rounded-md bg-secondary-container/40 text-secondary text-[11px] font-semibold">
                            STABLE / MANAGED
                        </span>

                    </div>


                    <div class="p-4 grid grid-cols-1 md:grid-cols-2 gap-4">

                        <!-- Treatment -->

                        <div>

                            <p class="text-[11px] uppercase font-semibold text-outline">
                                Current Treatments
                            </p>

                            <div class="mt-2 space-y-2">

                                <div
                                    class="flex items-center justify-between bg-surface-container-low rounded-md px-3 py-2">

                                    <span class="text-sm text-on-surface">
                                        Metformin
                                    </span>

                                    <span class="text-xs font-mono text-outline">
                                        500mg PO BID
                                    </span>

                                </div>

                                <div
                                    class="flex items-center justify-between bg-surface-container-low rounded-md px-3 py-2">

                                    <span class="text-sm text-on-surface">
                                        Lisinopril
                                    </span>

                                    <span class="text-xs font-mono text-outline">
                                        10mg
                                    </span>

                                </div>

                            </div>

                        </div>


                        <!-- Clinical State -->

                        <div>

                            <p class="text-[11px] uppercase font-semibold text-outline">
                                Clinical State
                            </p>

                            <div
                                class="mt-2 bg-surface-container-low rounded-md p-3">

                                <p class="text-sm text-on-surface">
                                    Stable / Managed
                                </p>

                                <p class="text-xs text-outline mt-1">
                                    Patient is currently receiving ongoing treatment.
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </section>


            <!-- ================================================= -->
            <!-- CARE INFORMATION -->
            <!-- ================================================= -->

            <section
                class="bg-surface-container-lowest rounded-lg p-5 shadow-sm border border-outline-variant/30">

                <div class="border-b border-outline-variant/20 pb-3 mb-4">

                    <h2 class="text-xs font-bold uppercase tracking-wide text-on-surface">
                        4. Care Information
                    </h2>

                    <p class="text-[11px] text-outline mt-1">
                        Current patient care status
                    </p>

                </div>


                <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">

                    <!-- Queue -->

                    <div class="bg-surface-container-low rounded-md p-4">

                        <p class="text-[11px] uppercase font-semibold text-outline">
                            Queue Status
                        </p>

                        <div class="flex items-center gap-2 mt-2">

                            <span class="w-2.5 h-2.5 rounded-full bg-secondary"></span>

                            <span class="text-sm font-semibold text-secondary">
                                Waiting
                            </span>

                        </div>

                    </div>


                    <!-- Last Visit -->

                    <div class="bg-surface-container-low rounded-md p-4">

                        <p class="text-[11px] uppercase font-semibold text-outline">
                            Last Assessment
                        </p>

                        <p class="text-sm font-semibold text-on-surface mt-2">
                            08 October 2026
                        </p>

                    </div>


                    <!-- Priority -->

                    <div class="bg-surface-container-low rounded-md p-4">

                        <p class="text-[11px] uppercase font-semibold text-outline">
                            Priority
                        </p>

                        <span
                            class="inline-flex mt-2 px-2.5 py-1 rounded-md bg-error-container text-error text-xs font-semibold">
                            URGENT
                        </span>

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