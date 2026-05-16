<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club Attendance System</title>

<style>
/* ===== RESET ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

/* ===== PAGE BACKGROUND ===== */
body {
    height: 100vh;
    margin: 0;

    background:
        linear-gradient(rgba(250, 248, 248, 0.913), rgba(229, 225, 225, 0.37)),
        url("images/welcome.jpg");

    background-size: cover;
    background-position: center;

    display: flex;
    align-items: center;
    justify-content: center;
}

/* ===== MAIN CARD ===== */
.container {
    background: #ffffff;
    width: 420px;
    padding: 40px 30px;
    border-radius: 16px;
    text-align: center;
    box-shadow: 0 20px 40px rgba(0,0,0,0.25);
    animation: slideUp 0.6s ease;
}

/* ===== HEADING ===== */
.container h1 {
    color: #1f2933;
    margin-bottom: 30px;
    font-size: 26px;
}

/* ===== BUTTONS ===== */
.btn {
    width: 100%;
    padding: 14px;
    margin: 12px 0;
    font-size: 16px;
    font-weight: 600;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    color: #fff;
    transition: transform 0.2s, box-shadow 0.2s;
}

/* Different role colors */
.head {
    background: linear-gradient(to right, #ef4444, #f97316);
}
.coordinator {
    background: linear-gradient(to right, #10b981, #34d399);
}
.member {
    background: linear-gradient(to right, #3b82f6, #60a5fa);
}

/* Hover effect */
.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 20px rgba(0,0,0,0.2);
}

/* ===== FOOTER TEXT ===== */
.footer {
    margin-top: 25px;
    font-size: 13px;
    color: #6b7280;
}

/* ===== ANIMATION ===== */
@keyframes slideUp {
    from {opacity: 0; transform: translateY(40px);}
    to {opacity: 1; transform: translateY(0);}
}

body{ 
    text-align:center; 
    font-family:"Segoe UI", Tahoma, Geneva, Verdana, sans-serif; 
    /*background:#eef2f3;*/
}
button{ 
    padding:10px 20px; 
    margin:15px; 
    font-size:18px;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Welcome to<br>Club Attendance System</h1>

    <button class="btn head" onclick="location.href='HeadLogin.jsp'">
        Head Login
    </button>

    <button class="btn coordinator" onclick="location.href='CoordinatorLogin.jsp'">
        Coordinator Login
    </button>

    <button class="btn member" onclick="location.href='MemberLogin.jsp'">
        Member Login
    </button>

    <div class="footer">
        Developed by ClubCheck Trio
    </div>
</div>



</body>
</html>