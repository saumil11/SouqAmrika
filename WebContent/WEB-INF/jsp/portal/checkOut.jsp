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
			<h2 class="mb">Review your details and Buy now.</h2>
				<div class="col-sm-4">
					<h3 class="col-sm-12" align="left">Personal Info</h3><br>
					<label class="col-sm-12" align="left">Name : ${portal.customerMstBO.customer_fname} ${portal.customerMstBO.customer_lname}</label>
					<label class="col-sm-12" align="left">Email : ${portal.customerMstBO.customer_email}</label>
					<label class="col-sm-12" align="left">Mobile No : ${portal.customerMstBO.customer_mobileNo}</label>
				</div>
				<div class="col-sm-4">
					<h3 class="col-sm-12" align="left">Shipping Info</h3><br>
					<label class="col-sm-12" align="left">Street / Arrdess : ${portal.customerMstBO.customer_address}</label>
					<label class="col-sm-12" align="left">City : ${portal.customerMstBO.customer_city}</label>
					<label class="col-sm-12" align="left">State : ${portal.customerMstBO.customer_state}</label>
					<label class="col-sm-12" align="left">Pincode : ${portal.customerMstBO.customer_postalcode}</label>
				</div>
				<div class="col-sm-4">
				<form target="_top" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="7ESA5CBXZLE8N">
<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
					<c:choose>
					    <c:when test="${portal.productUrlMstBO.product_req_price==3}">
					       <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="6Q7Q7C5LNF7U6">
							<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
							<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
					    </c:when>
					    <c:when test="${portal.productUrlMstBO.product_req_price==5}">
					        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="QSEZ9UFREV9YQ">
							<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
							<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
					    </c:when>
					    <c:when test="${portal.productUrlMstBO.product_req_price==7}">
					        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="9GB3DL3HKNEZJ">
							<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
							<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
					    </c:when>
					    <c:when test="${portal.productUrlMstBO.product_req_price==9}">
					        <form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="H5G2GBBYL7MH2">
							<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_cart_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
							<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
					    </c:when>
					    <c:when test="${portal.productUrlMstBO.product_req_price==10}">
					        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="4AUEGEDWVDCUS">
							<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
							<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
							</form>
					    </c:when>
					    <c:otherwise>
					        Something went wrong.
					    </c:otherwise>
					</c:choose>
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