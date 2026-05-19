<%@page import="com.smart.model.Task"%>
<%@page import="com.smart.dao.TaskDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

TaskDAO dao = new TaskDAO();

Task task = dao.getTaskById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Task</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<jsp:include page="/components/navbar.jsp" />

<div class="d-flex">

    <jsp:include page="/components/sidebar.jsp" />

    <div class="container p-5">

        <div class="card shadow border-0 rounded-4 p-5">

            <h2 class="mb-4 text-warning">
                Edit Task
            </h2>

            <form action="<%=request.getContextPath()%>/updateTask"
                  method="post">

                <input type="hidden"
                       name="id"
                       value="<%=task.getId()%>">

                <div class="mb-3">

                    <label>Task Title</label>

                    <input type="text"
                           name="title"
                           class="form-control"
                           value="<%=task.getTitle()%>"
                           required>

                </div>

                <div class="mb-3">

                    <label>Description</label>

                    <textarea name="description"
                              class="form-control"
                              rows="4"
                              required><%=task.getDescription()%></textarea>

                </div>

                <div class="mb-3">

                    <label>Status</label>

                    <select name="status"
                            class="form-select">

                        <option
                        <%=task.getStatus().equals("Pending") ? "selected" : "" %>>
                        Pending
                        </option>

                        <option
                        <%=task.getStatus().equals("Completed") ? "selected" : "" %>>
                        Completed
                        </option>

                    </select>

                </div>

                <button class="btn btn-warning">
                    Update Task
                </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>