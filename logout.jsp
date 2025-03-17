<%
	session.removeAttribute("prodlist");
	session.removeAttribute("tot");
	session.removeAttribute("email");
	session.removeAttribute("uid");
	response.sendRedirect("index.jsp");
%>
