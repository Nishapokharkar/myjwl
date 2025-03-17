<title>Update Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
<%@include file="config.jsp"%>
<%
	String pid = request.getParameter("prod_id");
	
	ResultSet rs = con.createStatement().executeQuery("select * from product where prod_id="+pid);
	rs.next();
%>

<center><button onclick="location.href='admin_home.jsp'" class='btn btn-danger'>HOME</button></center><br>
<form method='post' action="http://localhost:8080/myjwl/update" enctype="multipart/form-data">
<table class="table table-bordered">
<tr>
	<td>Product ID:</td>
	<td><input type='text' name='prod_id' value="<%=rs.getString(1)%>" readOnly></td>
</tr>
<tr>
	<td>Product Name:</td>
	<td><input type='text' name='prod_name' value="<%=rs.getString(2)%>" required></td>
</tr>
<tr>
	<td>Rate:</td>
	<td><input type='text' name='rate' value="<%=rs.getString(3)%>" required></td>
</tr>
<tr>
	<td>Disc:</td>
	<td><input type='text' name='disc' value="<%=rs.getString(4)%>" required></td>
</tr>
<tr>
	<td>Category:</td>
	<td>
	<select name="cid" required>
	<option value="">Select Category</option>
<%
	ResultSet rs1 = con.createStatement().executeQuery("select * from category");
	while(rs1.next()){
%>
	<option value=<%=rs1.getInt(1)%> <% if(rs1.getInt(1)==rs.getInt(5)) out.print(" selected");%>><%=rs.getString(2)%></option>
<%
	}
%>
	</select>
	</td>
</tr>
<tr>
	<td>Image URL:</td>
	<td><input type='file' name='imgurl'></td>
</tr>
<tr>
	<td><input type='submit' value='Update' class='btn btn-danger'></td>
	<td><input type='reset' value='Clear' class='btn btn-danger'></td>
</tr>
</table>
</form>
</body>

