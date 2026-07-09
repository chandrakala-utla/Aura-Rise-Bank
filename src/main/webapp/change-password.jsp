<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Change Password</title>

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

    display:flex;

    justify-content:center;

    align-items:center;

    overflow:hidden;

    position:relative;
}

/* Background */

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

    width:260px;

    height:240px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    bottom:-90px;

    right:-90px;
}

/* Card */

.card{

    position:relative;

    z-index:2;

    width:540px;

    background:white;

    border-radius:24px;

    border-top:6px solid #D4A017;

    padding:30px;

    box-shadow:0 20px 50px rgba(0,0,0,.25);

    animation:popup .4s ease;
}

@keyframes popup{

from{

opacity:0;

transform:translateY(25px);

}

to{

opacity:1;

transform:translateY(0);

}

}

/* Logo */

.logo{

    text-align:center;

    margin-bottom:18px;
}

.logo img{

    width:180px;

    margin-bottom:5px;
}

.logo h1{

    color:#0B2E6F;

    font-size:34px;

    margin-bottom:5px;
}

.logo p{

    color:#64748B;

    font-size:10px;
}

/* Input */

.input-group{

    margin-bottom:15px;
}

.input-group label{

    display:block;

    margin-bottom:5px;

    font-weight:600;

    color:#374151;
}

.input-group input{

    width:100%;

    padding:12px;

    border:1px solid #D1D5DB;

    border-radius:10px;

    background:#F8FAFC;

    font-size:15px;

    transition:.3s;
}

.input-group input:focus{

    outline:none;

    border-color:#D4A017;

    box-shadow:0 0 10px rgba(212,160,23,.25);
}

/* Button */

.change-btn{

    width:100%;

    padding:13px;

    background:#0B2E6F;

    color:white;

    border:none;

    border-radius:10px;

    font-size:17px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;
}

.change-btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);
}

/* Back */

.back-btn{

    display:block;

    text-align:center;

    margin-top:15px;

    color:#0B2E6F;

    text-decoration:none;

    font-weight:bold;
}

.back-btn:hover{

    color:#D4A017;
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

<div class="card">

<div class="logo">

<img src="images/aurarise-logo.png"
     alt="AURA RISE BANK">

<h1>

🔐 Change Password

</h1>

<p>

Update your password securely to protect your account.

</p>

</div>
<form action="AdminChangePasswordServlet"
      method="post">

    <div class="input-group">

        <label>

            Current Password

        </label>

        <input type="password"
               name="currentPassword"
               placeholder="Enter Current Password"
               required>

    </div>

    <div class="input-group">

        <label>

            New Password

        </label>

        <input type="password"
               name="newPassword"
               placeholder="Enter New Password"
               minlength="8"
               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,}"
               title="Password must contain at least one uppercase letter, one lowercase letter, one number and one special character."
               required>

    </div>

    <div class="input-group">

        <label>

            Confirm Password

        </label>

        <input type="password"
               name="confirmPassword"
               placeholder="Confirm New Password"
               required>

    </div>

    <button type="submit"
            class="change-btn">

        🔒 Change Password

    </button>

</form>

<a href="AdminDashboardServlet?page=settings"
   class="back-btn">

    ← Back To Profile

</a>

</div>

<div class="footer">

    © 2026 <b>AURA RISE BANK</b>
    • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>