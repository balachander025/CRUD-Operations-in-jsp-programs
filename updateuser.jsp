<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "bala");
        String sql = "UPDATE employee SET name=?, email=? WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setInt(3, id);
        pst.executeUpdate();
        out.println("User updated successfully.");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<a href="index.jsp">Back to Home</a>


</body>
</html>
