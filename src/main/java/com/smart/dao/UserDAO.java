package com.smart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.smart.db.DBConnection;
import java.sql.ResultSet;
import com.smart.model.User;

public class UserDAO {

    public boolean registerUser(User user) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "insert into users(name,email,password) values(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int rowCount = ps.executeUpdate();

            if(rowCount > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public boolean loginUser(String email, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "select * from users where email=? and password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public User getUserByEmail(String email) {

        User user = new User();

        try {

            Connection con = DBConnection.getConnection();

            String query = "select * from users where email=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setProfilePic(
                	    rs.getString("profile_pic")
                	);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    public boolean updateProfile(User user) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query =
            	"update users set name=?, email=?, profile_pic=? where id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getProfilePic());
            ps.setInt(4, user.getId());
            
            int rowCount = ps.executeUpdate();

            if(rowCount > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
}