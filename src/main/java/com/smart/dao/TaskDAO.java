package com.smart.dao;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.smart.db.DBConnection;
import com.smart.model.Task;
import java.sql.ResultSet;
import java.util.ArrayList;
public class TaskDAO {

    public boolean addTask(Task task) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "insert into tasks(title,description,status,user_email) values(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, task.getTitle());
            ps.setString(2, task.getDescription());
            ps.setString(3, task.getStatus());
            ps.setString(4, task.getUserEmail());

            int rowCount = ps.executeUpdate();

            if(rowCount > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public ArrayList<Task> getTasksByEmail(String email){

        ArrayList<Task> taskList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String query = "select * from tasks where user_email=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Task task = new Task();

                task.setId(rs.getInt("id"));
                task.setTitle(rs.getString("title"));
                task.setDescription(rs.getString("description"));
                task.setStatus(rs.getString("status"));
                task.setUserEmail(rs.getString("user_email"));

                taskList.add(task);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return taskList;
    }
    public boolean deleteTask(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "delete from tasks where id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            int rowCount = ps.executeUpdate();

            if(rowCount > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public Task getTaskById(int id) {

        Task task = new Task();

        try {

            Connection con = DBConnection.getConnection();

            String query = "select * from tasks where id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                task.setId(rs.getInt("id"));
                task.setTitle(rs.getString("title"));
                task.setDescription(rs.getString("description"));
                task.setStatus(rs.getString("status"));
                task.setUserEmail(rs.getString("user_email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return task;
    }
    public boolean updateTask(Task task) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "update tasks set title=?, description=?, status=? where id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, task.getTitle());
            ps.setString(2, task.getDescription());
            ps.setString(3, task.getStatus());
            ps.setInt(4, task.getId());

            int rowCount = ps.executeUpdate();

            if(rowCount > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public int getTotalTaskCount(String email) {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String query = "select count(*) from tasks where user_email=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    public int getCompletedTaskCount(String email) {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String query = "select count(*) from tasks where user_email=? and status='Completed'";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    public int getPendingTaskCount(String email) {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String query = "select count(*) from tasks where user_email=? and status='Pending'";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
				    public ArrayList<Task> searchTasks(String email,
				            String keyword,
				            String status){
				
				ArrayList<Task> taskList = new ArrayList<>();
				
				try {
				
				Connection con = DBConnection.getConnection();
				
				String query = "select * from tasks where user_email=? "
				+ "and title like ? "
				+ "and status like ?";
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1, email);
				ps.setString(2, "%" + keyword + "%");
				ps.setString(3, "%" + status + "%");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
				
				Task task = new Task();
				
				task.setId(rs.getInt("id"));
				task.setTitle(rs.getString("title"));
				task.setDescription(rs.getString("description"));
				task.setStatus(rs.getString("status"));
				task.setUserEmail(rs.getString("user_email"));
				
				taskList.add(task);
				}
				
				} catch (Exception e) {
				e.printStackTrace();
				}
				
				return taskList;
				}
				   
				}