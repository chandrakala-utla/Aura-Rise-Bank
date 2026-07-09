<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String error = request.getParameter("error");

String email = request.getParameter("email");

if(email == null){
    email = "";
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Login</title>

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

    position:relative;
}

/* Decorative Background */

body::before{

    content:"";

    position:absolute;

    width:250px;

    height:250px;

    border-radius:50%;

    background:rgba(212,160,23,.15);

    top:-80px;

    left:-80px;

}

body::after{

    content:"";

    position:absolute;

    width:220px;

    height:220px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    bottom:-70px;

    right:-70px;

}

/* Card */
.card{

    position:relative;

    z-index:2;

    width:480px;

    max-width:100%;

    background:white;

    padding:25px 35px;

    border-radius:22px;

    border-top:6px solid #D4A017;

    box-shadow:0 25px 60px rgba(0,0,0,.25);

    animation:popup .45s ease;

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

    margin-bottom:5px;
}

.logo img{

    width:180px;

    height:auto;

    display:block;

    margin:auto;
}

/* Heading */

.heading{

    text-align:center;

    margin-bottom:20px;
}

.heading h2{

    color:#0B2E6F;

    font-size:38px;

    font-weight:700;

    margin-bottom:8px;
}

.heading p{

    color:#64748B;

    font-size:15px;
}
/* Form */

.input-group{

    margin-bottom:16px;
}

.input-group label{

    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#374151;

}

.input-group input{

    width:100%;

    padding:13px;

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

    padding:14px;

    margin-top:5px;

    background:#0B2E6F;

    color:white;

    border:none;

    border-radius:10px;

    font-size:17px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;
}

.btn:hover{

    background:#D4A017;

    color:#0B2E6F;

    transform:translateY(-2px);

}

/* Error */

.error-message{

    background:#FEE2E2;

    color:#B91C1C;

    border:1px solid #EF4444;

    padding:12px;

    border-radius:8px;

    margin-bottom:18px;

    text-align:center;

    font-weight:600;

}

/* Shake */

@keyframes shake{

0%{transform:translateX(0);}
20%{transform:translateX(-8px);}
40%{transform:translateX(8px);}
60%{transform:translateX(-8px);}
80%{transform:translateX(8px);}
100%{transform:translateX(0);}

}

.shake{

    animation:shake .45s ease;

}

/* Links */
.links{

    text-align:center;

    margin-top:18px;

    line-height:25px;
}
.links a{

    color:#0B2E6F;

    text-decoration:none;

    font-weight:600;

}

.links a:hover{

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
/* Responsive */

@media(max-width:600px){

.card{

    padding:25px;

}

.logo img{

    width:140px;

}

.heading h2{

    font-size:30px;

}

.footer{

    font-size:12px;

}

}

</style>

</head>

<body>

<div class="card <%= "invalid".equals(error) ? "shake" : "" %>">

<div class="logo">

<img src="images/aurarise-logo.png"
alt="AURA RISE BANK">

</div>

<div class="heading">

<h2>Welcome Back</h2>

<p>

Sign in to securely access your AURA RISE BANK account.

</p>

</div>

<form action="LoginServlet"
method="post">

<%
if("invalid".equals(error)){
%>

<div class="error-message">

❌ Invalid Email or Password

</div>

<%
}
%>

<div class="input-group">

<label>Email Address</label>

<input
type="email"
name="email"
value="<%=email%>"
placeholder="Enter your email"
required>

</div>

<div class="input-group">

<label>Password</label>

<input
type="password"
name="password"
placeholder="Enter your password"
required>

</div>

<button
type="submit"
class="btn">

🔐 Login Securely

</button>

</form>

<div class="links">

<a href="forgot-password.jsp">

Forgot Password?

</a>

<br>

New to AURA RISE BANK?

<a href="register.jsp">

Create Account

</a>

</div>

</div>

<div class="footer">

© 2026 <b>AURA RISE BANK</b> • Secure Today. Prosper Tomorrow.

</div>

</body>

</html>
