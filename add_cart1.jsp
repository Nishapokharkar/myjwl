<%@page import="java.util.*"%>
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
  padding: 4px 0;
}
td{
  padding:10px;
}
</style>

<body>
<%@include file="menu1.jsp"%>

<%@include file="body.jsp"%>

<div class="main">

<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	int qty = Integer.parseInt(request.getParameter("qty"));
	Vector rec = new Vector();
	rec.add(pid);
	rec.add(qty);

	Vector prodlist = new Vector();

	if(session.getAttribute("prodlist")!=null)
		prodlist = (Vector)session.getAttribute("prodlist");

	prodlist.add(rec);

	session.setAttribute("prodlist", prodlist);
%>

<div class="alert alert-info">
  <strong>Info!</strong> Product added to cart successfully.
</div>
<table align='center'>
<tr>
	<td><a class='btn btn-warning' href='user_home.jsp'>Continue Shopping</a></td>
	<td><a class='btn btn-warning' href='view_cart.jsp'>View Cart</a></td>
	<td><a class='btn btn-warning' href='checkout.jsp'>Checkout</a></td>
</tr>
</table>

</div>

<%@include file="footer.jsp"%>
</body>




	
