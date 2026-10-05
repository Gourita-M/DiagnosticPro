<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="bg-white w-full max-w-md p-8 rounded-2xl shadow-lg">

        <h1 class="text-3xl font-bold text-center text-gray-800 mb-6">
            Login
        </h1>

<form action="${pageContext.request.contextPath}/login" method="post" class="space-y-5">

            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">
                    Email
                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email"
                    required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">
                    Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
            </div>

            <button
                type="submit"
                class="w-full bg-blue-600 text-white py-2 rounded-lg font-semibold hover:bg-blue-700 transition"
            >
                Login
            </button>

        </form>

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

<% if(session.getAttribute("success") != null){ %>
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

<% if(session.getAttribute("error") != null){ %>
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