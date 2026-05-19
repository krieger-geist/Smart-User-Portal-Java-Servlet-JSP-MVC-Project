
<%@page import="com.smart.dao.TaskDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String email = (String)session.getAttribute("session_email");

if(email == null){
    response.sendRedirect("login.jsp");
}
TaskDAO dao = new TaskDAO();

int totalTasks = dao.getTotalTaskCount(email);

int completedTasks = dao.getCompletedTaskCount(email);

int pendingTasks = dao.getPendingTaskCount(email);
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<meta charset="UTF-8">
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{
    background-color:#f4f7fc;
}

.dashboard-card{
    border:none;
    border-radius:20px;
    transition:0.3s;
}

.dashboard-card:hover{
    transform:translateY(-5px);
}

</style>

</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/components/navbar.jsp" />

<div class="d-flex">

    <!-- SIDEBAR -->
    <jsp:include page="/components/sidebar.jsp" />

    <!-- MAIN CONTENT -->
    <div class="container-fluid p-4">

        <h2 class="mb-4">
            Welcome Back,
            <span class="text-primary">
                <%=email %>
            </span>
        </h2>

        <!-- STATS CARDS -->
        <div class="row g-4">

            <div class="col-md-4">

                <div class="card dashboard-card shadow p-4">

                    <div class="d-flex justify-content-between">

                        <div>
                            <h5>Total Tasks</h5>
                            <h2><%=totalTasks %></h2>
                        </div>

                        <i class="bi bi-list-task fs-1 text-primary"></i>

                    </div>

                </div>

            </div>

            <div class="col-md-4">

                <div class="card dashboard-card shadow p-4">

                    <div class="d-flex justify-content-between">

                        <div>
                            <h5>Completed</h5>
                            <h2><%=completedTasks %></h2>
                        </div>

                        <i class="bi bi-check-circle fs-1 text-success"></i>

                    </div>

                </div>

            </div>

            <div class="col-md-4">

                <div class="card dashboard-card shadow p-4">

                    <div class="d-flex justify-content-between">

                        <div>
                            <h5>Pending</h5>
								<h2><%=pendingTasks %></h2>
                        </div>

                        <i class="bi bi-clock-history fs-1 text-warning"></i>

                    </div>

                </div>

            </div>

        </div>




<!-- CHART SECTION -->

<div class="row mt-5">

    <div class="col-md-6">

        <div class="card shadow border-0 rounded-4 p-4">

            <h4 class="mb-4">
                Task Analytics
            </h4>

            <canvas id="taskChart"></canvas>

        </div>

    </div>

</div>

        <!-- RECENT ACTIVITY SECTION -->
        <div class="card shadow mt-5 p-4 border-0 rounded-4">

            <h4 class="mb-3">
                Recent Activity
            </h4>

            <table class="table table-hover">

                <thead>

                    <tr>
                        <th>Task</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>

                </thead>

                <tbody>

                    <tr>
                        <td>Complete Servlet Project</td>
                        <td>
                            <span class="badge bg-success">
                                Completed
                            </span>
                        </td>
                        <td>Today</td>
                    </tr>

                    <tr>
                        <td>Prepare GitHub README</td>
                        <td>
                            <span class="badge bg-warning text-dark">
                                Pending
                            </span>
                        </td>
                        <td>Tomorrow</td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</div>
<script>

const ctx = document.getElementById('taskChart');

new Chart(ctx, {

    type: 'doughnut',

    data: {

        labels: ['Completed', 'Pending'],

        datasets: [{

            label: 'Tasks',

            data: [
                <%=completedTasks%>,
                <%=pendingTasks%>
            ],

            borderWidth: 1
        }]
    },

    options: {

        responsive: true,

        plugins: {

            legend: {
                position: 'bottom'
            }
        }
    }
});

</script>
</body>
</html>