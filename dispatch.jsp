<%@include file="config.jsp"%>
<%
	String oid = request.getParameter("oid");
	
	con.createStatement().executeUpdate("update orders set processed_yn='Dispatched' where ord_id="+oid);

	response.sendRedirect("manage_orders.jsp");
%>