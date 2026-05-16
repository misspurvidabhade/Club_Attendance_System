<%@ page import="java.io.*" %>
<%
if (!"MEMBER".equals(session.getAttribute("role"))) {
    response.sendRedirect("MemberLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Member Dashboard | Club Attendance System</title>

    <style>
        *{
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, sans-serif;
        }

       
        body{
            height:100vh;
            background: linear-gradient(
                135deg,
                #fdfcfb,
                #e2ebf0
            );
        }


        /* Top Navbar */
        .navbar{
            background: linear-gradient(to right,#7db3ea,#8fcaf4);
            padding: 16px 30px;
            color: white;
            font-size: 20px;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        /* Page Container */
        .container{
            padding: 30px;
        }

        /* Welcome Card */
        .welcome-card{
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            margin-bottom: 30px;
        }

        .welcome-card h2{
            margin: 0;
            color: #333;
        }

        .welcome-card p{
            margin-top: 6px;
            color: #666;
        }

        /* Dashboard Grid */
        .grid{
            display: grid;
            grid-auto-flow: column;
            gap: 25px;
            justify-content: center;
        }
    

        /* Feature Card */
        .card{
            width: 300px;             /* same width for all */
            text-align: center;
            text-decoration: none;
            font-weight: bold; 
            color: #333;
            background: white;
            border-radius: 18px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
            transition: transform 0.25s, box-shadow 0.25s;
            cursor: pointer;
        }

        .card:hover{
            transform: translateY(-6px);
            box-shadow: 0 18px 40px rgba(0,0,0,0.25);
        }

        .icon{
            width: 65px;
            height: 65px;
            margin: auto;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            color: white;
            margin-bottom: 15px;
        }

        /* Background gradients */

        .baby-blue{background: linear-gradient(to right,#a7c7e7,#9fc0df);}
        .azure{background: linear-gradient(to right,#007fff,#1b78ba);}
        .navy{background: linear-gradient(to right,#1d325d,#102a5c);}

        .card .baby-blue ~ h3,
        .card .baby-blue ~ p {
            color: #9fc0df;
        }

        .card .azure ~ h3,
        .card .azure ~ p {
            color: #1b78ba;
        }

        .card .navy ~ h3,
        .card .navy ~ p {
            color: #0a1a3a;
        }
        .card a{
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>
<div class="navbar">
    Member Dashboard
</div>

<div class="container">

    <!-- WELCOME -->
    <div class="welcome-card">
        <h2>Welcome, Dear Member</h2>
        <p>Happy to see you join, please mark your attendance.</p>
    </div>

    <!-- DASHBOARD OPTIONS -->
    <div class="grid">

        <a href="MarkAttendance.jsp" class="card">
            <div class="icon baby-blue"></div>
            <h3>Mark Attendance</h3>
            <p>Do not forget</p><p>to mark your attendance</p>
        </a>

        <a href="AttendanceSheet.jsp" class="card">
            <div class="icon azure"></div>
            <h3>Download Sheet</h3>
            <p>Look who is present today.</p>
        </a>

        <a href="login.jsp" class="card">
            <div class="icon navy"></div>
            <h3>Logout</h3>
            <p>Exit from dashboard</p>
        </a>

    </div>
</div>
</body>
</html>
