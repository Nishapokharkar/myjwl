<!DOCTYPE html>
<html lang="en">
<head>
	<title>Online Jewellery</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<%@include file="header.jsp"%>

<div class="container">

<form method='post' action='login1.jsp'>
<div>
	<h1 class="alert alert-danger text-center display-1">Login</h1>

	<div class="form-group w-75">
		<input type="text" class="form-control input-lg" name="email" placeholder="Email" required>
	</div>

	<div class="form-group w-75">
		<input type="password" class="form-control  input-lg" name="pass" placeholder="Password" required>
	</div>

	<div class="form-group w-50">
		<input type="submit" value="OK" class="btn btn-primary btn-lg">
		<input type="reset" value="Clear" class="btn btn-primary btn-lg">
	</div>

	<a href='sign_up.jsp'>New User</a></td>
</div>
</form>

<%@include file="footer.jsp"%>
