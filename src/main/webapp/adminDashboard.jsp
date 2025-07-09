<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            position: fixed;
            width: 250px;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            display: block;
            padding: 12px 20px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        iframe {
            border: none;
            width: 100%;
            height: 80vh;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h4 class="text-white text-center">Admin Panel</h4>
        <a href="ticketdata.jsp" target="contentFrame">View Ticket Data</a>
        <a href="customerinfo.jsp" target="contentFrame">View Customer Info</a>
        <a href="enquirydata.jsp" target="contentFrame">View Enquiry Info</a>
        <form action="logout.jsp" method="post" class="text-center mt-4">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>

    <div class="content">
        <h3>Welcome to Admin Dashboard</h3>
        <iframe name="contentFrame" title="Content Display Area"></iframe>
    </div>
</body>
</html>
