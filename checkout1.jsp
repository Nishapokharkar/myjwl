<%@page import="java.util.*"%>
<title>Checkout</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%@include file="menu1.jsp"%>
<%@include file="config.jsp"%>

<div class="container">

<%
	int oid = Integer.parseInt(request.getParameter("oid"));
	String odate = request.getParameter("odate");
	String email = session.getAttribute("email").toString();
	float tot = Float.parseFloat(session.getAttribute("tot").toString());
	String cardno = request.getParameter("cardno");
	String bname = request.getParameter("bname");

	Vector prodlist = (Vector)session.getAttribute("prodlist");

	String sql = "insert into orders values("+oid+",'"+odate+"', "+tot+",'"+email+"','Pending','"+cardno+"','"+bname+"')";
	con.createStatement().executeUpdate(sql);

	for(int i=0; i<prodlist.size(); i++)
	{
		Vector rec = (Vector)prodlist.get(i);
		sql = "insert into order_details values("+oid+", "+rec.get(0)+", "+rec.get(1)+")";
		con.createStatement().executeUpdate(sql);
	}

	session.removeAttribute("prodlist");
	session.removeAttribute("tot");
%>

<h3></h3>
<h4></h4>

<div class="alert alert-info">
	<strong>Info!</strong> Your order is placed successfully.<br>
	<strong>Info!</strong> Order No:<%=oid%>	
</div>

</div>
<%@include file="footer.jsp"%>
</body>	
