<%@include file="config.jsp"%>
<title>Update Category</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
<%
	String cid = request.getParameter("cid");
	
	ResultSet rs = con.createStatement().executeQuery("select * from category where cat_id="+cid);

	rs.next();
%>

<center><button onclick="location.href='admin_home.jsp'" class='btn btn-danger'>HOME</button></center><br>
<form method='post' action="update_category1.jsp">
<table class="table table-bordered">
<tr>
	<td>Category ID:</td>
	<td><input type='text' name='cid' value="<%=rs.getString(1)%>" readOnly></td>
</tr>
<tr>
	<td>Category Description:</td>
	<td><input type='text' name='cdesc' value="<%=rs.getString(2)%>" required></td>
</tr>
<tr>
	<td><input type='submit' value='Update' class='btn btn-danger'></td>
	<td><input type='reset' value='Clear' class='btn btn-danger'></td>
</tr>
</table>
</form>
</body>

