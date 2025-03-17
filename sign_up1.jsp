<!DOCTYPE html>
<html lang="en">
<head>
	<title>Online Bakery</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<%@include file="config.jsp"%>

<div class="container">

<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	String sql = "select * from customer where email='"+email+"'";
	ResultSet rs = con.createStatement().executeQuery(sql);

	if(rs.next())
	{
%>
<div class="alert alert-warning">
  <strong>Warning!</strong> This email is already registered.
</div>
<%
	}
	else
	{
		sql = "insert into customer values('"+email+"','"+pass+"','"+name+"','"+addr+"','"+phone+"')";
		con.createStatement().executeUpdate(sql);
%>
<div class="alert alert-info">
  <strong>Info!</strong> You are registered successfully.
</div>
<%
	}
%>
Click <a href='login.jsp'>here</a> to login.
</div>	
<%@include file="footer.jsp"%>
</body>
</html>

	



