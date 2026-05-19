package com.smart.controller;

import java.io.IOException;

import com.smart.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        boolean status = dao.loginUser(email, password);

        if(status) {

            HttpSession session = request.getSession();

            session.setAttribute("session_email", email);
            session.setAttribute(
            	    "successMsg",
            	    "Login Successful"
            	);


            response.sendRedirect(request.getContextPath() + "/views/dashboard.jsp");
            
        } else {

        	request.getSession().setAttribute(
        		    "errorMsg",
        		    "Invalid Email or Password"
        		);

        		response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        }
    }
}