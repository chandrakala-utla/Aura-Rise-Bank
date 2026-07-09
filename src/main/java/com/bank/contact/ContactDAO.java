package com.bank.contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bank.util.DBConnection;

public class ContactDAO {

    // Save Message
	// Save Message
	public boolean saveMessage(Contact contact) {

	    boolean status = false;

	    try {

	        Connection conn = DBConnection.getConnection();

	        String sql =
	        "INSERT INTO contact_messages "
	        + "(user_id, full_name, email, subject, message) "
	        + "VALUES (?, ?, ?, ?, ?)";

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ps.setInt(1, contact.getUserId());

	        ps.setString(2, contact.getFullName());

	        ps.setString(3, contact.getEmail());

	        ps.setString(4, contact.getSubject());

	        ps.setString(5, contact.getMessage());

	        int rows = ps.executeUpdate();

	        if(rows > 0){
	            status = true;
	        }

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return status;
	}

    // View All Messages
    public List<Contact> getAllMessages(){

        List<Contact> list = new ArrayList<>();

        try{

            Connection conn = DBConnection.getConnection();

            String sql =
            "SELECT * FROM contact_messages ORDER BY id DESC";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Contact contact = new Contact();

                contact.setMessageId(
                        rs.getInt("id"));

                contact.setFullName(
                        rs.getString("full_name"));

                contact.setEmail(
                        rs.getString("email"));

                contact.setSubject(
                        rs.getString("subject"));

                contact.setMessage(
                        rs.getString("message"));

                contact.setCreatedAt(
                        rs.getTimestamp("submitted_at"));
                
                contact.setUpdatedAt(
                	    rs.getTimestamp("updated_at"));
                
                contact.setStatus(
                        rs.getString("status"));

                contact.setAdminRemark(
                        rs.getString("admin_remark"));

                list.add(contact);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // Total Messages
    public int getTotalMessages(){

        int total = 0;

        try{

            Connection conn = DBConnection.getConnection();

            String sql =
            "SELECT COUNT(*) FROM contact_messages";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                total = rs.getInt(1);

            }

        }catch(Exception e){

            e.printStackTrace();

        }

        return total;
    }
    public boolean updateMessageStatus(int id,
            String status,
            String adminRemark){

boolean updated = false;

try{

Connection conn = DBConnection.getConnection();

String sql =
"UPDATE contact_messages "
+ "SET status=?, "
+ "admin_remark=?, "
+ "updated_at=CURRENT_TIMESTAMP "
+ "WHERE id=?";

PreparedStatement ps = conn.prepareStatement(sql);

ps.setString(1, status);
ps.setString(2, adminRemark);
ps.setInt(3, id);

updated = ps.executeUpdate() > 0;

}catch(Exception e){
e.printStackTrace();
}

return updated;
}
 // ===============================
 // Get Complaints By Customer Email
 // ===============================
 public List<Contact> getMessagesByEmail(String email){

     List<Contact> list = new ArrayList<>();

     try{

         Connection conn = DBConnection.getConnection();

         String sql =
         "SELECT * FROM contact_messages " +
         "WHERE email=? " +
         "ORDER BY id DESC";

         PreparedStatement ps =
                 conn.prepareStatement(sql);

         ps.setString(1, email);

         ResultSet rs =
                 ps.executeQuery();

         while(rs.next()){

             Contact contact = new Contact();

             contact.setMessageId(
                     rs.getInt("id"));

             contact.setFullName(
                     rs.getString("full_name"));

             contact.setEmail(
                     rs.getString("email"));

             contact.setSubject(
                     rs.getString("subject"));

             contact.setMessage(
                     rs.getString("message"));

             contact.setCreatedAt(
                     rs.getTimestamp("submitted_at"));
             contact.setUpdatedAt(
            	        rs.getTimestamp("updated_at"));

             contact.setStatus(
                     rs.getString("status"));

             contact.setAdminRemark(
                     rs.getString("admin_remark"));

             list.add(contact);

         }

     }catch(Exception e){

         e.printStackTrace();

     }

     return list;

 }
 public Contact getMessageById(int id){

	    Contact contact = null;

	    try{

	        Connection conn = DBConnection.getConnection();

	        String sql =
	        "SELECT * FROM contact_messages WHERE id=?";

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            contact = new Contact();

	            contact.setMessageId(
	                    rs.getInt("id"));

	            contact.setUserId(
	                    rs.getInt("user_id"));

	            contact.setSubject(
	                    rs.getString("subject"));

	            contact.setStatus(
	                    rs.getString("status"));

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return contact;
	}
}