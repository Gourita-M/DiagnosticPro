<%@ page import="java.util.List" %>
<%@ page import="org.example.Models.ExpertiseRequest" %>
<%@ page import="org.example.Models.Patient" %>
<%!
    private String escapeHtml(String value) {
        if (value == null || value.isBlank()) return "Not recorded";
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>
<%
    List<ExpertiseRequest> expertiseRequests = (List<ExpertiseRequest>) request.getAttribute("expertiseRequests");
    if (expertiseRequests == null) expertiseRequests = List.of();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Specialist Referrals</title>
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
<main class="mx-auto max-w-6xl px-4 py-8 sm:px-6">
    <header class="mb-7 flex flex-wrap items-end justify-between gap-4 border-b border-slate-200 pb-5">
        <div>
            <p class="text-sm font-semibold uppercase tracking-wide text-teal-700">Specialist service</p>
            <h1 class="mt-1 text-2xl font-bold">Expertise requests</h1>
        </div>
        <p class="text-sm text-slate-600"><%= expertiseRequests.size() %> referred patient<%= expertiseRequests.size() == 1 ? "" : "s" %></p>
    </header>

    <% if (expertiseRequests.isEmpty()) { %>
        <section class="border-y border-slate-200 bg-white px-5 py-12 text-center">
            <h2 class="text-lg font-semibold">No referrals yet</h2>
            <p class="mt-2 text-sm text-slate-600">Patients referred by general practitioners will appear here.</p>
        </section>
    <% } else { %>
        <section class="divide-y divide-slate-200 border-y border-slate-200 bg-white">
            <% for (ExpertiseRequest expertiseRequest : expertiseRequests) {
                Patient patient = expertiseRequest.getPatient();
            %>
                <article class="px-4 py-5 sm:px-6">
                    <div class="flex flex-wrap items-start justify-between gap-3">
                        <div>
                            <p class="text-xs font-semibold uppercase text-slate-500">Request #<%= expertiseRequest.getId() %> · Patient PT-<%= patient.getId() %></p>
                            <h2 class="mt-1 text-lg font-bold"><%= escapeHtml(patient.getFullName()) %></h2>
                            <p class="mt-1 text-sm text-slate-600">Referred by <%= escapeHtml(expertiseRequest.getPractitioner().getFullName()) %></p>
                        </div>
                        <div class="flex flex-wrap gap-2 text-xs font-semibold">
                            <span class="rounded-sm bg-amber-100 px-2.5 py-1 text-amber-900"><%= expertiseRequest.getPriority().name().replace('_', '-') %></span>
                            <span class="rounded-sm bg-slate-100 px-2.5 py-1 text-slate-700"><%= expertiseRequest.getStatus().name() %></span>
                        </div>
                    </div>

                    <div class="mt-5 grid gap-x-8 gap-y-4 text-sm sm:grid-cols-2 lg:grid-cols-4">
                        <div><p class="text-xs font-semibold uppercase text-slate-500">Phone</p><p class="mt-1"><%= escapeHtml(patient.getPhoneNumber()) %></p></div>
                        <div><p class="text-xs font-semibold uppercase text-slate-500">Allergies</p><p class="mt-1 whitespace-pre-wrap"><%= escapeHtml(patient.getAllergies()) %></p></div>
                        <div class="sm:col-span-2"><p class="text-xs font-semibold uppercase text-slate-500">Current treatments</p><p class="mt-1 whitespace-pre-wrap"><%= escapeHtml(patient.getCurrentTreatments()) %></p></div>
                    </div>

                    <div class="mt-5 border-l-2 border-teal-700 bg-slate-50 px-4 py-3">
                        <h3 class="text-xs font-semibold uppercase text-slate-500">Clinical question and GP notes</h3>
                        <p class="mt-2 whitespace-pre-wrap text-sm leading-6"><%= escapeHtml(expertiseRequest.getQuestion()) %></p>
                    </div>
                </article>
            <% } %>
        </section>
    <% } %>
</main>
</body>
</html>