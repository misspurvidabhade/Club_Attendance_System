<%@ page import="java.io.*" %>
 
<% 
String successMsg = null;
String errorMsg = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String name   = request.getParameter("name");
    String branch = request.getParameter("branch");
    String code   = request.getParameter("code");
    String year   = request.getParameter("year");

    if (name != null && branch != null && year != null && code != null &&
        !name.trim().isEmpty() &&
        !branch.trim().isEmpty() &&
        year.trim().matches("[1-4]") &&
        !code.trim().isEmpty()) {

        /* READ LAST MEETING CODE */
        File codeFile = new File(application.getRealPath("data/meetingcodes.txt"));
        BufferedReader br = new BufferedReader(new FileReader(codeFile));

        String line, lastCode = null;
        while ((line = br.readLine()) != null) {
            if (!line.trim().isEmpty()) {
                lastCode = line.trim();
            }
        }
        br.close();

        /* VALIDATE MEETING CODE */
        if (lastCode != null && code.trim().equals(lastCode)) {

            FileWriter fw = new FileWriter(
                application.getRealPath("data/attendance.txt"), true);

            fw.write(name + " | " + branch + " | " + year + " | " +
                     code + " | Present\n");
            fw.close();

            successMsg = "Attendance Marked Successfully.";

        } else {
            errorMsg = "Invalid or Expired Meeting Code.";
        }
    }
}
%>

<!DOCTYPE html>
<html>
    <head>
        <style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    /* Page background with white border */
    body {
            height: 100vh;
            margin: 0;

            background:
                linear-gradient(rgba(250, 248, 248, 0.913), rgba(229, 225, 225, 0.37)),
                url("images/mark.jpeg");

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
        width: 400px;
        padding: 32px 36px;
        border-radius: 14px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        text-align: center;
    }

    /* Page title */
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
    .container input[type="text"] {
        width: 100%;
        padding: 12px 14px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
        margin-bottom: 18px;
        transition: 0.3s ease;
    }

    /* Input focus effect */
    .container input[type="text"]:focus {
        border-color: #667eea;
        outline: none;
        box-shadow: 0 0 6px rgba(102, 126, 234, 0.5);
    }

    /* Submit button */
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

    /* Button hover */
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
        margin-top: 18px;
        padding: 12px;
        background: #ecfdf5;
        color: #065f46;
        border-radius: 8px;
        font-weight: 600;
        border-left: 5px solid #10b981;
        text-align: center;
    }

    .error-box{
        margin-top: 15px;
        padding: 12px;
        background: #fdecea;
        color: #b91c1c;
        border-left: 5px solid #ef4444;
        border-radius: 8px;
        font-weight: 600;
        text-align: center;
    }

    </style>
</head>
<body>
    <h1 class="page-title">Mark Attendance</h1>
    <div class="container">

    <form method="post">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Branch</label>
        <input type="text" name="branch" required>

        <label>Year</label>
        <input type="number" name="year" min="1" max="4" required>

        <label>Meeting Code</label>
        <input type="text" name="code" required>

        <input type="submit" value="Submit Attendance">
    </form>
  
        <% if (successMsg != null) { %>
            <div class="success-box"><%= successMsg %></div>
        <% } %>

        <% if (errorMsg != null) { %>
            <div class="error-box"><%= errorMsg %></div>
        <% } %>
</div>
   
</body>
</html>
