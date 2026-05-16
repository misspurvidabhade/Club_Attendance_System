<%@ page import="java.io.*, java.util.*" %>   
<!-- JSP page directive: imports java.io and java.util packages -->

<%
/* ===== READ LAST MEETING CODE & DATE ===== */  
// Comment header describing purpose of this JSP scriptlet

String meetingCode = "N/A";      
// Variable to store the latest meeting code (default value if file is empty)

String meetingDate = "N/A";      
// Variable to store the meeting date (default value if date not found)

// Create File object pointing to meetingcodes.txt inside data folder
File meetingFile = new File(application.getRealPath("data/meetingcodes.txt"));

// Check whether meetingcodes.txt file exists
if (meetingFile.exists()) {

    // Create BufferedReader to read the file efficiently
    BufferedReader brm = new BufferedReader(new FileReader(meetingFile));

    String line;                 
    // Variable used to store each line read from the file

    // Loop through the file until no more lines are available
    while ((line = brm.readLine()) != null) {

        // Check if the line is not empty or blank
        if (!line.trim().isEmpty()) {

            // Split the line using '|' as delimiter
            String parts[] = line.split("\\|");

            // Assign first part as meeting code
            meetingCode = parts[0].trim();

            // If second value exists, assign it as meeting date
            if (parts.length > 1)
                meetingDate = parts[1].trim();
        }
    }

    // Close BufferedReader to release file and system resources
    brm.close();
}
%>

<html>
<head>
<title>Attendance Sheet</title>

<style>
/* ======= PAGE BACKGROUND & FONT ======= */
body {
            height: 100vh;
            margin: 0;

            background:
                linear-gradient(rgba(250, 248, 248, 0.913), rgba(229, 225, 225, 0.37)),
                url("images/sheet.jpeg");

            background-size: cover;
            background-position: center;

            display: flex;
            justify-content: center;
            align-items: center;
        }
/* ======= MAIN CONTAINER ======= */
.container{
    width:80%;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

/* ======= PAGE HEADING ======= */
h1{
    text-align:center;
    color:#0d47a1;
    margin-bottom:20px;
}

/* ======= MEETING INFO ======= */
.meeting-info{
    background:#eef2ff;
    padding:15px;
    border-left:6px solid #4f46e5;
    border-radius:8px;
    margin-bottom:20px;
}

/* ======= ATTENDANCE DISPLAY BOX ======= */
.attendance-box{
    background:#f4f8ff;
    padding:20px;
    border-radius:8px;
    color:#333;
    overflow-x:auto;
    border-left:6px solid #1976d2;
}

/* ======= TABLE ======= */
.attendance-table{
    width:100%;
    border-collapse:collapse;
}

.attendance-table th{
    background:#1976d2;
    color:white;
    padding:10px;
}

.attendance-table td{
    padding:8px;
    text-align:center;
    border-bottom:1px solid #ccc;
}

/* ======= NO DATA ======= */
.no-data{
    color:red;
    font-weight:bold;
    text-align:center;
}

/* ======= PRINT SETTINGS ======= */
@media print {
    button{
        display:none;
    }
    .container{
        box-shadow:none;
        width:100%;
        margin:0;
    }
}
</style>
</head>

<body>

<div class="container">
<h1>Attendance Sheet</h1>

<!-- MEETING DETAILS -->
<div class="meeting-info">
    <strong>Meeting Code:</strong> <%= meetingCode %><br>
    <strong>Meeting Date:</strong> <%= meetingDate %>
</div>

<div class="attendance-box">

<%
File file = new File(application.getRealPath("data/attendance.txt"));

if (file.exists()) {
    BufferedReader br = new BufferedReader(new FileReader(file));
    String line;
%>

<table class="attendance-table" id="attendanceTable">
<tr>
    <th>Name</th>
    <th>Branch</th>
    <th>Year</th>
    <th>Meeting Code</th>
    <th>Status</th>
</tr>

<%
    while ((line = br.readLine()) != null) {
        if (line.trim().isEmpty()) continue;

        String data[] = line.split("\\|");
        String entryMeetingCode = data[3].trim();   //FILTER KEY

        //SHOW ONLY LATEST MEETING ATTENDANCE
        if (entryMeetingCode.equals(meetingCode)) {
%>
<tr>
    <td><%= data[0].trim() %></td>
    <td><%= data[1].trim() %></td>
    <td><%= data[2].trim() %></td>
    <td><%= data[3].trim() %></td>
    <td><%= data[4].trim() %></td>
</tr>
<%
        }
    }
    br.close();
%>
</table>

<%
} else {
%>
    <p class="no-data">No Attendance Found</p>
<%
}
%>

<!-- ===== DOWNLOAD BUTTONS ===== -->

<div style="text-align:center; margin-top:20px;">
    <button onclick="downloadText()"
        style="padding:10px 20px;background:#1976d2;color:white;
               border:none;border-radius:6px;font-size:16px;cursor:pointer;">
        Download Attendance (TXT)
    </button>
</div>

<div style="text-align:center; margin-top:15px;">
    <button onclick="window.print()"
        style="padding:10px 22px;background:#2e7d32;color:white;
               border:none;border-radius:6px;font-size:15px;cursor:pointer;">
        Download Attendance (PDF)
    </button>
</div>

</div>
</div>

<script> 
/* DOWNLOAD AS TEXT FILE */ 
function downloadText(){

    //Get attendance text from the table
    var text = document.getElementById("attendanceTable").innerText;

    //Create downloadable text file
    var blob = new Blob([text], { type: "text/plain" });

    //Create temporary URL for file download
    var url = URL.createObjectURL(blob);

    //Create fake download link
    var a = document.createElement("a");
    a.href = url;
    a.download = "attendance.txt";   //File name

    //Trigger download
    a.click();

    //Release memory
    URL.revokeObjectURL(url);
}
 

/* DOWNLOAD AS PDF USING PRINT */ 
function downloadPDF(){ 
    window.print(); //Browser print → Save as PDF
}
</script>

</body>
</html>
