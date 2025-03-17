<%@include file="config.jsp"%>
<%
	String pid = request.getParameter("prod_id");

	con.createStatement().executeUpdate("delete from product where prod_id="+pid);

	String appPath = request.getServletContext().getRealPath("/");

	java.io.File f = new java.io.File(appPath+"products/"+pid+".jpg");
	f.delete();

	response.sendRedirect("add_products.jsp");
%>
