package com.smart.controller;

import java.io.IOException;

import com.smart.dao.UserDAO;
import com.smart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);

        if(status) {

        	request.getSession().setAttribute(
        		    "successMsg",
        		    "Registration Successful"
        		);

        		response.sendRedirect(request.getContextPath() + "/views/login.jsp");

        } else {

        	request.getSession().setAttribute(
        		    "errorMsg",
        		    "Registration Failed"
        		);

        		response.sendRedirect(request.getContextPath() + "/views/register.jsp");
        }
    }
}