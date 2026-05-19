package com.smart.controller;

import java.io.IOException;

import com.smart.dao.TaskDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        TaskDAO dao = new TaskDAO();

        boolean result = dao.deleteTask(id);

        if(result) {
        	request.getSession().setAttribute(
        		    "successMsg",
        		    "Task Deleted Successfully"
        		);
            response.sendRedirect(request.getContextPath() + "/views/viewTasks.jsp");

        } else {
        	request.getSession().setAttribute(
        		    "errorMsg",
        		    "Delete Failed"
        		);
            response.getWriter().println("Delete Failed");
        }
    }
}