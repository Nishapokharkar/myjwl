<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["pass"];
	y = document.forms["reg"]["cpass"];

	if(x.value!=y.value)
	{
		alert("Password and confirm password doesn't match");
		x.focus();
		return false;
	}

	return true;
}
</script>

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

<form method="post" action="sign_up1.jsp" name="reg" onsubmit="return validate()">
<div>
	<h1 class="alert alert-danger text-center display-1">Sign Up</h1>

	<div class="form-group w-75">
		<input type="email" class="form-control input-lg" name="email" placeholder="Email" required>
	</div>
	
	<div class="form-group w-75">
		<input type="password" class="form-control  input-lg" name="pass" placeholder="Password" required>
	</div>

	<div class="form-group w-75">
		<input type="password" class="form-control  input-lg" name="cpass" placeholder="Confirm Password" required>
	</div>
	
	<div class="form-group w-50">
		<input type="text" class="form-control  input-lg" name="name" placeholder="Full Name" required>
	</div>

	<div class="form-group w-50">
		<input type="text" class="form-control  input-lg" name="addr" placeholder="Address" required>
	</div>

	<div class="form-group w-50">
		<input type="tel" class="form-control  input-lg" name="phone" placeholder="Phone" pattern="[789][0-9]{9}" required>
	</div>

	<div class="form-group w-50">
		<span>Already have an account? <a href="login.jsp">Login here</a></span>
	</div>
	
	<div class="form-group w-50">
		<input type="submit" value="OK" class="btn btn-primary btn-lg">
		<input type="reset" value="Clear" class="btn btn-primary btn-lg">
	</div>
</div>
</form>

</div>
<%@include file="footer.jsp"%>
</body>
</html>


