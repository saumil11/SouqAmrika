<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.product-title {
			white-space: normal;
		}
		.action-button > li > a > i{
			line-height: 28px;
		}
		.shop-pagination > li > a > i{
			line-height: 28px;
		} 
	</style>
</head>
<body>
<!-- BREADCRUMBS SETCTION START -->
<%-- <div class="breadcrumbs-section plr-200 mb-80">
	<div class="breadcrumbs overlay-bg">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="breadcrumbs-inner">
						<div class="new-customers breadcrumbs-title">
							<h1 class="breadcrumbs-title">Product List</h1>
							<form:form method="post" name="productSearchForm"
								id="productSearchForm" role="form" modelAttribute="portal">
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
</div> --%>

 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">product search result List</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="Home.htm">Home</a></li>
                                    <li>product List</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->

<form:form method="post" name="productListForm" id="productListForm" role="form" modelAttribute="portal">
	<input type="hidden" name="keyWord" id="keyWord" value="${keyWord}"/>
	<input type="hidden" name="currentPage" id="currentPage" value="${page}"/>
	<input type="hidden" name="loadPage" id="loadPage"/>
</form:form>

	<!-- BREADCRUMBS SETCTION END -->

<!-- Start page content -->
<div id="page-content" class="page-wrapper">
<form:form method="post" name="productLookUpForm" id="productLookUpForm">
	<input type="hidden" name="itemId" id="itemId">
</form:form>

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
													<a href="javascript:loadSinglePage('${item.ASIN}');">
														<img src="<c:url value="${item.largeImage.URL}"/>" alt=""/>
													</a>
												</div>
												<div class="product-info">
													<h6 class="product-title">
														<a href="javascript:loadSinglePage('${item.ASIN}');">${item.itemAttributes.title}</a>
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
														<li><a href="#" title="Wishlist" style="line-height: 28px;"><i
																class="zmdi zmdi-favorite"></i></a></li>
														<li><a href="#" data-toggle="modal" style="line-height: 28px;"
															data-target="#productModal" title="Quickview"><i
																class="zmdi zmdi-zoom-in"></i></a></li>
														<li><a href="#" title="Compare" style="line-height: 28px;"><i
																class="zmdi zmdi-refresh"></i></a></li>
														<li><a href="#" title="Add to cart" style="line-height: 28px;"><i
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
													<a href="javascript:loadSinglePage('${item.ASIN}');"> <img
														src="<c:url value="${item.largeImage.URL}"/>" alt="" />
													</a>
												</div>
												<div class="product-info">
													<div class="clearfix">
														<h6 class="product-title f-left">
															<a href="javascript:loadSinglePage('${item.ASIN}');">${item.itemAttributes.title}</a>
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
							<li>
								<a id="page_prv" href="javascript:loadPagination('PRV');"><i class="zmdi zmdi-chevron-left"></i></a>
							</li>
							<li id="page_1" class="active"><a href="javascript:loadPagination('1');">01</a></li>
							<li id="page_2"><a href="javascript:loadPagination('2');">02</a></li>
							<li id="page_3"><a href="javascript:loadPagination('3');">03</a></li>
							<li id="page_4"><a href="javascript:loadPagination('4');">04</a></li>
							<li id="page_5"><a href="javascript:loadPagination('5');">05</a></li>
							<li id="page_NXT">
								<a id="page_nxt" href="javascript:loadPagination('NXT');"><i class="zmdi zmdi-chevron-right"></i></a>
							</li>
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
	function loadSinglePage(asin){
		if (null != asin && "" != asin) {
			$("#itemId").val(asin);
			document.productLookUpForm.action = "SingleProduct.htm";
			document.productLookUpForm.submit();
		}
	}
	
	function loadPagination(arg1){
		var page = 0;
		var currPage = parseInt($("#currentPage").val());
		if(null!=arg1 && ""!=arg1 && null!=currPage && ""!=currPage){
			if(arg1=="PRV"){
				if(currPage-1<=1)
					page = "1";
				else{
					page = currPage-1;
				}
			}else if(arg1=="NXT"){
				if(currPage+1>=5)
					page = "5";
				else{
					page = currPage+1;
				}
			}else{
				page = arg1;
			}
		}
		if(page!=0){
			$("#loadPage").val(page);
			document.productListForm.action = "NextProductList.htm";
			document.productListForm.submit();
		}
		
	}
	
	$(document).ready(function() {
		var id = "${page}";
		if(id==1){
			$('#page_prv').css('pointer-events', 'none');
		}else if(id==5){
			$('#page_nxt').css('pointer-events', 'none');
		}
		$(".shop-pagination li").removeClass("active");
	    $("#page_"+id).addClass("active");
	});
	
</script>
</body>
</html>
