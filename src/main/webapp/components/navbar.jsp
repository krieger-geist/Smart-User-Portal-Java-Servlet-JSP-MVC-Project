<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">

    <div class="container-fluid">

        <a class="navbar-brand fw-bold" href="#">
            TaskFlow MVC
        </a>

      <div class="d-flex align-items-center">


				<button id="themeToggle"
				        class="btn btn-outline-light btn-sm me-3">
				
				    🌙
				
				</button>
            <span class="text-white me-3">
                Welcome,
                <%= session.getAttribute("session_email") %>
            </span>

            <a href="<%=request.getContextPath()%>/logout"
               class="btn btn-danger btn-sm">
               Logout
            </a>

        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%
String successMsg = (String)session.getAttribute("successMsg");

String errorMsg = (String)session.getAttribute("errorMsg");
%>

<script>

window.onload = function(){

    <% if(successMsg != null){ %>

    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: '<%=successMsg%>',
        timer: 2000,
        showConfirmButton: false
    });

    <% session.removeAttribute("successMsg"); } %>


    <% if(errorMsg != null){ %>

    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: '<%=errorMsg%>',
        timer: 2000,
        showConfirmButton: false
    });

    <% session.removeAttribute("errorMsg"); } %>

}

</script>
<style>

body.dark-mode{
    background-color:#121212 !important;
    color:white !important;
}

body.dark-mode .card{
    background-color:#1e1e1e !important;
    color:white !important;
}

body.dark-mode .table{
    color:white !important;
}

body.dark-mode .table-dark{
    background-color:#000 !important;
}

body.dark-mode .form-control,
body.dark-mode .form-select{
    background-color:#2c2c2c !important;
    color:white !important;
    border:none;
}

body.dark-mode .form-control::placeholder{
    color:#ccc;
}

body.dark-mode .navbar{
    background-color:#000 !important;
}

body.dark-mode .bg-dark{
    background-color:#000 !important;
}

body.dark-mode .table-hover tbody tr:hover{
    background-color:#2a2a2a !important;
}

</style>
<script>

document.addEventListener("DOMContentLoaded", function(){

    const themeToggle =
    document.getElementById("themeToggle");

    // LOAD SAVED THEME
    if(localStorage.getItem("theme") === "dark"){

        document.body.classList.add("dark-mode");

        themeToggle.innerHTML = "☀️";
    }

    // TOGGLE THEME
    themeToggle.addEventListener("click", function(){

        document.body.classList.toggle("dark-mode");

        if(document.body.classList.contains("dark-mode")){

            localStorage.setItem("theme", "dark");

            themeToggle.innerHTML = "☀️";

        } else {

            localStorage.setItem("theme", "light");

            themeToggle.innerHTML = "🌙";
        }
    });

});

</script>
</nav>