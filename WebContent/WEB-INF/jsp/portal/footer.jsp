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
                                        <h3 style="color: black;">&copy; 
                                        	<a href="#" target="_blank">
	                                        	<span><spring:message code="label.siteName"/></span>
	                                       	</a> 
	                                       	<span><spring:message code="label.allRightReserved"/></span>
	                                       	
	                                	</h3>
										
								<nav id="primary-menu">
								<ul class="main-menu">
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
</body>
</html>