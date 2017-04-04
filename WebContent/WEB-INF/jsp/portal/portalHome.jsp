<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/favicon.ico">

    <title>SouqAmrika - Home</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/portal/assets/css/bootstrap.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/portal/assets/css/ionicons.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/portal/assets/css/style.css"/>" rel="stylesheet">


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value="/portal/assets/js/ie10-viewport-bug-workaround.js"/>"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="<c:url value="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"/>"></script>
      <script src="<c:url value="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"/>"></script>
    <![endif]-->
</head>
<body>

    <div id="h" style="padding-top:90px;">
      <div class="logo">
      	<a href="Home.htm" style="color:white;font-size: 200%;">
      		SOUQAMRIKA
      	</a>
      	<p dir="rtl" lang="ar" style="color:#e0e0e0;font-size:20px;">رَبٍّ زِدْنٍي عِلمًا
      	</p>
      </div>
      <div class="social hidden-xs">
      	<a href="#">About Us</a>
        <a href="#"><i class="ion-social-twitter"></i></a>
        <a href="#"><i class="ion-social-instagram"></i></a>
        <a href="#"><i class="ion-social-facebook"></i></a>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2 centered">
            <h3 class="englishLang">Welcome to SouqAmrika.<br/>Enter product URL & prepare to enjoy our service.</h3>
            <div class="mtb">
            <form:form method="post" action="RequestProduct.htm" class="form-horizontal" name="saveNewUserForm" id="saveNewUserForm" role="form" modelAttribute="portal">
                
                <input type="text" name="url" class="subscribe-input" placeholder="Enter Product URL" required style="float: none;color: gray;">
                
                <div class="form-group row col-sm-12" align="center">
					 	<h3 for="sel1">Select Price Range</h3>
				</div>
                <div class="form-group row col-sm-12" align="center">
				  <div class="col-md-offset-3 col-sm-6">
				  <select class="form-control" name="priceRange" id="priceRange" required>
				    <option value="3">$1 - $25</option>
				    <option value="5">$26 - $50</option>
				    <option value="7">$51 - $75</option>
				    <option value="9">$76 - $100</option>
				    <option value="10">More then $100</option>
				  </select>
				  </div>
				</div>
			    
			    <div class="row col-sm-12 form-group">
					<button class='btn btn-conf btn-green' type="submit">Request Now</button>			    	
			    </div>
			    </form:form>
				</div>			    
              
            </div><!--/mt-->
           <!--  <h6>30 DAY FREE TRIAL - NO CREDIT CARD NEEDED.</h6> -->
          </div>
        </div><!--/row-->
      </div><!--/container-->
    </div><!-- /H -->
	
   <div id="f">
      <div class="container">
        <div class="row centered">
          <h2>You Can Contact Us</h2>
          <h5>HELLO@LANDINGSUMO.COM</h5>

          <p class="mt">
            <a href="#"><i class="ion-social-twitter"></i></a>
            <a href="#"><i class="ion-social-dribbble"></i></a>
            <a href="#"><i class="ion-social-instagram"></i></a>
            <a href="#"><i class="ion-social-facebook"></i></a>
            <a href="#"><i class="ion-social-pinterest"></i></a>
            <a href="#"><i class="ion-social-tumblr"></i></a>
          </p>
          <h6 class="mt">COPYRIGHT 2014 - LANDING SUMO</h6>
        </div><!--/row-->
      </div><!--/container-->
    </div><!--/F-->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="/portal/assets/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/portal/assets/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/portal/assets/js/retina-1.1.0.js"/>"></script>
    <script src="<c:url value="/portal/assets/js/custom.js"/>"></script>
  </body>
</html>