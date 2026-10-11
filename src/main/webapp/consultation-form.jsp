<%@ page import="org.example.Models.Patient" %>
<%@ page import="org.example.Models.Person" %>
<%@ page import="java.util.List" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) return "Not recorded";
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>
<%
    Patient patient = (Patient) request.getAttribute("patient");
    List<Person> specialists = (List<Person>) request.getAttribute("specialists");
    String consultationError = (String) session.getAttribute("consultationError");
    session.removeAttribute("consultationError");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>General Practitioner Consultation</title>
</head>
<body class="min-h-screen bg-slate-50 text-slate-900">
    <header class="bg-white border border-gray-200 rounded-lg px-5 py-3 shadow-sm flex items-center justify-between">

    <!-- User -->
    <div>
        <p class="text-sm font-semibold text-gray-900">
            ${sessionScope.userName}
        </p>

        <p class="text-xs text-gray-500">
            ${sessionScope.role}
        </p>
    </div>

    <!-- Navigation -->
    <nav class="flex items-center gap-4">

        <form action="${pageContext.request.contextPath}/logout" method="POST">
            <button type="submit"
                class="px-3 py-1.5 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 transition-colors">
                Logout
            </button>
        </form>

    </nav>

</header>
<main class="mx-auto max-w-5xl px-4 py-8 sm:px-6">
    <header class="mb-6 flex flex-wrap items-center justify-between gap-4 border-b border-slate-200 pb-5">
        <div>
            <p class="text-sm font-semibold uppercase tracking-wide text-teal-700">General practice</p>
            <h1 class="mt-1 text-2xl font-bold">Patient consultation</h1>
        </div>
        <a href="${pageContext.request.contextPath}/consultation"
           class="inline-flex items-center gap-2 rounded-md border border-slate-300 bg-white px-4 py-2 text-sm font-semibold hover:bg-slate-100">
            <span aria-hidden="true">←</span> Waiting queue
        </a>
    </header>

    <% if (consultationError != null) { %>
        <p role="alert" class="mb-4 rounded-md border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-800"><%= escapeHtml(consultationError) %></p>
    <% } %>

    <section class="mb-6 border-y border-slate-200 bg-white py-5">
        <div class="flex flex-wrap items-start justify-between gap-3">
            <div>
                <p class="text-xs font-semibold uppercase text-slate-500">Patient record · PT-<%= patient.getId() %></p>
                <h2 class="mt-1 text-xl font-bold"><%= escapeHtml(patient.getFullName()) %></h2>
            </div>
            <span class="rounded-sm bg-amber-100 px-2.5 py-1 text-xs font-semibold text-amber-900">Waiting for GP</span>
        </div>

        <dl class="mt-5 grid grid-cols-1 gap-x-8 gap-y-4 text-sm sm:grid-cols-2 lg:grid-cols-3">
            <div><dt class="text-xs font-semibold uppercase text-slate-500">Email</dt><dd class="mt-1 break-words"><%= escapeHtml(patient.getEmail()) %></dd></div>
            <div><dt class="text-xs font-semibold uppercase text-slate-500">Phone</dt><dd class="mt-1"><%= escapeHtml(patient.getPhoneNumber()) %></dd></div>
            <div><dt class="text-xs font-semibold uppercase text-slate-500">National ID</dt><dd class="mt-1"><%= escapeHtml(patient.getSocialNumber()) %></dd></div>
            <div><dt class="text-xs font-semibold uppercase text-slate-500">Insurance</dt><dd class="mt-1"><%= patient.getHealthInsurance() == null ? "Not provided" : (patient.getHealthInsurance() ? "Active coverage" : "Self-pay") %></dd></div>
            <div><dt class="text-xs font-semibold uppercase text-slate-500">Medical history</dt><dd class="mt-1 whitespace-pre-wrap"><%= escapeHtml(patient.getMedicalHistory()) %></dd></div>
            <div><dt class="text-xs font-semibold uppercase text-slate-500">Medical state</dt><dd class="mt-1"><%= escapeHtml(patient.getMedicalState()) %></dd></div>
            <div><dt class="text-xs font-semibold uppercase text-slate-500">Allergies</dt><dd class="mt-1 whitespace-pre-wrap"><%= escapeHtml(patient.getAllergies()) %></dd></div>
            <div class="sm:col-span-2"><dt class="text-xs font-semibold uppercase text-slate-500">Current treatments</dt><dd class="mt-1 whitespace-pre-wrap"><%= escapeHtml(patient.getCurrentTreatments()) %></dd></div>
        </dl>

        <div class="mt-5 border-t border-slate-200 pt-4">
            <h3 class="text-xs font-semibold uppercase text-slate-500">Intake vital signs</h3>
            <dl class="mt-3 grid grid-cols-2 gap-4 text-sm sm:grid-cols-3 lg:grid-cols-6">
                <div><dt class="text-xs text-slate-500">Blood pressure</dt><dd class="mt-1 font-semibold"><%= escapeHtml(patient.getBloodPressure()) %> mmHg</dd></div>
                <div><dt class="text-xs text-slate-500">Heart rate</dt><dd class="mt-1 font-semibold"><%= patient.getHeartRate() %> bpm</dd></div>
                <div><dt class="text-xs text-slate-500">Temperature</dt><dd class="mt-1 font-semibold"><%= patient.getBodyTemperature() %> °F</dd></div>
                <div><dt class="text-xs text-slate-500">Respiratory rate</dt><dd class="mt-1 font-semibold"><%= patient.getRespiratoryRate() %> /min</dd></div>
                <div><dt class="text-xs text-slate-500">Weight</dt><dd class="mt-1 font-semibold"><%= patient.getWeight() %> kg</dd></div>
                <div><dt class="text-xs text-slate-500">Height</dt><dd class="mt-1 font-semibold"><%= patient.getHeight() %> cm</dd></div>
            </dl>
        </div>
    </section>

    <form action="${pageContext.request.contextPath}/consultation" method="post" class="space-y-5">
        <input type="hidden" name="patientId" value="<%= patient.getId() %>">
        <section class="space-y-4 border-y border-slate-200 bg-white py-5">
            <h2 class="text-base font-bold">Clinical consultation</h2>
            <label class="block text-sm font-semibold">Chief complaint
                <input name="reason" required maxlength="500" class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20">
            </label>
            <label class="block text-sm font-semibold">Symptoms reported by patient
                <textarea name="symptoms" required rows="3" class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20"></textarea>
            </label>
            <label class="block text-sm font-semibold">Physical examination
                <textarea name="examination" required rows="4" class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20"></textarea>
            </label>
            <label class="block text-sm font-semibold">Additional observations
                <textarea name="observations" rows="3" class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20"></textarea>
            </label>
            <fieldset class="space-y-3 border-y border-slate-200 py-4">
                <legend class="text-base font-bold">Request specialist review</legend>
                <p class="text-sm text-slate-600">Use this path when the diagnosis is unclear. The patient will leave the GP waiting queue and appear in the selected specialist's inbox.</p>
                <% if (specialists != null && !specialists.isEmpty()) { %>
                    <div class="grid gap-4 sm:grid-cols-2">
                        <label class="block text-sm font-semibold">Specialist
                            <select name="specialistId" required class="mt-1.5 w-full rounded-md border border-slate-300 bg-white px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20">
                                <option value="">Select a specialist</option>
                                <% for (Person specialist : specialists) { %>
                                    <option value="<%= specialist.getId() %>"><%= escapeHtml(specialist.getFullName()) %></option>
                                <% } %>
                            </select>
                        </label>
                        <label class="block text-sm font-semibold">Priority
                            <select name="priority" class="mt-1.5 w-full rounded-md border border-slate-300 bg-white px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20">
                                <option value="NORMAL">Normal</option>
                                <option value="URGENT">Urgent</option>
                                <option value="NON_URGENT">Non-urgent</option>
                            </select>
                        </label>
                    </div>
                    <label class="block text-sm font-semibold">Question for the specialist
                        <textarea name="specialistQuestion" required rows="3" placeholder="What do you need the specialist to assess?" class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20"></textarea>
                    </label>
                <% } else { %>
                    <p class="rounded-md bg-amber-50 px-3 py-2 text-sm text-amber-900">No specialist accounts are available. Create a specialist account before referring this patient.</p>
                <% } %>
            </fieldset>
            <label class="block text-sm font-semibold">Diagnosis
                <textarea name="diagnosis" required rows="2" class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20"></textarea>
            </label>
            <label class="block text-sm font-semibold">Prescribed treatment
                <textarea name="prescribedTreatment" required rows="3" placeholder="Include medicine, dose, and frequency, or state that no medication is prescribed." class="mt-1.5 w-full rounded-md border border-slate-300 px-3 py-2 font-normal focus:border-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-700/20"></textarea>
            </label>
        </section>
        <div class="flex flex-wrap justify-end gap-3">
            <a href="${pageContext.request.contextPath}/consultation" class="rounded-md px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100">Cancel</a>
            <% if (specialists != null && !specialists.isEmpty()) { %>
                <button type="submit" name="action" value="expertise" formnovalidate class="rounded-md border border-teal-800 px-5 py-2 text-sm font-semibold text-teal-900 hover:bg-teal-50">Request specialist review</button>
            <% } %>
            <button type="submit" name="action" value="complete" class="rounded-md bg-teal-800 px-5 py-2 text-sm font-semibold text-white hover:bg-teal-900">Close consultation</button>
        </div>
    </form>
</main>
</body>
</html>