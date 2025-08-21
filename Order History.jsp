<%--
 Created by IntelliJ IDEA.
 User: ashwanth
 Date: 23-11-2024
 Time: 22:54
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Order History</title>
</head>
<body>
<h1>Your Order History</h1>
<ul>
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.io.PrintWriter" %>
 <!DOCTYPE html>
 <html lang="en">
 <head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Order History</title>
 </head>
 <body>
<%-- <h1>Your Order History</h1>--%>
 <ul>
 <%
 String username = (String) session.getAttribute("username");
 if (username != null) {
 try {
 // Connect to the database
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantdb",
"root", "");
 // Fetch order history for the logged-in user
 PreparedStatement ps = conn.prepareStatement(
 "SELECT order_item, order_date FROM user1 WHERE username = ?"
 );
 ps.setString(1, username);
 ResultSet rs = ps.executeQuery();
 // Display the orders
 while (rs.next()) {
 String orderItem = rs.getString("order_item");
 String orderDate = rs.getString("order_date");
 %>
 <p>Item: <%= orderItem %> | Date: <%= orderDate %></p>
 <%
 }
 conn.close();
 } catch (Exception e) {
 e.printStackTrace(); // Log the error for debugging
 // Optionally, send an error response to the client
 response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching
order history.");
 }
 } else {
 response.sendRedirect("index.jsp"); // Redirect to login if the session is invalid
 }
 %>
 </ul>
 </body>
 </html>
</ul>
</body>
</html>