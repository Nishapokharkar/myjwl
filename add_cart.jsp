<title>Add Cart</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.main{
  height: 600px;
  position: fixed;
  z-index: 1;
  top: 70px;
  left: 200px;
  background: #eee;
  overflow-y: scroll;
  padding: 4px 0;
}

td
{
  padding:15px;
  width: 400px;
}

</style>
<body bgcolor='cyan'>

<%@include file="menu1.jsp"%>

<%@include file="body.jsp"%>

<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	String sql = "select * from product where prod_id="+pid;
	rs = con.createStatement().executeQuery(sql);
	rs.next();
%>
<div class="main">
<table>
<form method='post' action='add_cart1.jsp'>
<table align='center'>
<tr>
	<td colspan=2 align='center'><img src='<%="products/"+pid+".jpg"%>' width=350 height=250/></td>
</tr>
<tr>
	<td><b>Product ID:</b></td><td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Name:</b></td><td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Rate:</b></td><td>Rs.<%=rs.getString(3)%>/-</td>
</tr>
<tr>
	<td><b>Discount:</b></td><td><%=rs.getString(4)%>%</td>
</tr>
<tr>
	<td><b>Qty:</b></td>
	<td>
	<select name='qty' required>
	<option value=''>Select One</option>
	<option value=1>1</option>
	<option value=2>2</option>
	<option value=3>3</option>
	<option value=4>4</option>
	</select>
	</td>
</tr>
<tr>
	<td align='center' colspan=2><input type='submit' class="btn btn-warning" value='Add Cart'></td>
</tr>
</table>
<input type='hidden' name='pid' value=<%=rs.getString(1)%>>
</form>
</div>
<%@include file="footer.jsp"%>
</body>
