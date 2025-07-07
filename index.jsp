<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Crud Operation</h1>
<h2>Add user</h2>
<form action="adduser.jsp">
Name:<input type="text" name="name"required><br>
Email:<input type="email" name="email"required><br>
<input type="submit" value="add user">
</form>
<h2>User List</h2>
<jsp:include page="listuser.jsp"></jsp:include>



</body>
</html>
