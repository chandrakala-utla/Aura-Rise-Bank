package com.bank.transaction.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.account.Account;
import com.bank.account.AccountDAO;
import com.bank.transaction.Transaction;
import com.bank.transaction.TransactionDAO;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfPCell;

@WebServlet("/DownloadStatementServlet")
public class DownloadStatementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber =
                request.getParameter("accountNumber");

        AccountDAO accountDAO =
                new AccountDAO();

        Account account =
                accountDAO.getAccountByNumber(accountNumber);

        if(account == null) {

            response.getWriter().println("Account Not Found");
            return;
        }

        TransactionDAO transactionDAO =
                new TransactionDAO();

        List<Transaction> list =
                transactionDAO.getTransactionsByAccountId(
                        account.getAccountId());

        response.setContentType("application/pdf");

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=Statement_"
                + accountNumber + ".pdf");

        try {

            Document document =
                    new Document();

            PdfWriter.getInstance(
                    document,
                    response.getOutputStream());


            document.open();

            /* ======================================
                    BANK LOGO
            ====================================== */

            String logoPath =
            getServletContext().getRealPath("/images/logo2.jpeg");

            Image logo =
            Image.getInstance(logoPath);

            logo.scaleAbsolute(70,70);

            logo.setAlignment(Image.ALIGN_CENTER);

            document.add(logo);


            /* ======================================
                    BANK NAME
            ====================================== */

            Font bankFont =
            FontFactory.getFont(
            FontFactory.HELVETICA_BOLD,
            22,
            BaseColor.BLUE);

            Paragraph bank =
            new Paragraph(
            "AURA RISE BANK",
            bankFont);

            bank.setAlignment(Element.ALIGN_CENTER);

            document.add(bank);


            /* ======================================
                    TAGLINE
            ====================================== */

            Font tagFont =
            FontFactory.getFont(
            FontFactory.HELVETICA,
            12);

            Paragraph tag =
            new Paragraph(
            "Secure Today. Prosper Tomorrow.",
            tagFont);

            tag.setAlignment(Element.ALIGN_CENTER);

            document.add(tag);

            document.add(new Paragraph(" "));


            /* ======================================
                    CONTACT DETAILS
            ====================================== */

            Font normal =
            FontFactory.getFont(
            FontFactory.HELVETICA,
            11);

            Paragraph office =
            new Paragraph(
            "Head Office : Nellore, Andhra Pradesh, India",
            normal);

            office.setAlignment(Element.ALIGN_CENTER);

            document.add(office);

            Paragraph phone =
            new Paragraph(
            "Customer Care : +91 92244 65432",
            normal);

            phone.setAlignment(Element.ALIGN_CENTER);

            document.add(phone);

            Paragraph email =
            new Paragraph(
            "Email : support@aurarisebank.com",
            normal);

            email.setAlignment(Element.ALIGN_CENTER);

            document.add(email);

            document.add(new Paragraph(
            "--------------------------------------------------------------"));
            /* ======================================
            ACCOUNT STATEMENT
      ====================================== */

      Font titleFont =
      FontFactory.getFont(
      FontFactory.HELVETICA_BOLD,
      18,
      BaseColor.BLACK);
      

      Paragraph title =
      new Paragraph(
      "ACCOUNT STATEMENT",
      titleFont);

      title.setAlignment(Element.ALIGN_CENTER);

      document.add(title);

      document.add(new Paragraph(" "));
      SimpleDateFormat sdf =
    		  new SimpleDateFormat("dd MMM yyyy hh:mm a");

      Font infoTitleFont =
    		  FontFactory.getFont(
    		  FontFactory.HELVETICA_BOLD,
    		  12,
    		  BaseColor.BLUE);

    		  Font infoFont =
    		  FontFactory.getFont(
    		  FontFactory.HELVETICA,
    		  11,
    		  BaseColor.BLACK);

    		  PdfPTable infoTable =
    		  new PdfPTable(2);

    		  infoTable.setWidthPercentage(100);

    		  infoTable.setSpacingBefore(10);

    		  infoTable.setSpacingAfter(20);

    		  infoTable.setWidths(new float[]{2,4});

    		  PdfPCell cell;


    		  // Customer Name

    		  cell=new PdfPCell(new Paragraph("Customer Name",infoTitleFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);

    		  cell=new PdfPCell(new Paragraph(account.getCustomerName(),infoFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);


    		  // Account Number

    		  cell=new PdfPCell(new Paragraph("Account Number",infoTitleFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);

    		  cell=new PdfPCell(new Paragraph(accountNumber,infoFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);


    		  // Account Type

    		  cell=new PdfPCell(new Paragraph("Account Type",infoTitleFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);

    		  cell=new PdfPCell(new Paragraph(account.getAccountType(),infoFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);


    		  // Current Balance

    		  cell=new PdfPCell(new Paragraph("Current Balance",infoTitleFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);

    		  cell=new PdfPCell(new Paragraph(
    		  "₹ " +
    		  new DecimalFormat("#,##0.00")
    		  .format(account.getBalance()),
    		  infoFont));

    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);


    		  // Generated On

    		  cell=new PdfPCell(new Paragraph("Generated On",infoTitleFont));
    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);

    		  cell=new PdfPCell(new Paragraph(
    		  sdf.format(new java.util.Date()),
    		  infoFont));

    		  cell.setBorder(0);
    		  cell.setPadding(8);
    		  infoTable.addCell(cell);

    		  document.add(infoTable);
    		  PdfPTable table = new PdfPTable(4);

    		  table.setWidthPercentage(100);

    		  table.setSpacingBefore(10);

    		  table.setSpacingAfter(15);

    		  table.setWidths(new float[]{3f,2.5f,2f,2f});


    		  /*==========================
    		      TABLE HEADER FONT
    		  ==========================*/

    		  Font headerFont =
    		  FontFactory.getFont(
    		  FontFactory.HELVETICA_BOLD,
    		  11,
    		  BaseColor.WHITE);


    		  cell = new PdfPCell(new Paragraph("Date & Time", headerFont));
    		  cell.setBackgroundColor(new BaseColor(18,61,145));
    		  cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		  cell.setPadding(8);
    		  table.addCell(cell);

    		  cell = new PdfPCell(new Paragraph("Transaction", headerFont));
    		  cell.setBackgroundColor(new BaseColor(18,61,145));
    		  cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		  cell.setPadding(8);
    		  table.addCell(cell);

    		  cell = new PdfPCell(new Paragraph("Amount (₹)", headerFont));
    		  cell.setBackgroundColor(new BaseColor(18,61,145));
    		  cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		  cell.setPadding(8);
    		  table.addCell(cell);

    		  cell = new PdfPCell(new Paragraph("Balance (₹)", headerFont));
    		  cell.setBackgroundColor(new BaseColor(18,61,145));
    		  cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		  cell.setPadding(8);
    		  table.addCell(cell);
    		  SimpleDateFormat dateFormat =
    				  new SimpleDateFormat("dd MMM yyyy hh:mm a");

    				  DecimalFormat money =
    				  new DecimalFormat("#,##0.00");
    				  for(Transaction t : list){

    					    PdfPCell dataCell;

    					    dataCell = new PdfPCell(
    					            new Paragraph(dateFormat.format(t.getTransactionDate())));
    					    dataCell.setPadding(6);
    					    table.addCell(dataCell);

    					    dataCell = new PdfPCell(
    					            new Paragraph(t.getTransactionType()));
    					    dataCell.setPadding(6);
    					    table.addCell(dataCell);

    					    dataCell = new PdfPCell(
    					            new Paragraph("₹ " + money.format(t.getAmount())));
    					    dataCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
    					    dataCell.setPadding(6);
    					    table.addCell(dataCell);

    					    dataCell = new PdfPCell(
    					            new Paragraph("₹ " + money.format(t.getBalanceAfter())));
    					    dataCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
    					    dataCell.setPadding(6);
    					    table.addCell(dataCell);

    					}
            document.add(table);
            document.add(new Paragraph(" "));

            Font summaryTitle =
            FontFactory.getFont(
            FontFactory.HELVETICA_BOLD,
            14,
            BaseColor.BLUE);

            document.add(
            new Paragraph(
            "ACCOUNT SUMMARY",
            summaryTitle));

            document.add(new Paragraph(" "));

            double totalDeposit = 0;
            double totalWithdraw = 0;

            for(Transaction t : list){

            	String type = t.getTransactionType();

            	if(type.equalsIgnoreCase("DEPOSIT")
            	        || type.equalsIgnoreCase("TRANSFER_IN")){

            	    totalDeposit += t.getAmount();

            	}else if(type.equalsIgnoreCase("WITHDRAW")
            	        || type.equalsIgnoreCase("TRANSFER_OUT")){

            	    totalWithdraw += t.getAmount();

            	}

            }

            DecimalFormat df =
            new DecimalFormat("#,##0.00");

            document.add(
            new Paragraph(
            "Total Transactions : " + list.size()));

            document.add(
            new Paragraph(
            "Total Deposits : ₹ " + df.format(totalDeposit)));

            document.add(
            new Paragraph(
            "Total Withdrawals : ₹ " + df.format(totalWithdraw)));

            document.add(
            new Paragraph(
            "Current Balance : ₹ " + df.format(account.getBalance())));
            document.add(new Paragraph(" "));

            Font noticeFont =
            FontFactory.getFont(
            FontFactory.HELVETICA_BOLD,
            12,
            BaseColor.RED);

            document.add(
            new Paragraph(
            "IMPORTANT NOTICE",
            noticeFont));

            document.add(
            new Paragraph(
            "• This is a computer-generated account statement."));

            document.add(
            new Paragraph(
            "• No signature is required."));

            document.add(
            new Paragraph(
            "• Please verify all transactions carefully."));

            document.add(
            new Paragraph(
            "• Never share your OTP, PIN or Password."));
            document.add(new Paragraph(" "));

            Paragraph thanks =
            new Paragraph(
            "Thank you for banking with AURA RISE BANK");

            thanks.setAlignment(Element.ALIGN_CENTER);

            document.add(thanks);

            Paragraph footer =
            new Paragraph(
            "Secure Today. Prosper Tomorrow.");

            footer.setAlignment(Element.ALIGN_CENTER);

            document.add(footer);

            document.add(
            new Paragraph(
            "© 2026 AURA RISE BANK",
            FontFactory.getFont(FontFactory.HELVETICA,10)));
            document.close();

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}