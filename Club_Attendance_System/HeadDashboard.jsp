<%@ page import="java.io.*" %>
<%
if (session.getAttribute("role") == null ||
    !"HEAD".equals(session.getAttribute("role"))) {
    response.sendRedirect("HeadLogin.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Head Dashboard | Club Attendance System</title>

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
            background: linear-gradient(to right,#ffa82f,#f09819);
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
            transition:transform 0.3s, box-shadow 0.25s;
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

        .yellow{ background: linear-gradient(to right,#fda923,#f9c426); }
        .orange{ background: linear-gradient(to right,#ff4006,#fb7b21); }
        .red{ background: linear-gradient(to right,#ef1515,#e31111); }
        .brown-light{ background: linear-gradient(to right,#c68642,#e0ac69); }
        .brown-dark{ background: linear-gradient(to right,#731f08,#400808); }


        .card .yellow ~ h3,
        .card .yellow ~ p {
            color: #f9c426;
        }

        .card .orange ~ h3,
        .card .orange ~ p {
            color: #ff4006;
        }

        .card .red ~ h3,
        .card .red ~ p {
            color: #ef1515;
        }

        .card .brown-light ~ h3,
        .card .brown-light ~ p {
            color: #c68642;
        }

        .card .brown-dark ~ h3,
        .card .brown-dark ~ p {
            color: #400808;
        }

        .card a{
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>

<div class="navbar">
    Head Dashboard
</div>

<div class="container">

    <!-- WELCOME -->
    <div class="welcome-card">
        <h2>Welcome, Head</h2>
        <p>Manage your club activities and attendance from here.</p>
    </div>

    <!-- DASHBOARD OPTIONS -->
    <div class="grid">

        <a href="RegisterMember.jsp" class="card">
            <div class="icon yellow"></div>
            <h3>Register Member</h3>
            <p>Add new club members</p>
        </a>

        <a href="CreateMeeting.jsp" class="card">
            <div class="icon orange"></div>
            <h3>Create Meeting Code</h3>
            <p>Generate attendance code</p>
        </a>

        <a href="MarkAttendance.jsp" class="card">
            <div class="icon red"></div>
            <h3>Mark Attendance</h3>
            <p>Do not forget</p><p>to mark your attendance</p>
        </a>

        <a href="AttendanceSheet.jsp" class="card">
            <div class="icon brown-light"></div>
            <h3>Download Sheet</h3>
            <p>Get attendance report</p>
        </a>

        <a href="login.jsp" class="card">
            <div class="icon brown-dark"></div>
            <h3>Logout</h3>
            <p>Exit from dashboard</p>
        </a>

    </div>
</div>
</body>
</html>
