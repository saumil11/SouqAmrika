<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<section id="page-content" class="page-wrapper">

	<!-- SHOP SECTION START -->
	<div class="shop-section mb-80">
		<div class="container">
			<div class="row">
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
										<div class="sin-pro-action f-right">
											<ul class="action-button">
												<li><a href="#" title="Wishlist" tabindex="0"><i
														class="zmdi zmdi-favorite"></i></a></li>
												<li><a href="#" data-toggle="modal"
													data-target="#productModal" title="Quickview" tabindex="0"><i
														class="zmdi zmdi-zoom-in"></i></a></li>
												<li><a href="#" title="Compare" tabindex="0"><i
														class="zmdi zmdi-refresh"></i></a></li>
												<li><a href="#" title="Add to cart" tabindex="0"><i
														class="zmdi zmdi-shopping-cart-plus"></i></a></li>
											</ul>
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
						<!-- single-product-tab -->
						<div class="row">
							<div class="col-md-12">
								<!-- hr -->
								<hr>
								<div class="single-product-tab">
									<ul class="reviews-tab mb-20">
										<li class="active"><a href="#description"
											data-toggle="tab">description</a></li>
										<li><a href="#information" data-toggle="tab">information</a></li>
										<li><a href="#reviews" data-toggle="tab">reviews</a></li>
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="description">
											<p>There are many variations of passages of Lorem Ipsum
												available, but the majo Rity have be suffered alteration in
												some form, by injected humou or randomis Rity have be
												suffered alteration in some form, by injected humou or
												randomis words which donot look even slightly believable. If
												you are going to use a passage Lorem Ipsum.</p>
											<p>rerum blanditiis dolore dignissimos expedita
												consequatur deleniti consectetur non exercitationem. rerum
												blanditiis dolore dignissimos expedita consequatur deleniti
												consectetur non exercitationem.</p>
										</div>
										<div role="tabpanel" class="tab-pane" id="information">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Autem, neque fugit inventore quo dignissimos est iure
												natus quis nam illo officiis, deleniti consectetur non
												,aspernatur.</p>
											<p>rerum blanditiis dolore dignissimos expedita
												consequatur deleniti consectetur non exercitationem.</p>
										</div>
										<div role="tabpanel" class="tab-pane" id="reviews">
											<!-- reviews-tab-desc -->
											<div class="reviews-tab-desc">
												<!-- single comments -->
												<div class="media mt-30">
													<div class="media-left">
														<a href="#"><img class="media-object"
															src="img/author/1.jpg" alt="#"></a>
													</div>
													<div class="media-body">
														<div class="clearfix">
															<div class="name-commenter pull-left">
																<h6 class="media-heading">
																	<a href="#">Gerald Barnes</a>
																</h6>
																<p class="mb-10">27 Jun, 2016 at 2:30pm</p>
															</div>
															<div class="pull-right">
																<ul class="reply-delate">
																	<li><a href="#">Reply</a></li>
																	<li>/</li>
																	<li><a href="#">Delate</a></li>
																</ul>
															</div>
														</div>
														<p class="mb-0">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Integer accumsan egestas .</p>
													</div>
												</div>
												<!-- single comments -->
												<div class="media mt-30">
													<div class="media-left">
														<a href="#"><img class="media-object"
															src="img/author/2.jpg" alt="#"></a>
													</div>
													<div class="media-body">
														<div class="clearfix">
															<div class="name-commenter pull-left">
																<h6 class="media-heading">
																	<a href="#">Gerald Barnes</a>
																</h6>
																<p class="mb-10">27 Jun, 2016 at 2:30pm</p>
															</div>
															<div class="pull-right">
																<ul class="reply-delate">
																	<li><a href="#">Reply</a></li>
																	<li>/</li>
																	<li><a href="#">Delate</a></li>
																</ul>
															</div>
														</div>
														<p class="mb-0">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Integer accumsan egestas .</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--  hr -->
								<hr>
							</div>
						</div>
					</div>
					<!-- single-product-area end -->
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
</script>
</body>
</html>
