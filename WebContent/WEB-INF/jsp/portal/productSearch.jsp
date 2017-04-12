<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- BREADCRUMBS SETCTION START -->
<div class="breadcrumbs-section plr-200 mb-80">
	<div class="breadcrumbs overlay-bg">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="breadcrumbs-inner">
						<div class="new-customers breadcrumbs-title">
							<form:form method="post" name="productSearchForm" id="productSearchForm" role="form" modelAttribute="portal">
								<div class="p-30">
									<div class="col-sm-offset-2 col-sm-8">
										<input type="text" name="keyWord" id="keyWord" />
										<button class="submit-btn-1 btn-hover-1" type="button"
											onclick="searchProduct();">search</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMBS SETCTION END -->

<!-- Start page content -->
<div id="page-content" class="page-wrapper">

	<!-- SHOP SECTION START -->
	<div class="shop-section mb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-xs-12">
					<div class="shop-content">
						<!-- shop-option start -->
						<div class="shop-option box-shadow mb-30 clearfix">
							<!-- Nav tabs -->
							<ul class="shop-tab f-left" role="tablist">
								<li><a href="#grid-view" data-toggle="tab"><i
										class="zmdi zmdi-view-module"></i></a></li>
								<li class="active"><a href="#list-view" data-toggle="tab"><i
										class="zmdi zmdi-view-list-alt"></i></a></li>
							</ul>

							<!-- showing -->
							<!-- <div class="showing f-right text-right">
                                        <span>Showing : 01-10 of 5.</span>
                                    </div> -->
						</div>
						<!-- shop-option end -->
						<!-- Tab Content start -->
						<div class="tab-content">
							<!-- grid-view -->
							<div role="tabpanel" class="tab-pane" id="grid-view">
								<div class="row">
									<!-- product-item start -->
									
									<c:forEach var="item" items="${resultList}">
									
									<div class="col-md-4 col-sm-4 col-xs-12">
										<div class="product-item">
											<div class="product-img">
												<a href="single-product.html">
													<img src="<c:url value="${item.largeImage.URL}"/>" alt="" />
												</a>
											</div>
											<div class="product-info">
												<h6 class="product-title">
													<a href="single-product.html">${item.itemAttributes.title}</a>
												</h6>
												<!-- <div class="pro-rating">
													<a href="#"><i class="zmdi zmdi-star"></i></a> <a href="#"><i
														class="zmdi zmdi-star"></i></a> <a href="#"><i
														class="zmdi zmdi-star"></i></a> <a href="#"><i
														class="zmdi zmdi-star-half"></i></a> <a href="#"><i
														class="zmdi zmdi-star-outline"></i></a>
												</div> -->
												<h3 class="pro-price">${item.itemAttributes.listPrice.formattedPrice}</h3>
												<ul class="action-button">
													<li><a href="#" title="Wishlist"><i
															class="zmdi zmdi-favorite"></i></a></li>
													<li><a href="#" data-toggle="modal"
														data-target="#productModal" title="Quickview"><i
															class="zmdi zmdi-zoom-in"></i></a></li>
													<li><a href="#" title="Compare"><i
															class="zmdi zmdi-refresh"></i></a></li>
													<li><a href="#" title="Add to cart"><i
															class="zmdi zmdi-shopping-cart-plus"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									
									</c:forEach>
									<!-- product-item end -->

								</div>
							</div>
							<!-- list-view -->
							<div role="tabpanel" class="tab-pane active" id="list-view">
								<div class="row">
								
								<!-- product-item start -->
								<c:forEach var="item" items="${resultList}">
								   <div class="col-md-12">
										<div class="shop-list product-item">
											<div class="product-img">
												<a href="single-product.html"> <img
													src="<c:url value="${item.largeImage.URL}"/>"
													alt="" />
												</a>
											</div>
											<div class="product-info">
												<div class="clearfix">
													<h6 class="product-title f-left">
														<a href="single-product.html">${item.itemAttributes.title}</a>
													</h6>
												</div>
												<h6 class="brand-name mb-30">${item.itemAttributes.manufacturer}</h6>
												<h3 class="pro-price">${item.itemAttributes.listPrice.formattedPrice}</h3>

												<p>There are many variations of passages of Lorem Ipsum
													available, but the majority have suffered alteration in
													some form, by injected humour, or randomised words which
													don't look even slightly believable.</p>
												<ul class="action-button">
													<li><a href="#" title="Wishlist"><i
															class="zmdi zmdi-favorite"></i></a></li>
													<li><a href="#" data-toggle="modal"
														data-target="#productModal" title="Quickview"><i
															class="zmdi zmdi-zoom-in"></i></a></li>
													<li><a href="#" title="Compare"><i
															class="zmdi zmdi-refresh"></i></a></li>
													<li><a href="#" title="Add to cart"><i
															class="zmdi zmdi-shopping-cart-plus"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</c:forEach>
								
								<!-- product-item end -->


								</div>
							</div>
						</div>
						<!-- Tab Content end -->
						<!-- shop-pagination start -->
						<ul class="shop-pagination box-shadow text-center ptblr-10-30">
							<li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
							<li><a href="#">01</a></li>
							<li><a href="#">02</a></li>
							<li><a href="#">03</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#">05</a></li>
							<li class="active"><a href="#"><i
									class="zmdi zmdi-chevron-right"></i></a></li>
						</ul>
						<!-- shop-pagination end -->
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- SHOP SECTION END -->

</div>
<!-- End page content -->
<script type="text/javascript">
        	function searchProduct(){
        		var searchKeyWord = $('#keyWord').val();
        		if(null!=searchKeyWord && ""!=searchKeyWord){
        			document.productSearchForm.action = "SearchKeyWord.htm";
        			document.productSearchForm.submit();
        		}else{
        			alert("Please input keyword.");
        		}
        	}
        </script>

