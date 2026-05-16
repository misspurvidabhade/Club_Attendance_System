<%@ page import="java.io.*" %>

<% 
String successMsg = null;

String name=request.getParameter("member");
String branch = request.getParameter("branch"); 
String year = request.getParameter("year");    
String password = request.getParameter("password");

if(name != null && branch != null &&  year != null && password != null &&
    !name.trim().isEmpty() &&
    !branch.trim().isEmpty() &&
    !year.trim().isEmpty() &&
    !password.trim().isEmpty()) {
        FileWriter fw=new FileWriter(application.getRealPath("data/member.txt"),true);
        fw.write(name + "," + branch + "," + year + "," + password + "\n");
        fw.close();
    
    successMsg = "Member Added Successfully.";
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Member</title>
    <style>
        /* Reset default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        /* Full page background with white border */
        body {
            height: 100vh;
            margin: 0;

            background:
                linear-gradient(rgba(250, 248, 248, 0.913), rgba(229, 225, 225, 0.37)),
                url("images/register.jpeg");

            background-size: cover;
            background-position: center;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .page-title {
            position: absolute;
            top: 60px;                 /* distance from top border */
            width: 100%;
            text-align: center;
            font-family: Castellar;
            font-size: 50px;
            font-weight: 600;
            color: #4b2e5a;
            letter-spacing: 2px;
            text-shadow:
                1px 1px 0 #ffffff,
                3px 3px 6px rgba(0,0,0,0.3);
        }

        /* Main card */
        .container {
            background: #ffffff;
            width: 380px;
            padding: 30px 35px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            text-align: center;
        }

        /* Heading */
        .container h1 {
            margin-bottom: 25px;
            color: #333;
            font-size: 26px;
            font-weight: 600;
        }

        /* Labels */
        .container label {
            display: block;
            text-align: left;
            font-weight: 500;
            margin-bottom: 6px;
            color: #555;
        }

        /* Inputs */
        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 12px 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
            margin-bottom: 18px;
            transition: 0.3s ease;
        }

        /* Input focus */
        .container input:focus {
            border-color: #667eea;
            outline: none;
            box-shadow: 0 0 6px rgba(102, 126, 234, 0.5);
        }

        /* Register button */
        .container input[type="submit"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .container input[type="submit"]:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .container input[type="number"]{
            width: 100%;
            padding: 12px 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        /* Success message */
        .success-box {
            margin-top: 15px;
            padding: 12px;
            background: #ecfdf5; /* Mint */
            color: #065f46;
            border-radius: 8px;
            font-weight: 600;
            border-left: 5px solid #10b981;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1 class="page-title">Member Registration</h1>
<div class="container">
    <form method="post" action="RegisterMember.jsp">
        <!-- Name -->
        <label for="member">Name</label>
        <input type="text" name="member" id="member" required>

        <!-- Branch -->
        <label for="branch">Branch</label>
        <input type="text" name="branch" id="branch" required>

        <!---Year --->
        <label for="year">Year</label>
        <input type="number" name="year" id="year" min="1" max="4" required>

        <!-- Password -->
        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>

        <input type="submit" value="Register">

    </form>

    <% if (successMsg != null) { %>
            <div class="success-box">
                <%= successMsg %>
            </div>
        <% } %>

</div>

<!---This prevents from resubmission on refresh--->
<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
</body>
</html>
