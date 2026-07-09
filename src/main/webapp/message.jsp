<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String icon=request.getParameter("icon");
String title=request.getParameter("title");
String text=request.getParameter("text");
String redirect=request.getParameter("redirect");

if(icon==null) icon="success";
if(title==null) title="Success";
if(text==null) text="";
if(redirect==null) redirect="DashboardServlet";

String iconSymbol="✔";
String iconClass="success";

if("error".equals(icon)){
    iconSymbol="✖";
    iconClass="error";
}
else if("warning".equals(icon)){
    iconSymbol="!";
    iconClass="warning";
}
else if("info".equals(icon)){
    iconSymbol="i";
    iconClass="info";
}

/* Dynamic Button Text */

String buttonText="Continue";

if(redirect.contains("Dashboard")){
    buttonText="Go to Dashboard";
}
else if(redirect.contains("login")){
    buttonText="Go to Login";
}
else if(redirect.contains("deposit")){
    buttonText="Back to Deposit";
}
else if(redirect.contains("withdraw")){
    buttonText="Back to Withdraw";
}
else if(redirect.contains("transfer")){
    buttonText="Back to Transfer";
}
else if(redirect.contains("beneficiary")){
    buttonText="View Beneficiaries";
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>AURA RISE BANK | Message</title>

<meta http-equiv="refresh"
content="5;URL=<%=redirect%>">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

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

background:
linear-gradient(135deg,#0B2E6F,#123D91,#1E4DB7);

overflow:hidden;

position:relative;

}

/* Decorative Background */

body::before{

content:"";

position:absolute;

width:380px;
height:380px;

border-radius:50%;

background:rgba(212,160,23,.15);

top:-140px;
left:-140px;

}

body::after{

content:"";

position:absolute;

width:260px;
height:260px;

border-radius:50%;

background:rgba(255,255,255,.08);

bottom:-90px;
right:-90px;

}

/* Card */

.card{

position:relative;

z-index:2;

width:520px;

max-width:92%;

background:#fff;

border-radius:24px;

border-top:6px solid #D4A017;

padding:40px;

text-align:center;

box-shadow:
0 25px 60px rgba(0,0,0,.25);

animation:popup .45s ease;

}

@keyframes popup{

from{

opacity:0;

transform:
translateY(30px)
scale(.96);

}

to{

opacity:1;

transform:
translateY(0)
scale(1);

}

}

/* Logo */

.logo img{

width:150px;

margin-bottom:10px;

}

/* Bank Name */

.bank-name{

font-size:28px;

font-weight:bold;

color:#123D91;

margin-bottom:6px;

letter-spacing:.5px;

}

.tagline{

font-size:14px;

color:#64748B;

margin-bottom:20px;

}

/* Success Icon */

.icon{

width:95px;
height:95px;

margin:20px auto;

border-radius:50%;

display:flex;

justify-content:center;
align-items:center;

font-size:52px;

font-weight:bold;

animation:popIcon .5s ease;

}

@keyframes popIcon{

0%{

transform:scale(0);

}

70%{

transform:scale(1.2);

}

100%{

transform:scale(1);

}

}

/* Success */

.success{

color:#16A34A;

border:4px solid #16A34A;

background:#ECFDF5;

}

/* Error */

.error{

color:#DC2626;

border:4px solid #DC2626;

background:#FEF2F2;

}

/* Warning */

.warning{

color:#D97706;

border:4px solid #D97706;

background:#FFF7ED;

}

/* Info */

.info{

color:#2563EB;

border:4px solid #2563EB;

background:#EFF6FF;

}

/* Title */

h1{

font-size:32px;

color:#123D91;

margin-top:20px;

}

/* Message */

.message{

margin-top:15px;

font-size:17px;

line-height:30px;

color:#64748B;

min-height:55px;

}

/* Button */

.btn{

display:inline-block;

margin-top:28px;

padding:14px 38px;

background:#123D91;

color:#fff;

text-decoration:none;

font-weight:bold;

border-radius:10px;

transition:.3s;

box-shadow:
0 8px 20px rgba(18,61,145,.25);

}

.btn:hover{

background:#D4A017;

color:#123D91;

transform:translateY(-3px);

}

/* Redirect */

.redirect{

margin-top:20px;

font-size:15px;

color:#64748B;

font-weight:500;

}

#countdown{

font-size:20px;

font-weight:bold;

color:#123D91;

}

/* Footer */

.footer{

position:fixed;

bottom:20px;

width:100%;

text-align:center;

color:white;

font-size:14px;

letter-spacing:.5px;

}

@media(max-width:600px){

.card{

padding:30px 22px;

}

.bank-name{

font-size:24px;

}

h1{

font-size:28px;

}

}

</style>

</head>
<body>

<div class="card">

    <!-- ===========================
            BANK LOGO
    ============================ -->

    <div class="logo">

        <img src="images/aurarise-logo.png"
             alt="AURA RISE BANK">

    </div>

    <div class="bank-name">

        AURA RISE BANK

    </div>

    <div class="tagline">

        Secure Today. Prosper Tomorrow.

    </div>

    <!-- ===========================
            STATUS ICON
    ============================ -->

    <div class="icon <%= iconClass %>">

        <%= iconSymbol %>

    </div>

    <!-- ===========================
            TITLE
    ============================ -->

    <h1>

        <%= title %>

    </h1>

    <!-- ===========================
            MESSAGE
    ============================ -->

    <div class="message">

        <%= text %>

    </div>

    <!-- ===========================
            BUTTON
    ============================ -->

    <a href="<%=redirect%>"
       class="btn">

        <%=buttonText%> →

    </a>

    <!-- ===========================
            COUNTDOWN
    ============================ -->

    <div class="redirect">

        Redirecting in

        <span id="countdown">

            5

        </span>

        seconds...

    </div>

</div>

<!-- ===========================
        FOOTER
=========================== -->

<div class="footer">

    © 2026 AURA RISE BANK • Secure Today. Prosper Tomorrow.

</div>

<!-- ===========================
        JAVASCRIPT
=========================== -->

<script>

let seconds = 5;

let countdown =
document.getElementById("countdown");

let timer =
setInterval(function(){

    seconds--;

    countdown.innerHTML = seconds;

    if(seconds <= 0){

        clearInterval(timer);

    }

},1000);

</script>

</body>

</html>