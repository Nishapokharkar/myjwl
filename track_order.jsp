<title>Track Order</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
td{
	padding:10px;
}
select{
	padding:10px;
}
</style>
<%@include file="menu1.jsp"%>
<%@include file="config.jsp"%>	
<div style="padding:150px;">

<%
	String email = session.getAttribute("email").toString();

	String sql = "select ord_id from orders where email='"+email+"'";
	ResultSet rs = con.createStatement().executeQuery(sql);
%>
<form method='post' action='track_order1.jsp'>
<table>
<tr>
	<td><b>Order ID:</b></td>
	<td>
	<select name='oid' required>
	<option value=''>Select Order ID</option>
	<%
		while(rs.next())
		{
	%>
	<option value=<%=rs.getInt(1)%>><%=rs.getInt(1)%></option>
	<%
		}
	%>	
	</selecct>	
	</td>
	<td><input type='submit' value='Show' class='btn btn-warning'></td>
</tr>
</table>
</form>
</div>
<%@include file="footer.jsp"%>
</body>	
