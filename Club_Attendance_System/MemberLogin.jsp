<%@ page import="java.io.*" %>

<%
String errorMsg = null;
boolean loginSuccess = false;

String name = request.getParameter("name");
String password = request.getParameter("password");

if (name != null) name = name.trim();
if (password != null) password = password.trim();

if ("POST".equalsIgnoreCase(request.getMethod())
        && name != null && password != null
        && !name.isEmpty() && !password.isEmpty()) {

    File file = new File(application.getRealPath("data/member.txt"));

    if (file.exists()) {

        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;

        while ((line = br.readLine()) != null) {

            if (line.trim().isEmpty()) continue;

            String data[] = line.split(",");

            // VERY IMPORTANT SAFETY CHECK
            if (data.length < 4) continue;

            String storedName = data[0].trim();
            String storedPassword = data[3].trim();

            // out.println("FILE: " + storedName + " | " + storedPassword);

            if (storedName.equalsIgnoreCase(name)
                    && storedPassword.equals(password)) {

                session.setAttribute("memberName", storedName);
                session.setAttribute("memberBranch", data[1].trim());
                session.setAttribute("memberYear", data[2].trim());
                session.setAttribute("role", "MEMBER");
                loginSuccess = true;
                break;
            }
        }
        br.close();

        if (loginSuccess) {
            response.sendRedirect("MemberDashboard.jsp");
            return;
        } else {
            errorMsg = "Invalid Name or Password";
        }

    } else {
        errorMsg = "Members file not found";
    }
}
%>


<!DOCTYPE html>
<html>
<head>
    <title>Member Login | Club Attendance System</title>

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
            url("images/memberlogin.jpg");
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
            color: #1244b8;
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
            border-color: #1244b8;
            box-shadow: 0 0 6px rgba(18, 57, 184, 0.5);
        }

        .login-btn{
            width: 100%;
            padding: 13px;
            margin-top: 15px;
            background: linear-gradient(to right, #3f53d0, #2047c9);
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

    <div class="role-badge">MEMBER ACCESS</div>

    <h1>Welcome, Member!</h1>
    <p>Happy to see you join, Please mark your attendance.</p>
    <%
        if (errorMsg != null) {
        %>
            <div class="error-msg"><%= errorMsg %></div>
        <%
        }
    %>

    <form method="post">

        <div class="input-group">
            <label>Username</label>
            <input type="text" name="name" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <div class="footer-text">
       Developed by ClubCheck Trio
    </div>

</div>
</body>
</html>
