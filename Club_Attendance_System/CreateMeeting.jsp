<%@ page import="java.io.*" %>

<%
String successMsg = null;

if ("POST".equalsIgnoreCase(request.getMethod())){
    String code = request.getParameter("code");
    if (code != null && !code.trim().isEmpty()) {

        FileWriter fw = new FileWriter(
            application.getRealPath("data/meetingcodes.txt"), true);
        fw.write(code + "\n");
        fw.close();
        successMsg = "Code has been created!";
    }
} 
%>

<html>
<head>

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
                url("images/code.jpeg");

            background-size: cover;
            background-position: center;

            display: flex;
            justify-content: center;
            align-items: center;
        }

    /* Page title outside the card */
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

    /* Main card container */
    .container {
        background: #ffffff;
        width: 380px;
        padding: 30px 35px;
        border-radius: 12px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.18);
        text-align: center;
    }

    /* Page title */
    .container h1 {
        margin-bottom: 25px;
        color: #333;
        font-size: 26px;
        font-weight: 600;
    }

    /* Label styling */
    .container label {
        display: block;
        text-align: left;
        font-weight: 500;
        margin-bottom: 6px;
        color: #555;
    }

    /* Input field */
    .container input[type="text"] {
        width: 100%;
        padding: 12px 14px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
        margin-bottom: 20px;
        transition: 0.3s ease;
    }

    /* Input focus */
    .container input[type="text"]:focus {
        border-color: #667eea;
        outline: none;
        box-shadow: 0 0 6px rgba(102, 126, 234, 0.5);
    }

    /* Save button */
    .container input[type="submit"] {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: none;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s ease;
    }

    /* Button hover effect */
    .container input[type="submit"]:hover {
        transform: translateY(-1px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.2);
    }

    /* Success message (optional) */
    .success-box {
        margin-top: 15px;
        padding: 12px;
        background: #ecfdf5;   /* Mint */
        color: #065f46;
        border-radius: 8px;
        font-weight: 600;
        border-left: 5px solid #10b981;
        text-align: center;
    }
    </style>
</head>
<body>
    <h1 class="page-title">Create Meeting Code</h1>

    <div class="container">
    <form method="post">
        <label for="code">Meeting Code</label>
        <input type="text" id="code" name="code" required>

        <input type="submit" value="Save">
    </form>

    <% if (successMsg != null) { %>
        <div class="success-box">
            <%= successMsg %>
        </div>
    <% } %>
</div>

</body>
</html>
