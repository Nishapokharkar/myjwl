<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container-fluid">
	<div class="navbar-header">
      		<a class="navbar-brand" href="user_home.jsp"><%=session.getAttribute("uid")%></a>
    	</div>
    	<ul class="nav navbar-nav">
      		<li class="active"><a href="user_home.jsp">Home</a></li>
      		<li><a href='view_profile.jsp' class='menu'>View Profile</a></li>
      		<li><a href='view_cart.jsp' class='menu'>View Cart</a></li>
      		<li><a href='track_order.jsp' class='menu'>Track Orders</a></li>
		<li><a href='logout.jsp' class='menu'>Logout</a></li>
    	</ul>
</div>
</nav>