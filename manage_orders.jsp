<title>Manage Orders</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<body>
<center><a href="admin_home.jsp" class="btn btn-warning">Home</a></center>
<%@include file="config.jsp"%>
<%
	ResultSet rs1 = con.createStatement().executeQuery("select ord_id, ord_date, name, address, phone, orders.email, total, card_no, bank_name,processed_yn from orders, customer where orders.email = customer.email order by ord_id");

	while(rs1.next())
	{
%>
<div style="padding:100px;">
<table class="table table-bordered">
<tr>
	<td><b>Order ID:</b></td>
	<td><%=rs1.getString(1)%></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><%=rs1.getString(2)%></td>
</tr>
<tr>
	<td><b>Name:</b></td>
	<td><%=rs1.getString(3)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs1.getString(4)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs1.getString(5)%></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><%=rs1.getString(6)%></td>
</tr>
<tr>
	<td><b>Total Amount:</b></td>
	<td>Rs.<%=rs1.getString(7)%>/-</td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><%=rs1.getString(8)%></td>
</tr>
<tr>
	<td><b>Bank:</b></td>
	<td><%=rs1.getString(9)%></td>
</tr>
<tr>
	<td><b>Status:</b></td>
	<td><%=rs1.getString(10)%> <a href="dispatch.jsp?oid=<%=rs1.getString(1)%>" class="btn btn-danger">Dispatch</a></td>
</tr>	
</table>
<table class="table table-bordered">
<tr class="danger">
	<th>Sr.No.</th>
	<th>Product Name:</th>
	<th>Rate</th>
	<th>Discount</th>
	<th>Qty</th>
	<th>Amount</th>
</tr>
<%
	int i=1;
	
	ResultSet rs2 = con.createStatement().executeQuery("select prod_desc, rate, disc, qty, rate*qty-rate*qty*disc/100 from product,order_details where product.prod_id = order_details.prod_id and ord_id="+rs1.getInt(1));

	while(rs2.next())
	{
%>
<tr>
	<td><%=i++%></td>
	<td><%=rs2.getString(1)%></td>
	<td><%=rs2.getString(2)%></td>
	<td><%=rs2.getString(3)%></td>
	<td><%=rs2.getString(4)%></td>
	<td><%=rs2.getString(5)%></td>
</tr>
<%
		}
%>
<tr>
	<td colspan=5 align='right'><b>Total:</b></td>
	<td><b>Rs. <%=rs1.getString(7)%>/-</td>
</tr>
</table>
</div>
<%
	}
%>
</body>	
