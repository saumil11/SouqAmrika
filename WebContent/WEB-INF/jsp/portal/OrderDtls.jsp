<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="<c:url value="/portal/assets/css/reset.css"/>"> <!-- CSS reset -->
	<link rel="stylesheet" href="<c:url value="/portal/assets/css/style.css"/>"> <!-- Resource style -->
</head>
<body>
	

	<!-- Start page content -->
	<section id="page-content" class="page-wrapper"> <!-- SHOP SECTION START --> 
		<section style="padding:0;line-height: 1;"> 
			<nav>
				<ol class="cd-breadcrumb triangle custom-icons">
					<li class="${portal.orderMstBO.order_status == '1' ? 'current' : ''}"><em>Order Placed</em></li>
					<li class="${portal.orderMstBO.order_status == '2' ? 'current' : ''}"><em>Order Verified</em></li>
					<li class="${portal.orderMstBO.order_status == '3' ? 'current' : ''}"><em>Payment Done</em></li>
					<li class="${portal.orderMstBO.order_status == '4' ? 'current' : ''}"><em>Shipped</em></li>
				</ol>
			</nav> 
		</section>
	
	
	<div class="shop-section mb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- order-complete start -->
						<div class="tab-pane active" id="order-complete">
							<div class="order-complete-content box-shadow">
								<div class="row">
									<div class="col-md-6">
										<div class="bill-details p-30">
											<h6 class="widget-title border-left mb-20"><spring:message code="label.billingDtl"/></h6>
											<ul class="bill-address">
												<li><span><spring:message code="label.name"/> : </span>${portal.customerMstBO.customer_fname} ${portal.customerMstBO.customer_lname}</li>
												<li><span><spring:message code="label.email"/> : </span> ${portal.customerMstBO.customer_email} </li>
												<li><span><spring:message code="label.phone"/> : </span> ${portal.customerMstBO.customer_mobileNo} </li>
											</ul>
										</div>
										<div class="bill-details p-30">
											<h6 class="widget-title border-left mb-20">shipping details</h6>
											<ul class="bill-address">
											<c:if test="${not empty portal.customerMstBO.customer_address}">
											    <li><span><spring:message code="label.area"/> : </span> ${portal.customerMstBO.customer_address}</li>
											</c:if>
											<c:if test="${not empty portal.customerMstBO.customer_city}">
											    <li><span><spring:message code="label.block"/> : </span> ${portal.customerMstBO.customer_city}</li>
											</c:if>
											<c:if test="${not empty portal.customerMstBO.customer_state}">
											    <li><span><spring:message code="label.street"/> : </span> ${portal.customerMstBO.customer_state}</li>
											</c:if>
											<c:if test="${not empty portal.customerMstBO.customer_postalcode}">
											    <li><span><spring:message code="label.house"/> : </span> ${portal.customerMstBO.customer_postalcode}</li>
											</c:if>
											<c:if test="${not empty portal.customerMstBO.customer_otherAddress}">
											    <li><span><spring:message code="label.other"/> : </span> ${portal.customerMstBO.customer_otherAddress}</li>
											</c:if>
											</ul>
										</div>
									</div>
									<!-- our order -->
									<div class="col-md-6">
										<div class="payment-details p-30">
											<h6 class="widget-title border-left mb-20"><spring:message code="label.yourOrder"/></h6>
											<table>
												<tr>
													<td class="td-title-1">Product Details</td>
													<td class="td-title-2">
														<a class="mb-20" target='_blank' href="${portal.productUrlMstBO.product_url}">
															<span>Click here</span> 
														</a>
													</td>
												</tr>
												<tr>
													<td class="td-title-1"><spring:message code="label.productReq"/></td>
													<td class="td-title-2">$ ${portal.productUrlMstBO.product_req_price}</td>
												</tr>
												<tr>
													<td class="order-total"><spring:message code="label.orderTotal"/></td>
													<td class="order-total-price">$ ${portal.productUrlMstBO.product_req_price}</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- order-complete end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- SHOP SECTION END --> 
	</section>
	<!-- End page content -->
	<script type="text/javascript">
		
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