<!DOCTYPE html>
<html ng-app='ridApp' ng-controller='homeController'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rid Sample</title>
<jsp:include page="jsp/common/lib.jsp"></jsp:include>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Home</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					
					<li class="dropdown" ><a href="#"
						class="dropdown-toggle" data-toggle="dropdown">User<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#user">User</a></li>
							<li><a href="#users">List</a></li>
						</ul></li>
                    <li><a href="#about">About</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="container">
		<div ng-view></div>
	</div>
	<!-- /.container -->
	<div class="container">
		<hr>
		<footer>
			<div class="row">
				<div class="col-lg-9">
					<p>Copyright © 2014, - Riddhima blog
						</p>
				</div>
				<div class="col-lg-3">
					<ul class="list-unstyled list-inline list-social-icons">
						<li class="tooltip-social facebook-link"><a
							href="https://www.facebook.com" data-toggle="tooltip"
							data-placement="top" title="Facebook"><i
								class="fa fa-facebook-square fa-2x"></i></a></li>
						<li class="tooltip-social linkedin-link"><a
							href="#linkedin-company-page" data-toggle="tooltip"
							data-placement="top" title="LinkedIn"><i
								class="fa fa-linkedin-square fa-2x"></i></a></li>
						<li class="tooltip-social twitter-link"><a
							href="https://twitter.com/" data-toggle="tooltip"
							data-placement="top" title="Twitter"><i
								class="fa fa-twitter-square fa-2x"></i></a></li>
						<li class="tooltip-social google-plus-link"><a
							href="https://plus.google.com/"
							data-toggle="tooltip" data-placement="top" title="Google+"><i
								class="fa fa-google-plus-square fa-2x"></i></a></li>

					</ul>
				</div>
			</div>
		</footer>
	</div>
	<script src="js/controller/controllers.js"></script>
	<script src="js/service/services.js"></script>
	<script src="js/application.js"></script>
</body>
</html>