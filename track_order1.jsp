<title>Track Order</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<body>
<%@include file="menu1.jsp"%>
<%@include file="config.jsp"%>
<%
	String oid = request.getParameter("oid");

	ResultSet rs1 = con.createStatement().executeQuery("select ord_id, ord_date, name, address, phone, orders.email, total, card_no, bank_name,processed_yn from orders, customer where orders.email = customer.email and ord_id="+oid);
	rs1.next();

	ResultSet rs2 = con.createStatement().executeQuery("select prod_desc, rate, disc, qty, rate*qty-rate*qty*disc/100 from product,order_details where product.prod_id = order_details.prod_id and ord_id="+oid);
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
	<td><%=rs1.getString(10)%></td>
</tr>
</table>
<table class="table table-bordered">
<tr class="danger">
	<th>Sr.No.</th>
	<th>Product Description:</th>
	<th>Rate</th>
	<th>Discount</th>
	<th>Qty</th>
	<th>Amount</th>
</tr>
<%
	int i=1;
	while(rs2.next()){
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
double tot = rs1.getDouble(7);
double gst = tot * 0.025;
double cst = tot * 0.025;
double final_tot = tot + gst + cst;
%>
<tr>
<td colspan=5 align='right'><b>Total:</b></td>
<td>Rs. <%=tot%>/-</td>
</tr>
<tr>
<td colspan=5 align='right'><b>GST@2.5%:</b></td>
<td>Rs. <%=gst%>/-</td>
</tr>
<tr>
<td colspan=5 align='right'><b>CST@2.5%:</b></td>
<td>Rs. <%=cst%>/-</td>
</tr>
<tr>
<td colspan=5 align='right'><b>Final Total:</b></td>
<td>Rs. <%=final_tot%>/-</td>
</tr>

</table>
</div>

<%@include file="footer.jsp"%>
</body>
