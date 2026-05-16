<%@ page import="java.io.*" %>

<%
String u = request.getParameter("user");
String p = request.getParameter("pass");

boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
boolean loginFailed = false; 

if (isPost) {
    if ("Coordinator".equals(u != null ? u.trim() : "") &&
        "CO123".equals(p != null ? p.trim() : "")) {

        session.setAttribute("role", "COORDINATOR");
        response.sendRedirect("CoordinatorDashboard.jsp");
        return;
    }else {
        loginFailed = true;    //marks failure
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Coordinator Login | Club Attendance System</title>

    <style>
        *{
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        body{
            height: 100vh;
            margin: 0;

            background:
            linear-gradient(rgba(250, 248, 248, 0.913), rgba(229, 225, 225, 0.37)),
            url("images/cologin.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container{
            width: 420px;
            background: white;
            border-radius: 18px;
            box-shadow: 0 20px 45px rgba(0,0,0,0.25);
            padding: 35px;
            text-align: center;
        }

        .role-badge{
            display: inline-block;
            background: #e6fff5;
            color: #12b886;
            padding: 6px 18px;
            border-radius: 20px;
            font-size: 13px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .login-container h1{
            margin-bottom: 8px;
            color: #222;
        }

        .login-container p{
            margin-bottom: 25px;
            color: #666;
            font-size: 14px;
        }

        .input-group{
            text-align: left;
            margin-bottom: 18px;
        }

        .input-group label{
            font-size: 14px;
            color: #444;
        }

        .input-group input{
            width: 100%;
            padding: 11px;
            margin-top: 6px;
            border-radius: 10px;
            border: 1px solid #ccc;
            outline: none;
            font-size: 14px;
        }

        .input-group input:focus{
            border-color: #12b886;
            box-shadow: 0 0 6px rgba(18,184,134,0.5);
        }

        .login-btn{
            width: 100%;
            padding: 13px;
            margin-top: 15px;
            background: linear-gradient(to right, #12b886, #20c997);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 17px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .login-btn:hover{
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.25);
        }

        .error-msg{
            color: #d32f2f;
            background: #fdecea;
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 8px;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }

        .footer-text{
            margin-top: 22px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>
<body>
<div class="login-container">

    <div class="role-badge">COORDINATOR ACCESS</div>

    <h1>Coordinator Login</h1>
    <p>Login to manage attendance & members</p>

    <%
        if (loginFailed) {
        %>
            <div class="error-msg">Invalid Login</div>
        <%
        }
    %>

    <form action="CoordinatorLogin.jsp" method="post">

        <div class="input-group">
            <label>Username</label>
            <input type="text" name="user" placeholder="Enter username" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="pass" placeholder="Enter password" required>
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <div class="footer-text">
       Developed by ClubCheck Trio
    </div>

</div>
</body>
</html>
