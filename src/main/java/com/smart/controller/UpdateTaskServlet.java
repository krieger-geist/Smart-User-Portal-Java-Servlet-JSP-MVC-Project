package com.smart.controller;

import java.io.IOException;

import com.smart.dao.TaskDAO;
import com.smart.model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        Task task = new Task();

        task.setId(id);
        task.setTitle(title);
        task.setDescription(description);
        task.setStatus(status);

        TaskDAO dao = new TaskDAO();

        boolean result = dao.updateTask(task);

        if(result) {
        	request.getSession().setAttribute(
        		    "successMsg",
        		    "Task Updated Successfully"
        		);
            response.sendRedirect(request.getContextPath() + "/views/viewTasks.jsp");

        } else {
        	request.getSession().setAttribute(
        		    "errorMsg",
        		    "Update Failed"
        		);
            response.getWriter().println("Update Failed");
        }
    }
}