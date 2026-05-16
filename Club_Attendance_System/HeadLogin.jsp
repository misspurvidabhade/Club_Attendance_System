<%@ page import="java.io.*" %>

<%
String u = request.getParameter("user");
String p = request.getParameter("pass");

boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
boolean loginFailed = false;  

if (isPost) {
    if ("Head".equals(u != null ? u.trim() : "") &&
        "H123".equals(p != null ? p.trim() : "")) {

        session.setAttribute("role", "HEAD");
        response.sendRedirect("HeadDashboard.jsp");
        return;
    } else {
        loginFailed = true;    //marks failure
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Head Login | Club Attendance System</title>

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
            url("images/headlogin.jpg");
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
            border-color: #f97316;
            box-shadow: 0 0 5px rgba(249,115,22,0.5);
        }

        .login-btn{
            width: 100%;
            padding: 13px;
            margin-top: 15px;
            background: linear-gradient(to right, #ff512f, #f09819);
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

        .role-badge{
            display: inline-block;
            background: #fff3e0;
            color: #f97316;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 13px;
            margin-bottom: 20px;
            font-weight: 600;
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
        <div class="role-badge">CLUB HEAD ACCESS</div>

        <h1>Head Login</h1>
        <p>Sign in to manage club activities.</p>

        <%
        if (loginFailed) {  
        %>
            <div class="error-msg">Invalid Login</div>
        <%
        }
        %>

        <form action="HeadLogin.jsp" method="post">

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