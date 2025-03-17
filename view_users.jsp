<title>Online Bakery</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file="config.jsp"%>

<%
   ResultSet rs = con.createStatement().executeQuery("select * from customer");
%>
<body class="container">
    <br>
    <center><a href="admin_home.jsp" class="btn btn-warning">Home</a></center>
    <br>
    <table class="table table-hover">
    <tr class="danger">
        <th>Sr.No.</th>
        <th>Email ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone</th>
    </tr>
    <%
        int i=1;
        while(rs.next())
        {
    %>
    <tr>
        <th><%=i++%></th>
        <th><%=rs.getString(1)%></th>
        <th><%=rs.getString(3)%></th>
        <th><%=rs.getString(4)%></th>
        <th><%=rs.getString(5)%></th>
    </tr>
    <%
        }
    %>
    </tr>
    </table>
</body>

