<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.footer-social > li > a > i{
			line-height: 28px;
		}
	</style>
</head>
<body>
<footer id="footer" class="footer-area">
            <div class="footer-bottom white-bg">
                <div class="container-fluid">
                    <div class="plr-185">
                        <div class="copyright">
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <div class="copyright-text">
                                        <h3 style="color: black;" class="alignExceptionJustify">&copy; 
                                        	<a href="#" target="_blank">
	                                        	<span id="footerSiteName" class="alignExceptionJustify"><spring:message code="label.siteName"/></span>
	                                       	</a> 
	                                       	<span id="footerRights" class="alignExceptionJustify"><spring:message code="label.allRightReserved"/></span>
	                                       	
	                                	</h3>
										
										<nav id="primary-menu">
										<ul class="main-menu alignExceptionJustify">
											<li style="padding-top: 0px; padding-bottom: 10px; margin: 0 5px;"><a href="#"><spring:message code="label.contact"/></a></li>
										</ul>
										</nav>
		
									</div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <ul class="footer-payment text-right">
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/1.png"/>" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/2.png"/>" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/3.png"/>" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/4.png"/>" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/dhl.png"/>" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/fedex.png"/>" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="<c:url value="/portal/assets/img/payment/tnt.png"/>" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
	<script>
		//detect language and justify the text accordingly
		var text = $("#websiteLabel").text();
		if(text.indexOf("Home") == -1){
			$("h1").css("text-align", "right");
			$("h2").css("text-align", "right");
			$("h3").css("text-align", "right");
			$("h4").css("text-align", "right");
			$("h5").css("text-align", "right");
			$("h6").css("text-align", "right");
			$("span").css("text-align", "right");
			$("div").css("text-align", "right");
			$("a").css("text-align", "right");
			$("p").css("text-align", "right");
		}else{
			$("h1").css("text-align", "justify");
			$("h2").css("text-align", "justify");
			$("h3").css("text-align", "justify");
			$("h4").css("text-align", "justify");
			$("h5").css("text-align", "justify");
			$("h6").css("text-align", "justify");
			$("span").css("text-align", "justify");
			$("div").css("text-align", "justify");
			$("a").css("text-align", "justify");
			$("p").css("text-align", "justify");
		}
		$(".alignException").css("text-align", "left");
		$(".alignExceptionCenter").css("text-align", "center");
		$(".alignExceptionJustify").css("text-align", "justify");
	</script>
</body>
</html>