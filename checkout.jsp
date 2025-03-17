<%@page import="java.util.*"%>
<title>Checkout</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
td{
	padding:10px;
}
</style>

<%@include file="menu1.jsp"%>
<%@include file="config.jsp"%>

<%
	Vector prodlist = (Vector)session.getAttribute("prodlist");
	float tot = Float.parseFloat(session.getAttribute("tot").toString());
	String email = session.getAttribute("email").toString();

	String sql = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'jwldb' AND TABLE_NAME = 'orders'";
	ResultSet rs = con.createStatement().executeQuery(sql);
	rs.next();
	int oid = rs.getInt(1);

	rs = con.createStatement().executeQuery("select current_date");
	rs.next();
	String odate = rs.getString(1);
%>

<div style="padding:150px;">

<form method='post' action='checkout1.jsp'>
<table>
<tr>
	<td><b>Order ID:</b></td>
	<td><input type='text' name='oid' value=<%=oid%> readOnly></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><input type='text' name='odate' value='<%=odate%>' readOnly></td>
</tr>
<tr>
	<td><b>User ID:</b></td>
	<td><input type='text' name='email' value='<%=email%>' readOnly></td>
</tr>
<tr>
	<td><b>Total Amount:</b></td>
	<td><input type='text' name='tot' value=<%=tot%> readOnly></td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><input type='text' name='cardno' pattern="\d{4}-\d{4}-\d{4}-\d{4}" required></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><input type='text' name='bname' required></td>
</tr>
<tr>
	<td><input type='submit' class="btn btn-warning" value='Place Order'></td>
	<td><input type='reset' class="btn btn-warning" value='Clear'></td>
</tr>
</table>
</form>
</div>

</footer>
	<%@include file="footer.jsp"%>
</footer>
</body>	
