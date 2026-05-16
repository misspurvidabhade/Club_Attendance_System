<%@ page import="java.io.*" %>
<%
if (session.getAttribute("role") == null ||
    !"COORDINATOR".equals(session.getAttribute("role"))) {
    response.sendRedirect("CoordinatorLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head><title>Coordinator Dashboard | Club Attendance System</title>

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
            background: linear-gradient(to right,#0db030,#11d548);
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
        .pistachio{background: linear-gradient(to right,#93c572,#b6e388);}
        .avocado{background: linear-gradient(to right,#6b8e23,#9acd32);}
        .forest-green{background: linear-gradient(to right,#228b22,#1c6b1c);}
        .evergreen{background: linear-gradient(to right,#014421,#013220);}

        /* Text color logic */
        .card .pistachio ~ h3,
        .card .pistachio ~ p {
            color: #93c572;
        }

        .card .avocado ~ h3,
        .card .avocado ~ p {
            color: #6b8e23;
        }

        .card .forest-green ~ h3,
        .card .forest-green ~ p {
            color: #228b22;
        }

        .card .evergreen ~ h3,
        .card .evergreen ~ p {
            color: #013220;
        }

        .card a{
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>
    <div class="navbar">
    Coordinator Dashboard
</div>

<div class="container">

    <!-- WELCOME -->
    <div class="welcome-card">
        <h2>Welcome, Coordinator</h2>
        <p>Manage your club activities and attendance from here.</p>
    </div>

    <!-- DASHBOARD OPTIONS -->
    <div class="grid">

        <a href="CreateMeeting.jsp" class="card">
            <div class="icon pistachio"></div>
            <h3>Create Meeting Code</h3>
            <p>Generate attendance code</p>
        </a>

        <a href="MarkAttendance.jsp" class="card">
            <div class="icon avocado"></div>
            <h3>Mark Attendance</h3>
            <p>Do not forget</p><p>to mark your attendance</p>
        </a>

        <a href="AttendanceSheet.jsp" class="card">
            <div class="icon forest-green"></div>
            <h3>Download Sheet</h3>
            <p>Get attendance report</p>
        </a>

        <a href="login.jsp" class="card">
            <div class="icon evergreen"></div>
            <h3>Logout</h3>
            <p>Exit from dashboard</p>
        </a>

    </div>
</div>
</body>
</html>
