package com.smart.controller;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.IOException;

import com.smart.dao.UserDAO;
import com.smart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(request.getParameter("id"));

        String name =
        request.getParameter("name");

        String email =
        request.getParameter("email");
        Part filePart =
        		request.getPart("profilePic");

        		String fileName =
        		filePart.getSubmittedFileName();
        		
        		String uploadPath =
        				getServletContext().getRealPath("")
        				+ "uploads";

        				filePart.write(
        				uploadPath + "/" + fileName
        				);

        User user = new User();

        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setProfilePic(fileName);

        UserDAO dao = new UserDAO();

        boolean result = dao.updateProfile(user);

        HttpSession session = request.getSession();

        if(result) {

            session.setAttribute(
                "session_email",
                email
            );

            session.setAttribute(
                "successMsg",
                "Profile Updated Successfully"
            );

        } else {

            session.setAttribute(
                "errorMsg",
                "Profile Update Failed"
            );
        }

        response.sendRedirect(
        request.getContextPath()
        + "/views/profile.jsp");
    }
}