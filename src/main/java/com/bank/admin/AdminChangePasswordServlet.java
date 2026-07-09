package com.bank.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminChangePasswordServlet")
public class AdminChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("admin-login.jsp");
            return;
        }

        Admin admin =
                (Admin)session.getAttribute("admin");

        String currentPassword =
                request.getParameter("currentPassword");

        String newPassword =
                request.getParameter("newPassword");

        String confirmPassword =
                request.getParameter("confirmPassword");

        AdminDAO dao =
                new AdminDAO();

        // Current password check
        if(!dao.verifyPassword(
                admin.getAdminId(),
                currentPassword)){

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Password Change Failed"
                    + "&text=Current Password Is Incorrect"
                    + "&redirect=change-password.jsp");

            return;
        }

        // Confirm password check
        if(!newPassword.equals(confirmPassword)){

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Password Change Failed"
                    + "&text=New Password And Confirm Password Do Not Match"
                    + "&redirect=change-password.jsp");

            return;
        }

        // Prevent same password
        if(currentPassword.equals(newPassword)){

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Password Change Failed"
                    + "&text=New Password Must Be Different From Current Password"
                    + "&redirect=change-password.jsp");

            return;
        }

        boolean status =
                dao.updatePassword(
                        admin.getAdminId(),
                        newPassword);

        if(status){
        	System.out.println("Admin ID : " + admin.getAdminId());
        	System.out.println("Current Password : " + currentPassword);
            // Update session password also
            admin.setPassword(newPassword);
            session.setAttribute("admin", admin);
            System.out.println("Update Status : " + status);
            response.sendRedirect(
                    "message.jsp?icon=success"
                    + "&title=Password Updated"
                    + "&text=Password Changed Successfully"
                    + "&redirect=AdminDashboardServlet?page=settings");

        }else{

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Password Change Failed"
                    + "&text=Unable To Update Password"
                    + "&redirect=change-password.jsp");
        }
    }
}