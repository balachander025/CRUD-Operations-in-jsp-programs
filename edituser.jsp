<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit user</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String name = "";
    String email = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "bala");
        String sql = "SELECT * FROM employee WHERE id=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
 <h1>Edit User</h1>
    <form action="updateuser.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        Name: <input type="text" name="name" value="<%= name %>" required><br>
        Email: <input type="email" name="email" value="<%= email %>" required><br>
        <input type="submit" value="Update User">
    </form>
    <a href="index.jsp">Back to Home</a>
</body>
</html>

