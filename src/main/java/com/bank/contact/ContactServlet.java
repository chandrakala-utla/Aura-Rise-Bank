package com.bank.contact;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Contact contact = new Contact();

        contact.setFullName(fullName);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setMessage(message);

        ContactDAO dao = new ContactDAO();

        boolean status = dao.saveMessage(contact);

        if(status){

            response.sendRedirect(
                    "index.jsp?message=success#contact");

        }else{

            response.sendRedirect(
                    "index.jsp?message=failed#contact");

        }

    }

}