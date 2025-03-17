<%@include file="config.jsp"%>
<%
	String cid = request.getParameter("cid");
	String cdesc = request.getParameter("cdesc");

	con.createStatement().executeUpdate("update category set cat_desc='"+cdesc+"' where cat_id="+cid);

	response.sendRedirect("add_category.jsp");
%>

