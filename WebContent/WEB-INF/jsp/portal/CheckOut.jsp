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
							<a href="#order-complete" class="active">
								<span>01</span>
								<spring:message code="label.checkout"/>
							</a>
						</li>
						<li>
							<a class="active" href="#order-complete" data-toggle="tab">
								<span>02</span>
								<spring:message code="label.orderComplete"/>
							</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10">
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
										<div class="bill-details pl-30">
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
													<td class="td-title-1"><spring:message code="label.productReq"/></td>
													<td class="td-title-2">$ ${portal.productUrlMstBO.product_req_price}</td>
												</tr>
												<tr>
													<td class="order-total"><spring:message code="label.orderTotal"/></td>
													<td class="order-total-price">$ ${portal.productUrlMstBO.product_req_price}</td>
												</tr>
											</table>
										</div>
										<div class="payment-details p-30 " align="center">
										<c:choose>
										    <c:when test="${portal.productUrlMstBO.product_req_price==3}">
										       <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="6Q7Q7C5LNF7U6">
												<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>
												<%-- <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="6NGPAZZUA644W">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form> --%>
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
		function saveCustomerDtls(){
			document.saveCustomerDetails.action = "SaveCustomerDetails.htm";
			document.saveCustomerDetails.submit();
		}
	</script>
</body>
</html>