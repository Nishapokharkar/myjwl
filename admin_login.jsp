<%@include file="config.jsp"%>
<%
	String uid = request.getParameter("u");
	String pass = request.getParameter("p");
            
	ResultSet rs = con.createStatement().executeQuery("select * from admin where admin_id='"+uid+"' and admin_passwd='"+pass+"'");

    	if(rs.next())
	{
		session.setAttribute("uid", rs.getString(1));
		session.setAttribute("name", rs.getString(3));
		response.sendRedirect("admin_home.jsp");
	}
	else
	{
%>
<title>Admin Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<?php include "header.php"?>
<br><br><br>
<div class="alert alert-danger">
  <strong>Error!</strong> Login failed.<br>
  Click <a href="admin.jsp">here</a> to login again.
</div>
<%@include file="footer.jsp"%>
<%
	}
%>
