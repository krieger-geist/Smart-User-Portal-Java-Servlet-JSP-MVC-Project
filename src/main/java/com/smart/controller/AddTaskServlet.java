package com.smart.controller;

import java.io.IOException;

import com.smart.dao.TaskDAO;
import com.smart.model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        HttpSession session = request.getSession();

        String email = (String)session.getAttribute("session_email");

        Task task = new Task();

        task.setTitle(title);
        task.setDescription(description);
        task.setStatus(status);
        task.setUserEmail(email);

        TaskDAO dao = new TaskDAO();

        boolean result = dao.addTask(task);

        if(result) {
        	session.setAttribute(
        		    "successMsg",
        		    "Task Added Successfully"
        		);
            response.sendRedirect(request.getContextPath() + "/views/dashboard.jsp");

        } else {
        	session.setAttribute(
        		    "errorMsg",
        		    "Failed To Add Task"
        		);

            response.getWriter().println("Task Add Failed");
        }
    }
}