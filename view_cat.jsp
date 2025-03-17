<title>Category</title>
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
  background: #eee;
  overflow-y: scroll;
  padding: 4px 0;
}

.prod
{
  padding:15px;
  width: 400px;
}

#pname
{
  color:red;
  font-size:10pt;
  font-weight:bold;
}

#prate
{
  font-size:8pt;
}
</style>

<body>
<%@include file="menu1.jsp"%>

<%@include file="body.jsp"%>

<div class="main">
<table>
<tr>
<%
	int cat = Integer.parseInt(request.getParameter("cat"));

	String sql = "select * from product where cat_id="+cat;
	rs = con.createStatement().executeQuery(sql);
	int i=0;
	while(rs.next())
	{	
%>
		<td class='prod'>
		<img src='<%="products/"+rs.getInt(1)+".jpg"%>' width=100 height=100/><br>
		<p id='pname'><b><%=rs.getString(2)%></b></p>
		<p id='prate'><%="Rs."+rs.getString(3)+"("+rs.getString(4)+"%)"%></p>
		<a class='btn btn-warning' href='add_cart.jsp?pid=<%=rs.getInt(1)%>'>Buy Now</a>
		</td>
<%
		i++;
		if(i%3==0)
		{
			out.print("</tr><tr>");
		}
	}
%>
</table>
</div>

<%@include file="footer.jsp"%>
</body>

