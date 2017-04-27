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
	  width: 350px;
	  padding: 8px 30px;
	  position: absolute;
	  right: 0;
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

	<div id="aboutright">
		<a href="#" id="closebtn" class="close"><i class="zmdi zmdi-close-circle"></i></a>
		<h2 class="text-center">
			<span><spring:message code="label.aboutUs" /></span>
		</h2>
		<hr />
		<p style="font-size: 20px;">
			<spring:message code="text.aboutLine1" />
		</p>
		<p style="font-size: 17px;">
			<spring:message code="text.aboutLine2" />
		</p>
	</div>
  
  <div id="mainpage">
  
  <div id="content"> 
	<!-- START SLIDER AREA -->
	<div class="slider-area bg-3 bg-opacity-black-60 ptb-150 mb-80">
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
			<form:form method="post" name="orderUrlProductForm" id="orderUrlProductForm" odelAttribute="portal">
				<div  class="col-md-1" style="top: -75px; left: 125px;">
					<div id="arrow">
	    			<h5 class="" style="color: white;">Click here to do stuff</h5>
	    			<img class="hidden-xs hidden-sm hidden-md leftArrowMask" src="<c:url value="/portal/assets/images/arrow1.png"/>">
	    			</div>
	    		</div>
				<div class="col-md-10">
					<h4 lang="en" class="text-center" style="color: white;">
						<spring:message code="text.welcomeMsg"/>
					</h4>
					<br>
					<div class="slider-desc-3 text-center">
						<div class="wow fadeInUp col-sm-offset-2  col-sm-8">
							<input type="text" name="url" id="url" placeholder="<spring:message code="label.inputURL"/>"/>
						</div>
						<div class="wow fadeInUp col-sm-offset-2 col-sm-8">
							<select class="custom-select" name="priceRange" id="priceRange" 
								style="background: rgb(255, 255, 255) url(img/icon/down-arrow.png) no-repeat scroll 97% center;" onchange="displayFee()">
								<option value="defalt"><spring:message code="label.selectPriceRange"/></option>
								<option value="3">$1 - $100</option>
							    <option value="5">$101 - $200</option>
							    <option value="7">$201 - $300</option>
							    <option value="9">$301 - $400</option>
							    <option value="10">$401 - $500</option>
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
								<a href="TermsAndConditions.htm" style="color: white;">
									<span><spring:message code="label.tAndC"/></span>
								</a>
						</div>
						<div class="slider-button wow fadeInUp col-sm-offset-2  col-sm-8">
							<a class="button extra-small mb-20" href="javascript:orderUrlProduct();" class="text-uppercase"><span><spring:message code="label.orderNow"/></span> </a>
						</div>
						
					</div>
				</div>
			</form:form>
			</div>
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
	
	$(document).ready(function(){

		  $("#asd").on("click", function(e){
		    e.preventDefault();
		    var hrefval = $(this).attr("href");
		    
		    if(hrefval == "#about") {
		      var distance = $('#mainpage').css('right');
		      
		      if(distance == "auto" || distance == "0px") {
		        openSidepage();
		      } else {
		        closeSidepage();
		      }
		    }
		  });
		  
		  $("#closebtn").on("click", function(e){
		    e.preventDefault();
		    closeSidepage();
		  }); // end close button event handler

		  function openSidepage() {
		    $('#mainpage').animate({
		      right: '350px'
		    }, 400, 'easeOutBack'); 
		    $('#aboutright').css("z-index", "1");
		  }
		  
		  function closeSidepage(){
		    $('#mainpage').animate({
		      right: '0px'
		    }, 400, 'easeOutQuint'); 
		    $('#aboutright').css("z-index", "-1")
		  }
		}); 
	
	function blink(selector){
		$(selector).fadeOut('slow', function(){
		    $(this).fadeIn('slow', function(){
		        blink(this);
		    });
		});
		}
		    
		blink('.leftArrowMask');
		$('#arrow').delay(10000).fadeOut('slow');
</script>
</body>
</html>