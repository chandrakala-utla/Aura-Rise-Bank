<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.bank.account.Account"%>

<%
List<Account> requests =
(List<Account>)request.getAttribute("requests");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Closure Requests</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

body{

background:#F4F8FC;

}

.container{

width:95%;

max-width:1400px;

margin:40px auto;

}

.header{

background:#0B2E6F;

color:white;

padding:25px;

border-radius:18px;

margin-bottom:25px;

}

.header h1{

font-size:34px;

}

.table-card{

background:white;

border-radius:18px;

overflow:hidden;

box-shadow:0 10px 25px rgba(0,0,0,.15);

}

table{

width:100%;

border-collapse:collapse;

}

th{

background:#123D91;

color:white;

padding:18px;

}

td{

padding:16px;

text-align:center;

border-bottom:1px solid #EEE;

}

.approve{

background:#16A34A;

color:white;

padding:10px 18px;

text-decoration:none;

border-radius:8px;

font-weight:bold;

}

.reject{

background:#DC2626;

color:white;

padding:10px 18px;

text-decoration:none;

border-radius:8px;

font-weight:bold;

margin-left:8px;

}

.pending{

color:#F59E0B;

font-weight:bold;

}

</style>

</head>

<body>

<div class="container">

<div class="header">

<h1>Account Closure Requests</h1>

<p>Review customer account closure requests.</p>

</div>

<div class="table-card">

<table>

<tr>

<th>Account Number</th>

<th>Account Type</th>

<th>Balance</th>

<th>Status</th>

<th>Action</th>

</tr>

<%

if(requests!=null){

for(Account account:requests){

%>

<tr>

<td><%=account.getAccountNumber()%></td>

<td><%=account.getAccountType()%></td>

<td>₹ <%=String.format("%.2f",account.getBalance())%></td>

<td class="pending">PENDING</td>

<td>

<a
class="approve"
href="ApproveClosureServlet?accountNumber=<%=account.getAccountNumber()%>">

Approve

</a>

<a
class="reject"
href="RejectClosureServlet?accountNumber=<%=account.getAccountNumber()%>">

Reject

</a>

</td>

</tr>

<%

}

}

%>

</table>

</div>

</div>

</body>

</html>