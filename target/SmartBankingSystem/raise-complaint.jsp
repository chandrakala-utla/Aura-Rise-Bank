<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.bank.model.User"%>

<%
User user = (User)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Raise Complaint</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

body{
background:#F4F7FC;
}

.container{

width:95%;
max-width:700px;

margin:50px auto;

}

.card{

background:white;

padding:40px;

border-radius:20px;

box-shadow:0 10px 25px rgba(0,0,0,.08);

}

h1{

color:#123D91;

margin-bottom:10px;

}

.subtitle{

color:#64748B;

margin-bottom:30px;

}

label{

display:block;

margin-bottom:8px;

font-weight:600;

color:#123D91;

}

input,
textarea{

width:100%;

padding:14px;

border:1px solid #D1D5DB;

border-radius:10px;

margin-bottom:20px;

font-size:15px;

outline:none;

}

input:focus,
textarea:focus{

border-color:#123D91;

}

textarea{

resize:none;

}

button{

background:#123D91;

color:white;

border:none;

padding:15px;

border-radius:10px;

font-size:16px;

font-weight:bold;

cursor:pointer;

width:100%;

transition:.3s;

}

button:hover{

background:#D4A017;

color:#123D91;

}

.back{

display:inline-block;

margin-top:20px;

text-decoration:none;

background:#123D91;

color:white;

padding:12px 24px;

border-radius:8px;

font-weight:bold;

}

.back:hover{

background:#D4A017;

color:#123D91;

}
.success-message{

    background:#DCFCE7;

    color:#166534;

    border:1px solid #86EFAC;

    padding:15px;

    border-radius:10px;

    margin-bottom:20px;

    text-align:center;

    font-weight:600;

}

.error-message{

    background:#FEE2E2;

    color:#B91C1C;

    border:1px solid #FCA5A5;

    padding:15px;

    border-radius:10px;

    margin-bottom:20px;

    text-align:center;

    font-weight:600;

}
</style>

</head>

<body>

<div class="container">

<div class="card">

<h1>Raise Complaint</h1>

<p class="subtitle">

Tell us your issue. Our support team will review it.

</p>
<%
String success = request.getParameter("success");
String error = request.getParameter("error");

if(success != null){
%>

<div class="success-message">

    ✅ Your complaint has been submitted successfully.
    Our support team will review it shortly.

</div>

<%
}

if(error != null){
%>

<div class="error-message">

    ❌ Failed to submit complaint.
    Please try again.

</div>

<%
}
%>
<form action="RaiseComplaintServlet" method="post">

<label>Subject</label>

<input
type="text"
name="subject"
required>

<label>Complaint</label>

<textarea
name="message"
rows="6"
required></textarea>

<button type="submit">

Submit Complaint

</button>

</form>

</div>

<a href="DashboardServlet" class="back">

← Back to Dashboard

</a>

</div>

</body>

</html>