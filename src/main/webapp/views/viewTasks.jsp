<%@page import="java.util.ArrayList"%>
<%@page import="com.smart.model.Task"%>
<%@page import="com.smart.dao.TaskDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String email = (String)session.getAttribute("session_email");

if(email == null){
    response.sendRedirect("login.jsp");
}

TaskDAO dao = new TaskDAO();

String keyword = request.getParameter("keyword");

String statusFilter = request.getParameter("status");

if(keyword == null){
    keyword = "";
}

if(statusFilter == null){
    statusFilter = "";
}

ArrayList<Task> taskList =
dao.searchTasks(email, keyword, statusFilter);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Tasks</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<body>

<jsp:include page="/components/navbar.jsp" />

<div class="d-flex">

    <jsp:include page="/components/sidebar.jsp" />

    <div class="container-fluid p-5">

        <div class="card shadow border-0 rounded-4 p-4">

            <div class="d-flex justify-content-between mb-4">
            <form method="get"
      action="viewTasks.jsp"
      class="row g-3 mb-4">

    <div class="col-md-5">

        <input type="text"
       id="searchInput"
               name="keyword"
               class="form-control"
               placeholder="Search task title..."
               value="<%=keyword%>">

    </div>

    <div class="col-md-4">

        <select name="status"
                class="form-select">

            <option value="">
                All Status
            </option>

            <option value="Pending"
            <%=statusFilter.equals("Pending") ? "selected" : "" %>>
            Pending
            </option>

            <option value="Completed"
            <%=statusFilter.equals("Completed") ? "selected" : "" %>>
            Completed
            </option>

        </select>

    </div>

    <div class="col-md-3">

        <button class="btn btn-primary w-100">
            Search
        </button>

    </div>

</form>

                <h2 class="text-primary">
                    My Tasks
                </h2>

                <a href="addTask.jsp"
                   class="btn btn-primary">
                   Add New Task
                </a>

            </div>

            <table class="table table-hover align-middle">

                <thead class="table-dark">

                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>

                </thead>

                <tbody id="taskTableBody">
                <%
                for(Task task : taskList){
                %>

                    <tr>

                        <td><%=task.getId()%></td>

                        <td><%=task.getTitle()%></td>

                        <td><%=task.getDescription()%></td>

                        <td>

                        <% if(task.getStatus().equals("Completed")){ %>

                            <span class="badge bg-success">
                                Completed
                            </span>

                        <% } else { %>

                            <span class="badge bg-warning text-dark">
                                Pending
                            </span>

                        <% } %>

                        </td>

                        <td>

                            <a href="editTask.jsp?id=<%=task.getId()%>"
  					 class="btn btn-sm btn-warning">

   												Edit

										</a>
										
                            <a href="<%=request.getContextPath()%>/deleteTask?id=<%=task.getId()%>"
  								 class="btn btn-sm btn-danger">

   													Delete

													</a>

                        </td>

                    </tr>

                <%
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>
<script>

const searchInput =
document.getElementById("searchInput");

searchInput.addEventListener("keyup", function(){

    let keyword = searchInput.value;

    fetch(
    "<%=request.getContextPath()%>/liveSearch?keyword="
    + keyword
    )

    .then(response => response.text())

    .then(data => {

        document.getElementById("taskTableBody")
        .innerHTML = data;

    });

});

</script>

</body>
</html>