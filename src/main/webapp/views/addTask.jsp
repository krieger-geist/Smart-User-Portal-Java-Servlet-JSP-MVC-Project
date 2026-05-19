<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String email = (String)session.getAttribute("session_email");

if(email == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Task</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<jsp:include page="/components/navbar.jsp" />

<div class="d-flex">

    <jsp:include page="/components/sidebar.jsp" />

    <div class="container p-5">

        <div class="card shadow border-0 rounded-4 p-5">

            <h2 class="mb-4 text-primary">
                Add New Task
            </h2>

            <form action="<%=request.getContextPath()%>/addTask"
                  method="post">

                <div class="mb-3">

                    <label>Task Title</label>

                    <input type="text"
                           name="title"
                           class="form-control"
                           required>

                </div>

                <div class="mb-3">

                    <label>Description</label>

                    <textarea name="description"
                              class="form-control"
                              rows="4"
                              required></textarea>

                </div>

                <div class="mb-3">

                    <label>Status</label>

                    <select name="status"
                            class="form-select">

                        <option>Pending</option>
                        <option>Completed</option>

                    </select>

                </div>

                <button class="btn btn-primary">
                    Add Task
                </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>