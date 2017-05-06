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
									<div class="thank-you p-30 text-center">
                                            <h6 class="text-black-5 mb-0"><spring:message code="label.paymentSucc"/></h6>
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