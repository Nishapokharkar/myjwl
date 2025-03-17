<title>View Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
<%@include file="config.jsp"%>

<%@include file="menu1.jsp"%>

<%
	String email = session.getAttribute("email").toString();

	ResultSet rs = con.createStatement().executeQuery("select * from customer where email='"+email+"'");
	rs.next();
%>

<div class="container">
<br><br>
<form method="post" action="edit_profile.jsp">
<div>
	<h1 class="alert alert-danger text-center display-1">View Profile</h1>

	<div class="form-group w-75">
		<label>Email ID</label>
		<input type="email" class="form-control input-lg" name="email" placeholder="Email" value="<%=rs.getString(1)%>" readOnly>
	</div>
	
	<div class="form-group w-75">
		<label>Password</label>
		<input type="password" class="form-control  input-lg" name="pass" placeholder="Password" value="<%=rs.getString(2)%>" required>
	</div>

	<div class="form-group w-50">
		<label>Name</label>
		<input type="text" class="form-control  input-lg" name="name" placeholder="Full Name" value="<%=rs.getString(3)%>" required>
	</div>

	<div class="form-group w-50">
		<label>Address</label>
		<input type="text" class="form-control  input-lg" name="addr" placeholder="Address" value="<%=rs.getString(4)%>" required>
	</div>
 
	<div class="form-group w-50">
		<label>Phone</label>
		<input type="tel" class="form-control  input-lg" name="phone" placeholder="Phone" value="<%=rs.getString(5)%>" pattern="[789][0-9]{9}" required>
	</div>

	<div class="form-group w-50">
		<input type="submit" value="Update" class="btn btn-primary btn-lg">
		<input type="reset" value="Clear" class="btn btn-primary btn-lg">
	</div>
</div>
</form>
</div>
<%@include file="footer.jsp"%>
</body>
