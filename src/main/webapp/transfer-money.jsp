<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bank.model.User" %>
<%@ page import="com.bank.account.Account" %>
<%@ page import="com.bank.account.AccountDAO" %>
<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

AccountDAO dao = new AccountDAO();

List<Account> accounts =
        dao.getAccountsByUserId(user.getUserId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,sans-serif;
}

body{
background:linear-gradient(135deg,#0f172a,#1e3a8a);
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
}

.card{

width:500px;
background:white;
padding:35px;
border-radius:20px;
box-shadow:0 10px 30px rgba(0,0,0,.25);

}

h1{

text-align:center;
color:#1e3a8a;
margin-bottom:10px;

}

p{

text-align:center;
color:gray;
margin-bottom:25px;

}

.input-group{

margin-bottom:18px;

}

label{

display:block;
margin-bottom:6px;
font-weight:bold;

}

input,
select{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:10px;
font-size:15px;

}

.btn{

width:100%;
background:#2563eb;
color:white;
padding:14px;
border:none;
border-radius:10px;
font-size:16px;
font-weight:bold;
cursor:pointer;

}

.btn:hover{

background:#1d4ed8;

}

.back{

display:block;
text-align:center;
margin-top:15px;
text-decoration:none;
font-weight:bold;
color:#1e3a8a;

}

</style>

</head>

<body>

<div class="card">

<h1>💸 Transfer Money</h1>

<p>Transfer money securely.</p>

<form action="TransferServlet" method="post">

<div class="input-group">

<label>From Account</label>

<select name="fromAccount" required>

<option value="">Select Account</option>

<%
for(Account account : accounts){
%>

<option value="<%=account.getAccountNumber()%>">

<%=account.getAccountNumber()%>
(
<%=account.getAccountType()%>
)

</option>

<%
}
%>

</select>

</div>

<div class="input-group">

<label>To Account Number</label>

<input
type="text"
name="toAccount"
required>

</div>

<div class="input-group">

<label>Amount</label>

<input
type="number"
name="amount"
step="0.01"
required>

</div>

<div class="input-group">

<label>Remarks (Optional)</label>

<input
type="text"
name="remarks">

</div>

<button class="btn">

Transfer Money

</button>

</form>

<a href="DashboardServlet" class="back">

← Back To Dashboard

</a>

</div>

</body>
</html>