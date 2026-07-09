<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Register</title>

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

    flex-direction:column;

    justify-content:flex-start;

    align-items:center;

    background:linear-gradient(135deg,#0B2E6F,#123D91,#1E4DB7);

    overflow-y:auto;

    overflow-x:hidden;

    padding:40px 0 25px;
}
/* Decorative Background */

body::before{

    content:"";

    position:absolute;

    width:350px;

    height:350px;

    border-radius:50%;

    background:rgba(212,160,23,.15);

    top:-120px;

    left:-120px;
}

body::after{

    content:"";

    position:absolute;

    width:280px;

    height:200px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    bottom:-100px;

    right:-100px;
}

/* Card */

.card{

    position:relative;

    z-index:2;

    width:500px;

    background:white;

    padding:15px 35px;

    border-radius:22px;

    border-top:6px solid #D4A017;

    box-shadow:0 25px 60px rgba(0,0,0,.25);

    animation:popup .5s ease;

    margin-bottom:20px;
}

@keyframes popup{

    from{

        opacity:0;

        transform:translateY(30px);
    }

    to{

        opacity:1;

        transform:translateY(0);
    }
}

/* Logo */

.logo{

    text-align:center;

    margin-bottom:0px;
}

.logo img{

    width:190px;

    height:auto;

    display:block;

    margin:auto;
}

/* Heading */

.heading{

    text-align:center;

    margin-bottom:15px;
}

.heading h2{

    color:#0B2E6F;

    font-size:34px;

    font-weight:700;

    margin-bottom:8px;
}

.heading p{

    color:#6B7280;
}

/* Inputs */

.input-group{

    margin-bottom:10px;
}

.input-group label{

    display:block;

    margin-bottom:6px;

    font-weight:600;

    color:#374151;
}

.input-group input{

    width:100%;

    padding:12px;

    border:1px solid #D1D5DB;

    background:#F8FAFC;

    border-radius:10px;

    font-size:15px;

    transition:.3s;
}

.input-group input:focus{

    outline:none;

    border-color:#D4A017;

    box-shadow:0 0 10px rgba(212,160,23,.25);
}

/* Button */

.btn{

    width:100%;

    padding:13px;

    margin-top:5px;

    background:#0B2E6F;

    color:white;

    border:none;

    border-radius:10px;

    font-size:17px;

    font-weight:bold;

    cursor:pointer;

    transition:.2s;
}

.btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);
}

/* Login Link */

.login-link{

    text-align:center;

    margin-top:18px;

    line-height:24px;

    color:#374151;
}

.login-link a{

    text-decoration:none;

    color:#0B2E6F;

    font-weight:bold;
}

.login-link a:hover{

    color:#D4A017;
}

/* Footer */

.footer{

    width:100%;

    text-align:center;

    color:white;

    font-size:14px;

    margin-top:0;

    padding:10px 0 15px;

    position:relative;

    z-index:2;
}

</style>

</head>

<body>

<div class="card">

<div class="logo">

<img src="images/aurarise-logo.png"
alt="AURA RISE BANK">

</div>

<div class="heading">

<h2>Create Account</h2>

<p>
Join AURA RISE BANK and start your secure banking journey.
</p>

</div>

<form action="RegisterServlet" method="post">

<div class="input-group">

<label>Full Name</label>

<input
type="text"
name="fullName"
minlength="3"
pattern="[A-Za-z ]+"
title="Name should contain only letters and spaces"
placeholder="Enter your full name"
required>

</div>

<div class="input-group">

<label>Email Address</label>

<input
type="email"
name="email"
placeholder="Enter your email"
required>

</div>

<div class="input-group">

<label>Phone Number</label>

<input
type="tel"
name="phone"
pattern="[6-9][0-9]{9}"
maxlength="10"
minlength="10"
placeholder="Enter 10-digit mobile number"
title="Mobile number must start with 6,7,8 or 9"
required>

</div>

<div class="input-group">

<label>Password</label>

<input
type="password"
name="password"
minlength="8"
maxlength="20"
pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,20}"
title="Password must contain uppercase, lowercase, number and special character"
placeholder="Create a strong password"
required>

</div>

<button type="submit" class="btn">

Create Account

</button>

</form>

<div class="login-link">

Already have an account?

<a href="login.jsp">

Login Here

</a>

</div>

</div>

<div class="footer">

© 2026 AURA RISE BANK • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>