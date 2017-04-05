<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/favicon.ico">

    <title>SouqAmrika - CheckOut</title>

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

    <div id="h" style="padding-top:90px; color: #080808;background: none;">
      <div class="logo">SOUQAMRIKA</div>
      <div class="social hidden-xs">
        <a href="#" style="color: #080808;"><i class="ion-social-twitter"></i></a>
        <a href="#" style="color: #080808;"><i class="ion-social-instagram"></i></a>
        <a href="#" style="color: #080808;"><i class="ion-social-facebook"></i></a>
      </div>
      <div class="container">
        <div class="row col-sm-12">
			<h2 class="mb">Customer Details</h2>
				<div class="col-sm-4">
					<h3 class="col-sm-12" align="left">Personal Info</h3><br>
					<label class="col-sm-12" align="left">Name : ${admin.customerMstBO.customer_fname} ${admin.customerMstBO.customer_lname}</label>
					<label class="col-sm-12" align="left">Email : ${admin.customerMstBO.customer_email}</label>
					<label class="col-sm-12" align="left">Mobile No : ${admin.customerMstBO.customer_mobileNo}</label>
				</div>
				<div class="col-sm-4">
					<h3 class="col-sm-12" align="left">Shipping Info</h3><br>
					<label class="col-sm-12" align="left">Street / Arrdess : ${admin.customerMstBO.customer_address}</label>
					<label class="col-sm-12" align="left">City : ${admin.customerMstBO.customer_city}</label>
					<label class="col-sm-12" align="left">State : ${admin.customerMstBO.customer_state}</label>
					<label class="col-sm-12" align="left">Pincode : ${admin.customerMstBO.customer_postalcode}</label>
				</div>
				
        </div><!--/row-->
      </div><!--/container-->
      
    </div><!-- /H -->
	<br>
	<br>
	
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script src="<c:url value="/portal/assets/js/custom.js"/>"></script>
  </body>
</html>