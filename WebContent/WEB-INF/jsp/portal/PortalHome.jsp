<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#aboutright { 
	  display: block;
	  width: 700px;
	  padding: 8px 30px;
	  position: absolute;
	  left: 0;
	  background: #fff;
	  z-index: -1;
	}
	
	#mainpage {
	  width: 100%;
	  height: auto;
	  display: block;
	  overflow: hidden;
	  position: relative;
	}
	
</style>
</head>
<body>

	 
	<!-- START SLIDER AREA -->
	<div class="slider-area bg-3 bg-opacity-black-60 ptb-130 mb-80 mt-50">
		<div class="container">
					<div class="row">
						<form:form method="post" name="productSearchForm"
							id="productSearchForm" role="form" modelAttribute="portal">
							<div class="top-search-box f-right">
								<input type="text" name="keyWord" id="keyWord"
									placeholder="<spring:message code="label.search"/>">
								<button type="button" onclick="searchProduct();">
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
						</form:form>
					</div>
					<div class="row">
					<div class="col-xs-12">
					<h3 lang="en" class="text-center" style="color: white;">
						<spring:message code="text.welcomeMsg1"/><br />
						<spring:message code="text.welcomeMsg2"/>
					</h3>
					<br>
					</div>
			<form:form method="post" name="orderUrlProductForm" id="orderUrlProductForm" odelAttribute="portal">
				
				<div class="col-md-12">
					<div class="slider-desc-3 text-center">
						<div class="wow fadeInUp col-sm-offset-2  col-sm-8">
							<input type="text" name="url" id="url" placeholder="<spring:message code="label.inputURL"/>"/>
						</div>
						<div class="wow fadeInUp col-sm-offset-2 col-sm-8">
							<select class="custom-select" name="priceRange" id="priceRange" 
								style="background: rgb(255, 255, 255) url(img/icon/down-arrow.png) no-repeat scroll 97% center;" onchange="displayFee()">
								<option value="defalt"><spring:message code="label.selectPriceRange"/></option>
								<option value="4">$1 - $50</option>
							    <option value="7">$51 - $75</option>
							    <option value="10">$76 - $100</option>
							    <option value="15">$101 - $150</option>
							    <option value="20">$151 - $200</option>
							    <option value="25">$201 - $300</option>
							    <option value="30">$301 - $400</option>
							    <option value="35">$401 - $500</option>
							    <option value="11"><spring:message code="label.optionMore"/></option>
							</select>
						</div>
						<div class="wow fadeInUp col-sm-offset-2 col-sm-8">
							<h4 class="hidden" id="serviceFeeInfo" style="color: white;">
								<span><spring:message code="label.serviceFee"/></span>
								<b id="feeValue"></b>
							</h4>
							<input type="checkbox" id="termsCheck" /> 
								<span><spring:message code="label.agree"/></span>
								<a href="TermsAndConditions.htm" style="color: white;font-size:120%;">
									<span><spring:message code="label.tAndC"/></span>
								</a>
						</div>
						<div class="slider-button wow fadeInUp col-sm-offset-2  col-sm-8">
							<a class="button extra-small mb-20" href="javascript:orderUrlProduct();" class="text-uppercase"><span><spring:message code="label.orderNow"/></span> </a>
						</div>
						<div  class="col-md-12 hidden-xs">
					
	    		</div>
					
					</div>
				</div>
			</form:form>
			</div>
			<div id="arrow">
						<div class="col-md-10" style="top: 55px; left: 225px;text-align: center;">
	    					<h2 class="" style="color: white;"><spring:message code="label.clickHere"/></h2>
	    				</div>
                    	<div class="col-md-2" style="right: 160px;bottom: 55px;">
	    				<img class="hidden-xs hidden-sm hidden-md leftArrowMask" src="<c:url value="/portal/assets/images/arrow1.png"/>">
	    				</div>
	    			</div>	
		</div>
	</div>
	
	
	<!-- END SLIDER AREA -->
	<script type="text/javascript">
	function orderUrlProduct(){
		var arg1 = $("#url").val();
		var arg2 = $("#priceRange").find(":selected").val();
		var arg3 = $("#termsCheck").is(':checked');
		if(null==arg1 || ""==arg1 ){
			alert("<spring:message code="errorMsg.productURLEmpty"/>");
		}else if(null==arg2 || arg2=="defalt" ){
			alert("<spring:message code="errorMsg.priceEmpty"/>");
		}else if(!arg3){
			errMsg = "<spring:message code="errorMsg.tandcEmpty"/>";
			alert(errMsg);
		}else{
			document.orderUrlProductForm.action = "RequestProduct.htm";
			document.orderUrlProductForm.submit();		
		}
	}
	
	//display the service fee based on user's selection
	function displayFee(e){	
		
		var price = 0;
		price = $("#priceRange").val();
		
		$("#serviceFeeInfo").removeClass("hidden");
		if(price == 11){
			$("#feeValue").text("<spring:message code="label.toBeDetermined"/>");
		}else{
			$("#feeValue").text("$"+price);	
		}
	}
	
	function blink(selector){
		$(selector).fadeOut('slow', function(){
		    $(this).fadeIn('slow', function(){
		        blink(this);
		    });
		});
		}
		    
		blink('.leftArrowMask');
		//$('#arrow').delay(10000).fadeOut('slow');
		setTimeout(function(){
				$('#arrow').css('visibility', 'hidden');
			},10000);
		
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