<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%@include file="config.jsp"%>
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");

	String sql = "select * from customer where email='"+email+"' and passwd='"+pass+"'";
	ResultSet rs = con.createStatement().executeQuery(sql);

	if(rs.next())
	{
		session.setAttribute("email", rs.getString(1));
		session.setAttribute("uid", rs.getString(3));
		response.sendRedirect("user_home.jsp");
	}
	else
	{
%>
		<%@include file="header.jsp"%>
<div class="container">
<div class="alert alert-warning">
  <strong>Warning!</strong> Login Failed!!!.
</div>
Click <a href='login.jsp'>here</a> to login again.
</div>
		<%@include file="footer.jsp"%>

<%
	}
%>
