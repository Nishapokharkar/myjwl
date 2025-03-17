<title>Edit Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
<%@include file="menu1.jsp"%>
<%@include file="config.jsp"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	String sql = "update customer set passwd='"+pwd+"',name='"+name+"',address='"+addr+"',phone='"+phone+"' where email='"+email+"'";
	con.createStatement().executeUpdate(sql);
%>
<br><br><br>
<div class="alert alert-info">
  <strong>Info!</strong> Profile updated successfully.
</div>

<%@include file="footer.jsp"%>
</body>
