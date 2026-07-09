package com.bank.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bank.util.DBConnection;

public class AdminDAO {

    public Admin login(String username, String password) {

        Admin admin = null;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
            "SELECT * FROM admins WHERE username=? AND password=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                admin = new Admin();

                admin.setAdminId(
                        rs.getInt("admin_id"));

                admin.setUsername(
                        rs.getString("username"));

                admin.setPassword(
                        rs.getString("password"));

                admin.setFullName(
                        rs.getString("full_name"));

                admin.setEmail(
                        rs.getString("email"));

            }

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return admin;

    }
    public boolean verifyPassword(int adminId, String currentPassword) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
            "SELECT * FROM admins WHERE admin_id=? AND password=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, adminId);
            ps.setString(2, currentPassword);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public boolean updatePassword(int adminId,String newPassword){

        boolean status=false;

        try{

            Connection conn=DBConnection.getConnection();

            String sql=
            "UPDATE admins SET password=? WHERE admin_id=?";

            PreparedStatement ps=
                    conn.prepareStatement(sql);

            ps.setString(1,newPassword);
            ps.setInt(2,adminId);

            int rows = ps.executeUpdate();

            status = rows > 0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

}