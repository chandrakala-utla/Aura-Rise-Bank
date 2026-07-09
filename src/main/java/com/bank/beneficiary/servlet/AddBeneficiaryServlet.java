package com.bank.beneficiary.servlet;

import java.io.IOException;

import com.bank.beneficiary.Beneficiary;
import com.bank.beneficiary.BeneficiaryDAO;
import com.bank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.bank.account.AccountDAO;
import com.bank.notification.Notification;
import com.bank.notification.NotificationDAO;
@WebServlet("/AddBeneficiaryServlet")
public class AddBeneficiaryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null) {

            response.sendRedirect(
                    "login.jsp");

            return;
        }

        User user =
                (User) session.getAttribute(
                        "user");

        String beneficiaryName =
                request.getParameter(
                        "beneficiaryName");

        String accountNumber =
                request.getParameter(
                        "accountNumber");
        AccountDAO accountDAO =
                new AccountDAO();

        if(!accountDAO.isAccountActive(accountNumber)) {

            response.sendRedirect(
                    "message.jsp?icon=error"
                    + "&title=Beneficiary Not Added"
                    + "&text=Cannot Add A Closed Account"
                    + "&redirect=add-beneficiary.jsp");

            return;
        }

        BeneficiaryDAO dao =
                new BeneficiaryDAO();

        boolean exists =
                dao.isBeneficiaryExists(
                        user.getUserId(),
                        accountNumber);

        if(exists) {

        	response.sendRedirect(
        	        "message.jsp?icon=error"
        	        + "&title=Beneficiary Already Exists"
        	        + "&text=This Account Is Already Added"
        	        + "&redirect=add-beneficiary.jsp");

        	return;
        }

        Beneficiary beneficiary =
                new Beneficiary();

        beneficiary.setUserId(
                user.getUserId());

        beneficiary.setBeneficiaryName(
                beneficiaryName);

        beneficiary.setBeneficiaryAccountNumber(
                accountNumber);

        boolean status =
                dao.addBeneficiary(
                        beneficiary);
        
        if(status) {
        	Notification notification =
        	        new Notification();

        	notification.setUserId(
        	        user.getUserId());

        	notification.setTitle(
        	        "Beneficiary Added");

        	notification.setMessage(
        	        beneficiaryName
        	        + " has been added successfully as your beneficiary.");

        	NotificationDAO notificationDAO =
        	        new NotificationDAO();

        	notificationDAO.addNotification(
        	        notification);
        	response.sendRedirect(
        	        "message.jsp?icon=success"
        	        + "&title=Beneficiary Added"
        	        + "&text=Beneficiary Added Successfully"
        	        + "&redirect=ViewBeneficiariesServlet");

        } else {

        	response.sendRedirect(
        	        "message.jsp?icon=error"
        	        + "&title=Failed To Add Beneficiary"
        	        + "&text=Please Try Again"
        	        + "&redirect=add-beneficiary.jsp");
        }
    }
}