<%@include file="config.jsp"%>
<%
	String cid = request.getParameter("cid");

	con.createStatement().executeUpdate("delete from category where cat_id="+cid);
	response.sendRedirect("add_category.jsp");
%>


