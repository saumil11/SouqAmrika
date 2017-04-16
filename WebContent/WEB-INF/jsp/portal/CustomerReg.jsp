<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<!-- BREADCRUMBS SETCTION START -->
	<div class="breadcrumbs-section plr-200 mb-80">
		<div class="breadcrumbs overlay-bg">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="breadcrumbs-inner">
							<h1 class="breadcrumbs-title">Checkout</h1>
							<ul class="breadcrumb-list">
								<li><a href="Home.htm">Home</a></li>
								<li>Checkout</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- BREADCRUMBS SETCTION END -->

	<!-- Start page content -->
	<section id="page-content" class="page-wrapper"> <!-- SHOP SECTION START -->
	<div class="shop-section mb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<ul class="cart-tab">
						<li>
							<a class="active" href="#checkout" data-toggle="tab">
								<span>01</span>
								Checkout
							</a>
						</li>
						<li>
							<a href="#order-complete" data-toggle="tab">
								<span>02</span>
								Order complete
							</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10">
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- checkout start -->
						<div class="tab-pane active" id="checkout">
							<div class="checkout-content box-shadow p-30">
								<form:form method="post" name="saveCustomerDetails" id="saveCustomerDetails" modelAttribute="portal">
									<div class="row">
										<!-- billing details -->
										<div class="col-md-6">
											<div class="billing-details pr-10">
												<h6 class="widget-title border-left mb-20">billing details</h6>
												<div class="row">
													<div class="col-sm-6">
														<input type="text" name="customerMstBO.customer_fname" id="fname" placeholder="First name">
													</div>
													<div class="col-sm-6">
														<input type="text" name="customerMstBO.customer_lname" id="lname" placeholder="Last name">
													</div>
												</div>
												<input type="text" name="customerMstBO.customer_email" id="email" placeholder="Email address">
												<input type="text" name="customerMstBO.customer_mobileNo" id="mobileNo" placeholder="Phone">
												<input type="text" name="customerMstBO.customer_address" id="address" placeholder="Address">
												<input type="text" name="customerMstBO.customer_city" id="city" placeholder="Town/City">
												<input type="text" name="customerMstBO.customer_state" id="state" placeholder="State">
												<input type="text" name="customerMstBO.customer_postalcode" id="postalCode" placeholder="Pincode">
												<input type="hidden" class="form-control" name="productUrlMstBO.product_url" id="productUrl" value="${url}">
  												<input type="hidden" class="form-control" name="productUrlMstBO.product_req_price" id="requestPrice" value="${requestPrice}">
											</div>
											<a class="button extra-small mb-20" href="javascript:saveCustomerDtls();"><span>place order </span> </a>
											<a class="button extra-small button-white mb-20" href="Home.htm"><span>cancel </span> </a>
										</div>
									</div>
								</form:form>
							</div>
						</div>
						<!-- checkout end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- SHOP SECTION END --> 
	</section>
	<!-- End page content -->
	<script type="text/javascript">
		function saveCustomerDtls(){
			document.saveCustomerDetails.action = "SaveCustomerDetails.htm";
			document.saveCustomerDetails.submit();
		}
	</script>
</body>
</html>