<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/favicon.ico">

    <title>SouqAmrika - Customer Details</title>

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
      <div class="logo">
      	<a href="Home.htm">
      		SOUQAMRIKA
      	</a>
      </div>
      <div class="social hidden-xs">
        <a href="#" style="color: #080808;"><i class="ion-social-twitter"></i></a>
        <a href="#" style="color: #080808;"><i class="ion-social-instagram"></i></a>
        <a href="#" style="color: #080808;"><i class="ion-social-facebook"></i></a>
      </div>
      <div class="container">
        <div class="row">
          <h2 class="mb">Provide your personal info and <br/>Delivery Address.</h2>
  <form:form method="post" action="SaveCustomerDetails.htm" class="form-horizontal" name="saveCustomerDetails" id="saveCustomerDetails" role="form" modelAttribute="portal">
  <h3 class="pull-left">Personal Info</h3><br>
  <hr class="col-xs-12" />
  <div class="row col-sm-12">
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="email">First Name:</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="customerMstBO.customer_fname" id="fname" placeholder="Enter first name" required>
      </div>
    </div>
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="pwd">Last Name:</label>
      <div class="col-sm-9">          
        <input type="text" class="form-control" name="customerMstBO.customer_lname" id="lname" placeholder="Enter last name" required>
      </div>
    </div>
	</div>
	
	<div class="row col-sm-12">
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="email">Email:</label>
      <div class="col-sm-9">
        <input type="email" class="form-control" name="customerMstBO.customer_email" id="email" placeholder="Enter email" required>
      </div>
    </div>
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="pwd">Mobile No:</label>
      <div class="col-sm-9">          
        <input type="text" class="form-control" name="customerMstBO.customer_mobileNo" id="mobileNo" placeholder="Enter mobile no" required>
      </div>
    </div>
	</div>
	
	<h3 class="pull-left">Address Info</h3><br>
	<hr class="col-xs-12" />
	<div class="row col-sm-12">
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="email">Street / Address:</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="customerMstBO.customer_address" id="address" placeholder="Enter street / address" required>
      </div>
    </div>
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="email">City:</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="customerMstBO.customer_city" id="city" placeholder="Enter city" required>
      </div>
    </div>
    </div>
	<div class="row col-sm-12">
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="email">State</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="customerMstBO.customer_state" id="state" placeholder="Enter state" required>
      </div>
    </div>
    <div class="form-group col-sm-6">
      <label class="control-label col-sm-3" for="email">Pincode</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="customerMstBO.customer_postalcode" id="postalCode" placeholder="Enter pincode" required>
      </div>
    </div>
    </div>
    
     <div class="row col-sm-12">
  		<h4 class="pull-left">Your product URL : <a href="${url}" class="pull-right">${url}</a></h4> 
  	</div>
  	<input type="hidden" class="form-control" name="productUrlMstBO.product_url" id="productUrl" value="${url}">
  	<input type="hidden" class="form-control" name="productUrlMstBO.product_req_price" id="requestPrice" value="${requestPrice}">
	
	<div class="form-group col-sm-12">
		<br>
		<a href="Home.htm" class="btn btn-default">Cancel</a> &nbsp;&nbsp;&nbsp;
		<button type="submit" class="btn btn-green">Submit</button>
    </div>
    </form:form>
	</div>
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
  </body>
</html>