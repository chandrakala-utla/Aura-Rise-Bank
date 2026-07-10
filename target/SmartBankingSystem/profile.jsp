<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.bank.model.User"%>

<%
User user =
(User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0B2E6F,#123D91,#1E4DB7);
    overflow:hidden;
}

/* Background Circles */

body::before{
    content:"";
    position:absolute;
    width:340px;
    height:240px;
    border-radius:50%;
    background:rgba(212,160,23,.15);
    top:-120px;
    left:-120px;
}

body::after{
    content:"";
    position:absolute;
    width:280px;
    height:210px;
    border-radius:50%;
    background:rgba(255,255,255,.08);
    bottom:-100px;
    right:-100px;
}

/* Card */

.profile-card{

    position:relative;
    z-index:2;

    width:520px;

    background:white;

    padding:24px 35px;

    border-radius:22px;

    border-top:6px solid #D4A017;

    box-shadow:0 25px 60px rgba(0,0,0,.25);

}

/* Logo */

.logo{

    text-align:center;

    margin-bottom:5px;
}

.logo img{

    width:180px;

    display:block;

    margin:auto;
}

/* Heading */

.profile-header{

    text-align:center;

    margin-bottom:19px;
}

.profile-header h1{

    color:#0B2E6F;

    font-size:32px;

    margin-top:8px;
}

.profile-header p{

    color:#6B7280;

    margin-top:5px;
}

/* Information */

.info{

    margin-bottom:15Spx;
}

.info label{

    display:block;

    margin-bottom:8px;

    font-weight:bold;

    color:#374151;
}

.info p{

    padding:13px;

    background:#F8FAFC;

    border:1px solid #E5E7EB;

    border-radius:10px;

    color:#111827;

    font-size:15px;
}

/* Buttons */

.back-btn{

    display:block;

    text-align:center;

    text-decoration:none;

    margin-top:14px;

    padding:13px;

    border-radius:10px;

    font-weight:bold;

    transition:.3s;
}

.dashboard-btn{

    background:#0B2E6F;

    color:white;
}

.dashboard-btn:hover{

    background:#D4A017;

    color:#0B2E6F;
}

.password-btn{

    background:#16A34A;

    color:white;
}

.password-btn:hover{

    background:#15803D;
}

/* Footer */

.footer{

    position:fixed;

    bottom:18px;

    width:100%;

    text-align:center;

    color:white;

    font-size:14px;
}

</style>

</head>

<body>

<div class="profile-card">

    <div class="logo">

        <img src="images/aurarise-logo.png"
             alt="AURARISE BANK">

    </div>

    <div class="profile-header">

        <h1>👤 My Profile</h1>

        <p>Your personal banking information</p>

    </div>

    <div class="info">

        <label>Full Name</label>

        <p><%= user.getFullName() %></p>

    </div>

    <div class="info">

        <label>Email Address</label>

        <p><%= user.getEmail() %></p>

    </div>

    <div class="info">

        <label>Phone Number</label>

        <p><%= user.getPhone() %></p>

    </div>

    <a href="DashboardServlet"
       class="back-btn dashboard-btn">

        🏠 Back To Dashboard

    </a>

    <a href="change-password.jsp"
       class="back-btn password-btn">

        🔐 Change Password

    </a>

</div>

<div class="footer">

© 2026 AURARISE BANK • Secure Today. Prosper Tomorrow.

</div>

</body>
</html>