<%@page import="com.smart.dao.UserDAO"%>
<%@page import="com.smart.model.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String email =
(String)session.getAttribute("session_email");

if(email == null){
    response.sendRedirect("login.jsp");
}

UserDAO dao = new UserDAO();

User user = dao.getUserByEmail(email);
%>

<!DOCTYPE html>
<html>
<head>
<style>

.profile-card{
    transition:0.3s;
}

.profile-card:hover{
    transform:translateY(-5px);
}

</style>
<meta charset="UTF-8">
<title>Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<body>

<jsp:include page="/components/navbar.jsp" />

<div class="d-flex">

<jsp:include page="/components/sidebar.jsp" />

<div class="container p-5">

    <div class="row">

        <div class="col-md-4">

            <div class="card profile-card shadow border-0 rounded-4 p-4 text-center d-flex flex-column align-items-center justify-content-center">

                <%
                String profilePic = user.getProfilePic();

                if(profilePic == null || profilePic.equals("")){
                %>

                <i class="bi bi-person-circle display-1 text-primary"></i>

                <%
                } else {
                %>

		                <img src="<%=request.getContextPath()%>/uploads/<%=profilePic%>"
						     width="180"
						     height="180"
						     class="rounded-circle shadow mb-3"
						     style="object-fit:cover;
		            border:5px solid #0d6efd;">
		                <%
                }
                %>

                <h3 class="mt-3">
                    <%=user.getName()%>
                </h3>

                <p class="text-muted">
                    <%=user.getEmail()%>
                </p>

            </div>

        </div>

        <div class="col-md-8">

            <div class="card shadow border-0 rounded-4 p-5">

                <h3 class="mb-4 text-primary">
                    User Settings
                </h3>

                <form action="<%=request.getContextPath()%>/updateProfile"
                      method="post"
                      enctype="multipart/form-data">

                    <input type="hidden"
                           name="id"
                           value="<%=user.getId()%>">

                    <div class="mb-3">

                        <label>Name</label>

                        <input type="text"
                               name="name"
                               class="form-control"
                               value="<%=user.getName()%>"
                               required>

                    </div>

                    <div class="mb-3">

                        <label>Email</label>

                        <input type="email"
                               name="email"
                               class="form-control"
                               value="<%=user.getEmail()%>"
                               required>

                    </div>

                    <div class="mb-3">

                        <label>Profile Picture</label>

                        <input type="file"
                               name="profilePic"
                               class="form-control">

                    </div>

                    <button class="btn btn-primary">

                        Update Profile

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

</div>

</body>
</html>