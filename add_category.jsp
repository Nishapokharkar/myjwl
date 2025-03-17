<%@include file="config.jsp"%>
<%
	String cid = request.getParameter("cid");
	String cdesc = request.getParameter("cdesc");

    	if(cid!=null && cdesc!=null)
	{
		con.createStatement().executeUpdate("insert into category(cat_desc) values('"+cdesc+"')");       
	}    

	ResultSet rs = con.createStatement().executeQuery("SELECT last_value+1 FROM category_cat_id_seq");
	rs.next();
	cid = rs.getString(1);
%>
<title>Category</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
<br>
<h1 align="center" style='background:DodgerBlue;color:black;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("name")%></h1>
<center><button onclick="location.href='admin_home.jsp'" class='btn btn-danger'>HOME</button></center><br>
<form method='post' action="add_category.jsp">
<table class="table table-bordered">
<tr>
	<td>Category ID:</td>
	<td><input type='text' name='cid' value="<%=cid%>" readOnly></td>
</tr>
<tr>
	<td>Category Description:</td>
	<td><input type='text' name='cdesc' required></td>
</tr>
<tr>
	<td><input type='submit' value='Add' class='btn btn-danger'></td>
	<td><input type='reset' value='Clear' class='btn btn-danger'></td>
</tr>
</table>
</form>
<br>
<%
	rs = con.createStatement().executeQuery("select * from category order by cat_id");
%>
<table class="table table-bordered">
<tr class="danger">
	<th>Category ID</th>
	<th>Description</th>
    	<th></th>
    	<th></th>
</tr>
<%
	while(rs.next())
    	{
%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><a href="del_category.jsp?cid=<%=rs.getInt(1)%>" class="btn btn-danger">Delete</a></td>
		<td><a href="update_category.jsp?cid=<%=rs.getInt(1)%>" class="btn btn-danger">Update</a></td>
		</tr>
<%
	}
%>
</table>

