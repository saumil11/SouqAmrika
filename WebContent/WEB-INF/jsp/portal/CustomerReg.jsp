<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
							<form:form method="post" name="productSearchForm"
								id="productSearchForm" role="form" modelAttribute="portal" style="padding-bottom: 10px;"> 
								<div class="top-search-box f-right">
									<input type="text" name="keyWord" id="keyWord"
										placeholder="<spring:message code="label.search"/>">
									<button type="button" onclick="searchProduct();">
										<i class="zmdi zmdi-search"></i>
									</button>
								</div>
							</form:form>

							<h1 class="breadcrumbs-title"><spring:message code="label.checkout"/></h1>
							<ul class="breadcrumb-list">
								<li><a href="Home.htm"><spring:message code="label.home"/></a></li>
								<li><spring:message code="label.checkout"/></li>
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
								<spring:message code="label.checkout"/>
							</a>
						</li>
						<li>
							<a href="#order-complete" data-toggle="tab">
								<span>02</span>
								<spring:message code="label.orderComplete"/>
							</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-12">
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- checkout start -->
						<div class="tab-pane active" id="checkout">
							<div class="checkout-content box-shadow p-30">
								<form:form method="post" name="saveCustomerDetails" id="saveCustomerDetails" modelAttribute="portal">
									<div class="row">
										<!-- billing details -->
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="billing-details pr-10">
												<h6 class="widget-title border-left mb-20"><spring:message code="label.billingDtl"/></h6>
												<div class="row">
													<div class="col-sm-6">
														<input type="text" name="customerMstBO.customer_fname" id="fname" placeholder="<spring:message code="label.fName"/>">
													</div>
													<div class="col-sm-6">
														<input type="text" name="customerMstBO.customer_lname" id="lname" placeholder="<spring:message code="label.lName"/>">
													</div>
												</div>
												<input type="text" name="customerMstBO.customer_email" id="email" placeholder="<spring:message code="label.email"/>">
												<input type="text" name="customerMstBO.customer_mobileNo" id="mobileNo" placeholder="<spring:message code="label.phone"/>">
												
												<h6 class="widget-title border-left mb-20"><spring:message code="label.shippingDtl"/></h6>
												
												<input type="text" name="customerMstBO.customer_address" id="address" placeholder="<spring:message code="label.area"/>">
												<input type="text" name="customerMstBO.customer_city" id="city" placeholder="<spring:message code="label.block"/>">
												<input type="text" name="customerMstBO.customer_state" id="state" placeholder="<spring:message code="label.street"/>">
												<input type="text" name="customerMstBO.customer_postalcode" id="postalCode" placeholder="<spring:message code="label.house"/>">
												<%-- <input type="checkbox" id="otherAdd"  /> <span><spring:message code="label.other"/></span> --%>
												<textarea class="height-80" name="customerMstBO.customer_otherAddress" id="otherAddress" placeholder="<spring:message code="label.other"/>"></textarea>
												<input type="hidden" class="form-control" name="productUrlMstBO.product_url" id="productUrl" value="${url}">
  												<input type="hidden" class="form-control" name="productUrlMstBO.product_req_price" id="requestPrice" value="${requestPrice}">
  												<br/>
  												<h6 class="widget-title border-left mb-20 mt-20"><spring:message code="label.orderDtl"/></h6>

												<div class="plus-minus-pro-action clearfix">
													<div class="sin-plus-minus f-left clearfix">
														<p class="color-title f-left"><spring:message code="label.qty"/></p>
														<div class="cart-plus-minus f-left">
															<input type="text" value="01" name="orderMstBO.order_quantity" id="orderQty"
																class="cart-plus-minus-box">
														</div>
													</div>
												</div>
												
												<textarea class="height-80 mt-20" name="orderMstBO.order_dtl" id="orderDtl" placeholder="<spring:message code="label.orderDtl"/>"></textarea>
												<hr>
											</div>
											<a class="button extra-small mb-20" href="javascript:saveCustomerDtls();"><span><spring:message code="label.placeOrder"/> </span> </a>
											<a class="button extra-small button-white mb-20" href="Home.htm"><span><spring:message code="label.cancel"/> </span> </a>
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
	$(document).ready(function() {

		$("#saveCustomerDetails").validate({
			rules : {
				"customerMstBO.customer_email" : {
					required : true,
					email : true
				}
			}

		});
	});
	
		function saveCustomerDtls(){
			var flag = false;
			flag = $("#saveCustomerDetails").valid();
			if(flag){
				document.saveCustomerDetails.action = "SaveCustomerDetails.htm";
				document.saveCustomerDetails.submit();	
			}
		}
		$('input[type="checkbox"]').click(function(){
	        $("#otherAddress").toggle();
	    });
		
		function searchProduct() {
    		var searchKeyWord = $('#keyWord').val();
    		if (null != searchKeyWord && "" != searchKeyWord) {
    			document.productSearchForm.action = "SearchKeyWord.htm";
    			document.productSearchForm.submit();
    		} else {
    			alert("Please input keyword.");
    		}
    	}
		 $("#keyWord").keypress(function(event) {
	            if (event.which == 13) {
	                event.preventDefault();
	                searchProduct();
	            }
	        });
	</script>
</body>
</html>