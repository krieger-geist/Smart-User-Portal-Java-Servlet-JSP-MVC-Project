package com.smart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.smart.dao.TaskDAO;
import com.smart.model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/liveSearch")
public class LiveSearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String keyword = request.getParameter("keyword");

        HttpSession session = request.getSession();

        String email =
        (String)session.getAttribute("session_email");

        TaskDAO dao = new TaskDAO();

        ArrayList<Task> taskList =
        dao.searchTasks(email, keyword, "");

        PrintWriter out = response.getWriter();

        for(Task task : taskList) {

            out.println("<tr>");

            out.println("<td>" + task.getId() + "</td>");

            out.println("<td>" +
                    task.getTitle() +
                    "</td>");

            out.println("<td>" +
                    task.getDescription() +
                    "</td>");

            if(task.getStatus().equals("Completed")) {

                out.println(
                "<td><span class='badge bg-success'>Completed</span></td>"
                );

            } else {

                out.println(
                "<td><span class='badge bg-warning text-dark'>Pending</span></td>"
                );
            }

            out.println("<td>");

            out.println(
            "<a href='editTask.jsp?id="
            + task.getId()
            + "' class='btn btn-sm btn-warning me-2'>Edit</a>"
            );

            out.println(
            "<a href='deleteTask?id="
            + task.getId()
            + "' class='btn btn-sm btn-danger'>Delete</a>"
            );

            out.println("</td>");

            out.println("</tr>");
        }
    }
}