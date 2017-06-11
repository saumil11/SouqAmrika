<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.action-button > li > a > i{
			line-height: 28px;
		}
	</style>
	<script src="<c:url value="/portal/assets//js/jquery.elevateZoom-3.0.8.min.js"/>"></script>
	
</head>
<body>
<!-- Start page content -->
<div class="row">
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
	</div>
<section id="page-content" class="page-wrapper">

	<!-- SHOP SECTION START -->
	<div class="shop-section mb-80">
		<div class="container">
		
			<div class="row" style="margin-top:85px;">
				<div class="col-md-push-1 col-md-10 col-xs-12">
					<!-- single-product-area start -->
					
					<div class="single-product-area mb-80">
						<div class="row">
							<!-- imgs-zoom-area start -->
							<div class="col-md-5 col-sm-5 col-xs-12">
								<div class="imgs-zoom-area">
									<img id="zoom_03" src="${item.largeImage.URL}" data-zoom-image="${item.largeImage.URL}" alt="">
									<div class="row">
										<div class="col-xs-12">
											<div id="gallery_01" class="carousel-btn slick-arrow-3 mt-30">
											<c:forEach var="image" items="${thumbnailImages}">
												<div class="p-c">
													<a href="#" data-image="${image.largeImage}" data-zoom-image="${image.largeImage}">
														<img class="zoom_03" src="${image.thumbnailImage}" alt="">
													</a>
												</div>
											</c:forEach>	
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- imgs-zoom-area end -->
							<!-- single-product-info start -->
							<div class="col-md-7 col-sm-7 col-xs-12">
								<div class="single-product-info">
									<h3 class="text-black-1">${item.itemAttributes.title}</h3>
									<h6 class="brand-name-2">${item.itemAttributes.manufacturer}</h6>
									<!--  hr -->
									<hr>
									<!-- single-pro-color-rating -->
									<!-- <div class="single-pro-color-rating clearfix">
										<div class="sin-pro-color f-left">
											<p class="color-title f-left">Color</p>
											<div class="widget-color f-left">
												<ul>
													<li class="color-1"><a href="#"></a></li>
													<li class="color-2"><a href="#"></a></li>
													<li class="color-3"><a href="#"></a></li>
													<li class="color-4"><a href="#"></a></li>
												</ul>
											</div>
										</div>
										<div class="pro-rating sin-pro-rating f-right">
											<a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a> <a
												href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a> <a
												href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a> <a
												href="#" tabindex="0"><i class="zmdi zmdi-star-half"></i></a>
											<a href="#" tabindex="0"><i
												class="zmdi zmdi-star-outline"></i></a> <span
												class="text-black-5">( 27 Rating )</span>
										</div>
									</div> -->
									<!-- hr -->
									<!-- <hr> -->
									<!-- plus-minus-pro-action -->
									<div class="plus-minus-pro-action clearfix">
										<div class="sin-plus-minus f-left clearfix">
											<p class="color-title f-left">Qty</p>
											<div class="cart-plus-minus f-left">
												<input type="text" value="01" name="qtybutton"
													class="cart-plus-minus-box">
											</div>
										</div>
									</div>
									<!-- plus-minus-pro-action end -->
									<!-- hr -->
									<hr>
									<!-- single-product-price -->
									<h3 class="pro-price">Price: ${item.itemAttributes.listPrice.formattedPrice}</h3>
									<!--  hr -->
									<hr>
									<form:form method="post" name="orderAProduct" id="orderAProduct" modelAttribute="portal">
										<input type="hidden" name="url" value="${item.detailPageURL}"/>
										<input type="hidden" name="isFromAmazon" value="true"/>
										<input type="hidden" name="price" value="${item.itemAttributes.listPrice.amount}"/>
										<div>
											<a href="javascript:orderProduct();" class="button extra-small button-black" tabindex="-1">
												<span class="text-uppercase">Order now</span>
											</a>
										</div>
									</form:form>
								</div>
							</div>
							<!-- single-product-info end -->
						</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
</section>

<script type="text/javascript">
	function orderProduct(){
		document.orderAProduct.action = "RequestProduct.htm";
		document.orderAProduct.submit();	
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