<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ticketId = request.getParameter("ticketId");
    String message = "";
    if (ticketId != null && !ticketId.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");

            // Optional: Check if ticket exists
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM ticketdata WHERE ticket_id = ?");
            checkStmt.setString(1, ticketId);
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                message = "No ticket found with ID: " + ticketId;
            } else {
                // Delete ticket
                PreparedStatement deleteStmt = conn.prepareStatement("DELETE FROM ticketdata WHERE ticket_id = ?");
                deleteStmt.setString(1, ticketId);
                int rowsDeleted = deleteStmt.executeUpdate();

                if (rowsDeleted > 0) {
                    message = "Ticket with ID " + ticketId + " has been successfully cancelled. Refund (if any) will be processed within 5-7 business days.";
                } else {
                    message = "Failed to cancel ticket. Please try again.";
                }
                deleteStmt.close();
            }

            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cancel Ticket</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <h2 class="text-primary mb-4 text-center">Cancel Your Ticket</h2>

            <form action="cancelTicket.jsp" method="get">
                <div class="mb-3">
                    <label class="form-label">Enter Ticket ID</label>
                    <input type="text" class="form-control" name="ticketId" required>
                </div>
                <button type="submit" class="btn btn-danger w-100">Cancel Ticket</button>
            </form>

            <% if (!message.isEmpty()) { %>
                <div class="alert alert-info mt-4">
                    <%= message %>
                </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
