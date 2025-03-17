<title>Admin Home</title>
<!DOCTYPE html>
<html>

<head>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<style>
	td{
		padding: 15px;
	}
</style>
<body style="background-color: linen;">
<center>
<br><br><br><br><br><br><br><br>
<h3>Welcome Admin: <%=session.getAttribute("name")%></h3>
<table>
<tr>
	<td><a href="admin_home.jsp" class="active"><i class="fas fa-home icon"></i> Home</a></td>
</tr>
<tr>
	<td><a href="view_users.jsp"><i class="fas fa-rss icon"></i> Users</a></td>
</tr>
<tr>
	<td><a href="manage_orders.jsp"><i class="fas fa-rss icon"></i> Jewellery Orders</a></td>
</tr>
<tr>
	<td><a href="add_category.jsp"><i class="fas fa-address-book icon"></i> Category</a></td>
</tr>
<tr>
	<td><a href="add_products.jsp"><i class="fas fa-address-book icon"></i> Products</a></td>
</tr>
<tr>
	<td><a href="index.jsp"><i class="fas fa-user icon"></i> Logout</a></td>
</tr>
</table>
</center>
</body>
</html>
