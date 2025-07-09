<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String journeydate = request.getParameter("journeydate");
    if (journeydate != null) {
        session.setAttribute("journeydate", journeydate);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Seats</title>
    <link rel="stylesheet" href="./css/seatstyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<%
    String busId = request.getParameter("busId");
    if (busId == null) {
        busId = (String) session.getAttribute("busId");
    }

    List<String> bookedSeats = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");
        String query = "SELECT seats FROM ticketdata WHERE route = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, busId);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            String[] booked = rs.getString("seats").split(",\\s*");
            bookedSeats.addAll(Arrays.asList(booked));
        }
        conn.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    }

    int totalSeats = 40;
    int availableCount = 0;
    for (int i = 1; i <= totalSeats; i++) {
        String seatNo = "S" + i;
        if (!bookedSeats.contains(seatNo)) {
            availableCount++;
        }
    }

    String error = request.getParameter("error");
    boolean seatError = "noSeatsSelected".equals(error);
%>

<div class="container seats-container">
    <div class="bus-card">
        <div class="card-body">
            <h5>Select Your Seat</h5>

            <% if (seatError) { %>
                <div class="alert alert-danger text-center">
                    ⚠ Please select at least one seat before proceeding.
                </div>
            <% } %>

            <% if (availableCount == 0) { %>
                <div class="alert alert-warning text-center">No seats available for this bus.</div>
            <% } else { %>
                <form id="seatForm" action="addinfo.jsp" method="post" onsubmit="return validateSeatSelection()">
                    <div class="seat-selection <%= seatError ? "border border-danger p-2 rounded" : "" %>">
                        <% for (int i = 1; i <= totalSeats; i++) {
                            String seatNo = "S" + i;
                            boolean isBooked = bookedSeats.contains(seatNo);
                        %>
                            <label>
                                <input type="checkbox" name="seats" value="<%= seatNo %>" <%= isBooked ? "disabled" : "" %>>
                                <span><%= seatNo %></span>
                            </label>
                        <% } %>
                    </div>

                    <input type="hidden" name="busId" value="<%= busId %>">
                    <div class="d-grid col-6 mx-auto">
                    	<button type="submit" class="btn btn-light mt-3">Continue</button>
                    </div>
                </form>
            <% } %>
        </div>
    </div>
</div>

<script>
    function validateSeatSelection() {
        const checkboxes = document.querySelectorAll('input[name="seats"]:checked');
        if (checkboxes.length === 0) {
            alert("Please select at least one seat before proceeding.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
