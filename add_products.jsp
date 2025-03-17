<%@include file="config.jsp"%>
<%    
	ResultSet rs = con.createStatement().executeQuery("SELECT last_value+1 FROM product_prod_id_seq");
	rs.next();
	String pid = rs.getString(1);
%>
<title>Products</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
<br>
<h1 align="center" style='background:DodgerBlue;color:black;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("name")%></h1>
<center><button onclick="location.href='admin_home.jsp'" class='btn btn-danger'>HOME</button></center><br>
<form method='post' action="http://localhost:8080/myjwl/add" enctype="multipart/form-data">
<table class="table table-bordered">
<tr>
	<td>Product ID:</td>
	<td><input type='text' name='prod_id' value="<%=pid%>" readOnly></td>
</tr>
<tr>
	<td>Product Name:</td>
	<td><input type='text' name='prod_name' required></td>
</tr>
<tr>
	<td>Rate:</td>
	<td><input type='text' name='rate' required></td>
</tr>
<tr>
	<td>Discount(%):</td>
	<td><input type='text' name='disc' required></td>
</tr>
<tr>
	<td>Category:</td>
	<td>
	<select name="cid" required>
	<option value="">Select Category</option>
<%
	rs = con.createStatement().executeQuery("select * from category");
	while(rs.next()){
%>
	<option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>
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
	<td><input type='submit' value='Add' class='btn btn-danger'></td>
	<td><input type='reset' value='Clear' class='btn btn-danger'></td>
</tr>
</table>
</form>
<br>
<%
	rs = con.createStatement().executeQuery("select prod_id,prod_desc,rate,disc,cat_desc from product,category where product.cat_id = category.cat_id order by prod_id");
%>
<table class="table table-bordered">
<tr class="danger">
	<th>Product ID</th>
	<th>Description</th>
	<th>Rate</th>
	<th>Discount(%)</th>
	<th>Category</th>
	<th>Image</th>
	<th>Delete</th>
	<th>Update</th>
</tr>
<%
	while(rs.next())
    	{
%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
            	<td><img src="products/<%=rs.getInt(1)%>.jpg" width="100px" height="100px"/></td>
		<td><a href="del_product.jsp?prod_id=<%=rs.getInt(1)%>" class="btn btn-danger">Delete</a></td>
		<td><a href="update_product.jsp?prod_id=<%=rs.getInt(1)%>" class="btn btn-danger">Update</a></td>
		</tr>
<%
	}
%>
</table>

