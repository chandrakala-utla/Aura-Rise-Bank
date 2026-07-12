package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bank.model.User;
import com.bank.util.DBConnection;
import java.sql.ResultSet;
import com.bank.security.PasswordUtil;
import java.util.List;
import java.util.ArrayList;

public class UserDAO {

	public boolean registerUser(User user) {

	    boolean status = false;

	    try {

	        Connection conn = DBConnection.getConnection();

	        System.out.println("Connection = " + conn);

	        String sql = "INSERT INTO users(full_name,email,phone,password,role) VALUES(?,?,?,?,?)";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, user.getFullName());
	        ps.setString(2, user.getEmail());
	        ps.setString(3, user.getPhone());
	        ps.setString(4, PasswordUtil.hashPassword(user.getPassword()));
	        ps.setString(5, user.getRole());

	        System.out.println("Executing INSERT...");

	        int rows = ps.executeUpdate();

	        System.out.println("Rows = " + rows);

	        status = rows > 0;

	    } catch (Exception e) {

	        System.out.println("REGISTER ERROR:");
	        e.printStackTrace();
	    }

	    return status;
	}
    public User loginUser(String email, String password) {

        User user = null;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String hashedPassword =
                    PasswordUtil.hashPassword(password);

            String sql =
            "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    public boolean emailExists(String email) {

   
    	boolean exists = false;

    	try {

    	    Connection conn =
    	            DBConnection.getConnection();

    	    String sql =
    	            "SELECT email FROM users WHERE email=?";

    	    PreparedStatement ps =
    	            conn.prepareStatement(sql);

    	    ps.setString(1, email);

    	    ResultSet rs =
    	            ps.executeQuery();

    	    if(rs.next()) {

    	        exists = true;
    	    }

    	} catch(Exception e) {
    	    e.printStackTrace();
    	}

    	return exists;
  

    	}

    	public boolean phoneExists(String phone) {

    	boolean exists = false;

    	try {

    	    Connection conn =
    	            DBConnection.getConnection();

    	    String sql =
    	            "SELECT phone FROM users WHERE phone=?";

    	    PreparedStatement ps =
    	            conn.prepareStatement(sql);

    	    ps.setString(1, phone);

    	    ResultSet rs =
    	            ps.executeQuery();

    	    if(rs.next()) {

    	        exists = true;
    	    }

    	} catch(Exception e) {
    	    e.printStackTrace();
    	}

    	return exists;
    	

    	}
    	public boolean verifyPassword(int userId,
    			String password) {

  
    			boolean valid = false;

    			try {

    			    Connection conn =
    			            DBConnection.getConnection();

    			    String sql =
    			    "SELECT * FROM users WHERE user_id=? AND password=?";

    			    PreparedStatement ps =
    			            conn.prepareStatement(sql);

    			    ps.setInt(1, userId);
    			    ps.setString(2,
    			        PasswordUtil.hashPassword(password));

    			    ResultSet rs =
    			            ps.executeQuery();

    			    if(rs.next()) {

    			        valid = true;
    			    }

    			} catch(Exception e) {
    			    e.printStackTrace();
    			}

    			return valid;

    			}

    			public boolean updatePassword(
    			int userId,
    			String newPassword) {

    			boolean status = false;

    			try {

    			    Connection conn =
    			            DBConnection.getConnection();

    			    String sql =
    			    "UPDATE users SET password=? WHERE user_id=?";

    			    PreparedStatement ps =
    			            conn.prepareStatement(sql);

    			    ps.setString(1,
    			        PasswordUtil.hashPassword(newPassword));

    			    ps.setInt(2, userId);

    			    status =
    			        ps.executeUpdate() > 0;

    			} catch(Exception e) {
    			    e.printStackTrace();
    			}

    			return status;

    			}
    			public boolean updatePasswordByEmail(String email,
    			        String newPassword) {

    			    String sql =
    			    "UPDATE users SET password=? WHERE email=?";

    			    try {

    			        Connection con =
    			                DBConnection.getConnection();

    			        PreparedStatement ps =
    			                con.prepareStatement(sql);

    			        ps.setString(1,
    			                PasswordUtil.hashPassword(newPassword));

    			        ps.setString(2, email);

    			        return ps.executeUpdate() > 0;

    			    } catch (Exception e) {

    			        e.printStackTrace();
    			    }

    			    return false;
    			}
    			public boolean updateProfile(
    			        int userId,
    			        String fullName,
    			        String phone){

    			    boolean status = false;

    			    try{

    			        Connection conn =
    			                DBConnection.getConnection();

    			        String sql =
    			        "UPDATE users SET full_name=?, phone=? WHERE user_id=?";

    			        PreparedStatement ps =
    			                conn.prepareStatement(sql);

    			        ps.setString(1, fullName);
    			        ps.setString(2, phone);
    			        ps.setInt(3, userId);

    			        status =
    			                ps.executeUpdate() > 0;

    			    }catch(Exception e){
    			        e.printStackTrace();
    			    }

    			    return status;
    			}
    			public int getTotalUsers() {

    			    int total = 0;

    			    try {

    			        Connection conn = DBConnection.getConnection();

    			        String sql = "SELECT COUNT(*) FROM users";

    			        PreparedStatement ps = conn.prepareStatement(sql);

    			        ResultSet rs = ps.executeQuery();

    			        if(rs.next()) {

    			            total = rs.getInt(1);

    			        }

    			    }
    			    catch(Exception e) {

    			        e.printStackTrace();

    			    }

    			    return total;

    			}
    			public List<User> getAllCustomers() {

    			    List<User> customers = new ArrayList<>();

    			    String sql = "SELECT * FROM users WHERE role='CUSTOMER' ORDER BY user_id";

    			    try(
    			            Connection con = DBConnection.getConnection();
    			            PreparedStatement ps = con.prepareStatement(sql);
    			            ResultSet rs = ps.executeQuery()
    			    ){

    			        while(rs.next()){

    			            User user = new User();

    			            user.setUserId(rs.getInt("user_id"));
    			            user.setFullName(rs.getString("full_name"));
    			            user.setEmail(rs.getString("email"));
    			            user.setPhone(rs.getString("phone"));
    			            user.setRole(rs.getString("role"));

    			            customers.add(user);
    			        }

    			    }catch(Exception e){
    			        e.printStackTrace();
    			    }

    			    return customers;
    			}
    			public List<User> searchCustomers(String keyword){

    			    List<User> customers = new ArrayList<>();

    			    String sql=
    			    "SELECT * FROM users " +
    			    "WHERE role='CUSTOMER' AND (" +
    			    "CAST(user_id AS TEXT) ILIKE ? OR " +
    			    "full_name ILIKE ? OR " +
    			    "email ILIKE ? OR " +
    			    "phone ILIKE ?) " +
    			    "ORDER BY user_id";

    			    try(
    			            Connection con=DBConnection.getConnection();
    			            PreparedStatement ps=con.prepareStatement(sql);
    			    ){

    			        String search="%"+keyword+"%";

    			        ps.setString(1,search);
    			        ps.setString(2,search);
    			        ps.setString(3,search);
    			        ps.setString(4,search);

    			        ResultSet rs=ps.executeQuery();

    			        while(rs.next()){

    			            User user=new User();

    			            user.setUserId(rs.getInt("user_id"));
    			            user.setFullName(rs.getString("full_name"));
    			            user.setEmail(rs.getString("email"));
    			            user.setPhone(rs.getString("phone"));
    			            user.setRole(rs.getString("role"));

    			            customers.add(user);
    			        }

    			    }catch(Exception e){
    			        e.printStackTrace();
    			    }

    			    return customers;
    			}

}