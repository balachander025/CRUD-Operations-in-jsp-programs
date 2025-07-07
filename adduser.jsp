<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
Connection conn=null;
PreparedStatement pst=null;
try{
Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","bala");
String sql="INSERT INTO employee(name,email) VALUES(?,?)";
pst=conn.prepareStatement(sql);
pst.setString(1,name);
pst.setString(2,email);
pst.executeUpdate();
out.println("user  added successfully");
}
catch(Exception e){
	e.printStackTrace();
	
}
finally{
	if(pst!=null) try{
		pst.close();
		}
	catch(SQLException e){
		e.printStackTrace();
		
	}
	if(conn!=null) try{
		conn.close();
	}
	catch(SQLException e){
		e.printStackTrace();
		
	}
	
	}
%>
<a href="index.jsp">Back to home</a>
</body>
</html>
