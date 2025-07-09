<%@ page import="java.sql.*, javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport for responsiveness -->
    <title>Ticket Data</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
</head>
<body>
<div class="container mt-4">
    <h3 class="mb-4 text-center text-primary">Ticket Booking Details</h3>
    <div class="table-responsive">
        <table id="ticketTable" class="table table-bordered table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Aadhar</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Mobile</th>
                    <th>Route</th>
                    <th>Seats</th>
                    <th>Fare</th>
                    <th>Status</th>
                    <th>Ticket ID</th>
                    <th>Journey Date</th>
                </tr>
            </thead>
            <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM ticketdata");
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("aadhar") %></td>
                    <td><%= rs.getString("fullname") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("mobno") %></td>
                    <td><%= rs.getString("route") %></td>
                    <td><%= rs.getString("seats") %></td>
                    <td>₹<%= rs.getInt("totalfare") %></td>
                    <td><%= rs.getString("paymentstatus") %></td>
                    <td><%= rs.getString("ticket_id") %></td>
                    <td><%= rs.getString("journeydate") %></td>
                </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='10'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#ticketTable').DataTable();
    });
</script>
</body>
</html>
