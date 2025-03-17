<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  width: 250px;
  height: 600px;
  position: fixed;
  z-index: 1;
  top: 70px;
  left: 10px;
  background: #eee;
  overflow-y: scroll;
  padding: 4px 0;
}

.sidenav a {
  padding: 3px 3px 3px 10px;
  text-decoration: none;
  font-size: 13px;
  color: red;
  display: block;
  font-weight: bold;
}

.sidenav a:hover {
  color: #064579;
}

.main {
  margin-left: 140px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

select{
 	border: 1px solid black;
	padding: 5px; 
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 12px;}
  .sidenav a {font-size: 13px;}
}

</style>
<%@include file="config.jsp"%>
<body style="background-image: url(images/background.jpg);height: 100%;background-position: center;background-repeat: no-repeat;background-size: cover;">

<div class="sidenav">
<h4><b><u>CATEGORY</u></b></h4>
<%
	ResultSet rs = con.createStatement().executeQuery("select * from category");
	while(rs.next()){
%>
<a href='view_cat.jsp?cat=<%=rs.getString(1)%>' class='menu2'><%=rs.getString(2)%></a></br>
<%
	}
%>
</div>
</body>