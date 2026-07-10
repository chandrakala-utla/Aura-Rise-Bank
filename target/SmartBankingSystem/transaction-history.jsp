<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.bank.transaction.Transaction" %>

<%
List<Transaction> transactions =
(List<Transaction>) request.getAttribute("transactions");

String accountNumber =
(String) request.getAttribute("accountNumber");
%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.TimeZone" %>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Transaction History</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

body{

background:linear-gradient(135deg,#0B2E6F,#123D91,#1E4DB7);

min-height:100vh;

overflow-x:hidden;

}

/* Background */

body::before{

content:"";

position:fixed;

width:350px;

height:350px;

border-radius:50%;

background:rgba(212,160,23,.15);

top:-120px;

left:-120px;

z-index:-1;

}

body::after{

content:"";

position:fixed;

width:260px;

height:260px;

border-radius:50%;

background:rgba(255,255,255,.08);

bottom:-90px;

right:-90px;

z-index:-1;

}

/* Container */

.container{

width:95%;

max-width:1450px;

margin:35px auto;

}

/* Header Card */

.header-card{

background:white;

border-radius:24px;

border-top:6px solid #D4A017;

padding:30px;

text-align:center;

box-shadow:0 20px 45px rgba(0,0,0,.18);

margin-bottom:30px;

}

.logo img{

width:180px;

margin-bottom:10px;

}

.header-card h2{

font-size:36px;

color:#0B2E6F;

margin-bottom:10px;

}

.header-card p{

color:#64748B;

font-size:17px;

}

/* Account Box */

.account-box{

margin-top:20px;

background:#F8FAFC;

padding:18px;

border-radius:14px;

font-size:18px;

font-weight:bold;

color:#0B2E6F;

}

/* Filter */

.filter-box{

margin-top:25px;

display:flex;

justify-content:center;

align-items:center;

gap:15px;

flex-wrap:wrap;

}

.filter-box label{

font-weight:bold;

color:#374151;

}

.filter-box select{

padding:10px 15px;

border-radius:8px;

border:1px solid #D1D5DB;

font-size:15px;

}

.table-card{

background:white;

border-radius:22px;

overflow:hidden;

box-shadow:0 15px 35px rgba(0,0,0,.18);

}

table{

width:100%;

border-collapse:collapse;

}

th{

background:#0B2E6F;

color:white;

padding:18px;

}

td{

padding:18px;

text-align:center;

border-bottom:1px solid #E5E7EB;

}

tr:hover{

background:#F8FAFC;

}

.deposit{

color:#16A34A;

font-weight:bold;

}

.withdraw{

color:#DC2626;

font-weight:bold;

}

.transferin{

color:#2563EB;

font-weight:bold;

}

.transferout{

color:#D97706;

font-weight:bold;

}

/* Bottom */

.bottom{

margin-top:40px;

text-align:center;

}

.dashboard-btn{

display:inline-block;

background:#0B2E6F;

color:white;

text-decoration:none;

padding:15px 35px;

border-radius:10px;

font-weight:bold;

transition:.3s;

}

.dashboard-btn:hover{

background:#D4A017;

color:#0B2E6F;

}

.footer{

margin:35px 0 25px;

text-align:center;

color:white;

}

.footer-line{

width:180px;

height:3px;

background:#D4A017;

margin:0 auto 15px;

}

.footer p{

color:#E5E7EB;

}

.empty{

background:white;

padding:60px;

text-align:center;

border-radius:22px;

box-shadow:0 15px 35px rgba(0,0,0,.18);

}

</style>

</head>
<body>

<div class="container">

    <!-- Header -->

    <div class="header-card">

        <div class="logo">

            <img src="images/aurarise-logo.png"
                 alt="AURA RISE BANK">

        </div>

        <h2>

            📜 Transaction History

        </h2>

        <p>

            View all transactions for your selected account.

        </p>

        <div class="account-box">

            🏛 Account Number :
            <%= accountNumber %>

        </div>

        <!-- Filter -->

        <form action="TransactionHistoryServlet"
              method="get"
              id="filterForm">

            <input
            type="hidden"
            name="accountNumber"
            value="<%= accountNumber %>">

            <div class="filter-box">

                <label>

                    Filter By

                </label>

                <select
                name="type"
                onchange="document.getElementById('filterForm').submit();">

                    <option value="ALL">

                        All Transactions

                    </option>

                    <option
                    value="DEPOSIT"
                    <%= "DEPOSIT".equals(request.getAttribute("selectedType")) ? "selected" : "" %>>

                        Deposit

                    </option>

                    <option
                    value="WITHDRAW"
                    <%= "WITHDRAW".equals(request.getAttribute("selectedType")) ? "selected" : "" %>>

                        Withdraw

                    </option>

                    <option
                    value="TRANSFER_IN"
                    <%= "TRANSFER_IN".equals(request.getAttribute("selectedType")) ? "selected" : "" %>>

                        Transfer In

                    </option>

                    <option
                    value="TRANSFER_OUT"
                    <%= "TRANSFER_OUT".equals(request.getAttribute("selectedType")) ? "selected" : "" %>>

                        Transfer Out

                    </option>

                </select>

            </div>

        </form>

    </div>

    <!-- Transaction Table -->

    <div class="table-card">

<%

if(transactions != null && !transactions.isEmpty()){

%>

<table>

<tr>

<th>Transaction ID</th>

<th>From Account</th>
<th>To Account</th>

<th>Transaction Type</th>

<th>Amount</th>

<th>Balance After</th>

<th>Date & Time</th>

</tr>

<%

for(Transaction transaction : transactions){

String type = transaction.getTransactionType();

%>

<tr>

<td>

<%= transaction.getTransactionId() %>

</td>

<td><%= transaction.getFromAccount() == null ? "-" : transaction.getFromAccount() %></td>

<td><%= transaction.getToAccount() == null ? "-" : transaction.getToAccount() %></td>

<td>

<%

if(type.equals("DEPOSIT")){

%>

<span class="deposit">

💰 Deposit

</span>

<%

}

else if(type.equals("WITHDRAW")){

%>

<span class="withdraw">

💸 Withdraw

</span>

<%

}

else if(type.equals("TRANSFER_IN")){

%>

<span class="transferin">

⬇ Transfer In

</span>

<%

}

else if(type.equals("TRANSFER_OUT")){

%>

<span class="transferout">

⬆ Transfer Out

</span>

<%

}

%>

</td>

<td>

₹ <%= String.format("%.2f", transaction.getAmount()) %>

</td>

<td>

₹ <%= String.format("%.2f", transaction.getBalanceAfter()) %>

</td>

<td>

<%

SimpleDateFormat sdf =
new SimpleDateFormat("dd-MMM-yyyy hh:mm a");

sdf.setTimeZone(
TimeZone.getTimeZone("Asia/Kolkata"));

%>

<%= sdf.format(transaction.getTransactionDate()) %>

</td>

</tr>

<%

}

%>

</table>

<%

}

else{

%>

<div class="empty">

<div style="font-size:70px;margin-bottom:20px;">

📜

</div>

<h2
style="
color:#0B2E6F;
margin-bottom:15px;">

No Transactions Found

</h2>

<p
style="
color:#64748B;
font-size:17px;">

There are no transactions available for this account.

</p>

</div>

<%

}

%>

</div>
<!-- Bottom Section -->

<div class="bottom">

    <a href="ViewAccountsServlet"
       class="dashboard-btn">

        🏛 Back To Accounts

    </a>

    <div class="footer">

        <div class="footer-line"></div>

        <p>

            © 2026 <b>AURA RISE BANK</b>

            • Secure Today. Prosper Tomorrow.

        </p>

    </div>

</div>

</div>

</body>

</html>