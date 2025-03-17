<%@page import="java.util.*"%>
<title>View Cart</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%@include file="menu1.jsp"%>
<%@include file="config.jsp"%>

<%
	Vector prodlist = (Vector)session.getAttribute("prodlist");
	if(prodlist!=null)
	{
%>
<div class="container">
<br><br><br><br>
<table class="table table-hover" >
<tr class="danger">
	<th>Sr.No.</th>
	<th>Product Name</th>
	<th>Rate</th>
	<th>Discount (%)</th>
	<th>Qty</th>
	<th>Amount</th>
</tr>
<%
	float tot = 0;
	for(int i=0; i<prodlist.size(); i++)
	{
		Vector rec = (Vector)prodlist.get(i);
		String sql = "select prod_desc,rate,disc from product where prod_id="+rec.get(0);
		ResultSet rs = con.createStatement().executeQuery(sql);
		rs.next();
		float amt = Integer.parseInt(rec.get(1).toString())*rs.getFloat(2);
		amt -= amt*rs.getFloat(3)/100;
		tot += amt;
%>
<tr>
	<td><%=i+1%></td>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rec.get(1)%></td>
	<td><%=amt%></td>
</tr>
<%
	}
	float gst = tot * 0.025f;
	float cst = tot * 0.025f;
	float final1 = tot + gst + cst;
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
	<td>Rs. <%=final1%>/-</td>
</tr>
</table><br>
<%
	session.setAttribute("tot", tot);
%>
<table align='center'>
<tr>
	<td style="padding:10px;"><a class='btn btn-warning' href='user_home.jsp'>Continue Shopping</a></td>
	<td style="padding:10px;"><a class='btn btn-warning' href='checkout.jsp'>Checkout</a></td>
</tr>
</table>
</div>
<%
	}
	else
	{
%>
<br><br><br>
<div class="alert alert-info">
  <strong>Info!</strong> Cart empty.
</div>

<%
	}
%>

<%@include file="footer.jsp"%>
