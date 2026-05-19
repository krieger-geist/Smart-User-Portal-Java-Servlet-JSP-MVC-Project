<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="bg-dark text-white p-3"
     style="width:250px; min-height:100vh;">

    <h3 class="text-center mb-4">
        Dashboard
    </h3>

    <ul class="nav flex-column">

        <li class="nav-item mb-3">
           <a href="<%=request.getContextPath()%>/views/dashboard.jsp"
               class="nav-link text-white">
               Home
            </a>
        </li>

        <li class="nav-item mb-3">
            <a href="<%=request.getContextPath()%>/views/addTask.jsp"
               class="nav-link text-white">
               Add Task
            </a>
        </li>

        <li class="nav-item mb-3">
            <a href="<%=request.getContextPath()%>/views/viewTasks.jsp"
               class="nav-link text-white">
               View Tasks
            </a>
        </li>




			<li class="nav-item mb-3">

    <a href="<%=request.getContextPath()%>/views/profile.jsp"
       class="nav-link text-white">

       Profile

    </a>
					</li>
					
        <li class="nav-item mb-3">
            <a href="<%=request.getContextPath()%>/logout"
               class="nav-link text-danger">
               Logout
            </a>
        </li>

    </ul>

</div>