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
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '3.5'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="YMVANC5PCTTWA">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>

										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '7.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="N5ZZ2QUZM7436">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>

										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '10.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="AEAGP3K5SQBEN">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>

										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '15.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="ZUY388SUKSJTU">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>


										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '20.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="SYJ7J2LU4B8EC">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>


										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '25.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="DX7Z3S9YQJT82">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>


										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '30.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="PU4VTPKQVVAY2">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>


										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '35.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="5L93N47EFL332">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
												</form>


										    </c:when>
										    <c:when test="${portal.productUrlMstBO.product_req_price eq '40.0'}">
										       <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
												<input type="hidden" name="cmd" value="_s-xclick">
												<input type="hidden" name="hosted_button_id" value="K7J3CVZZTT3BS">
												<input type="hidden" name="custom" value="${portal.orderMstBO.order_id}">
												<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
												<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
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