<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jwldb","postgres","test");
%>
