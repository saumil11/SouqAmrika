<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- START SLIDER AREA -->
	<div class="slider-area bg-3 bg-opacity-black-60 ptb-150 mb-80">
		<div class="container">
			<div class="row">
			<form:form method="post" name="orderUrlProductForm" id="orderUrlProductForm" odelAttribute="portal">
				<div class="col-md-12">
					<div class="slider-desc-3 text-center">
						<div class="wow fadeInUp col-sm-offset-2  col-sm-8">
							<input type="text" name="url" id="url" placeholder="Enter Product URL"/>
						</div>
						<div class="wow fadeInUp col-sm-offset-2 col-sm-8">
							<select class="custom-select" name="priceRange" id="priceRange" 
								style="background: rgb(255, 255, 255) url(img/icon/down-arrow.png) no-repeat scroll 97% center;">
								<option value="defalt">Select Price Range</option>
								<option value="3">$1 - $25</option>
							    <option value="5">$26 - $50</option>
							    <option value="7">$51 - $75</option>
							    <option value="9">$76 - $100</option>
							    <option value="10">More then $100</option>
							</select>
						</div>
						<div class="slider-button wow fadeInUp col-sm-offset-2  col-sm-8">
							<a class="button extra-small mb-20" href="javascript:orderUrlProduct();" class="text-uppercase"><span>order now </span> </a>
						</div>
					</div>
				</div>
			</form:form>
			</div>
		</div>
	</div>
	<!-- END SLIDER AREA -->
	<script type="text/javascript">
	function orderUrlProduct(){
		var arg1 = $("#url").val();
		var arg2 = $("#priceRange").find(":selected").val();
		if(null==arg1 || ""==arg1 ){
			alert("Please enter a product URL");
		}else if(null==arg2 || arg2=="defalt" ){
			alert("Please select a price range");
		}else{
			document.orderUrlProductForm.action = "RequestProduct.htm";
			document.orderUrlProductForm.submit();		
		}
	}
</script>
</body>
</html>