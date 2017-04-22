<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <!-- header-middle-area -->
            <div id="sticky-header" class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="logo">
                                    <a href="Home.htm">
                                        <%-- <img src="<c:url value="/portal/assets/img/logo/logo.png"/>" alt="main logo"> --%>
                                        <h3>
                                        	<b><spring:message code="label.siteName"/></b>
                                        </h3>
                                    </a>
                                </div>
                            </div>
                            <!-- primary-menu -->
                            <!-- <div class="col-md-8 hidden-sm hidden-xs">
                                <nav id="primary-menu">
                                    <ul class="main-menu text-center">
                                        <li>
                                        	<a href="Home.htm">Home</a>
                                        </li>
                                        <li>
                                            <a href="#">About us</a>
                                        </li>
                                        <li>
                                            <a href="#">Contact</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div> -->
                            <!-- header-search & total-cart -->
                            <div class="col-md-push-8 col-md-2 col-sm-2 col-xs-4">
                                <div class="search-top-cart  f-right">
                                    <!-- header-search -->
                                    <div class="header-search header-search-2 f-left">
                                        <div class="header-search-inner">
                                           <button class="search-toggle">
                                            <i class="zmdi zmdi-search"></i>
                                           </button>
                                            <form:form method="post" name="productSearchForm" id="productSearchForm" role="form" modelAttribute="portal">
                                                <div class="top-search-box">
                                                    <input type="text" name="keyWord" id="keyWord" placeholder="<spring:message code="label.search"/>">
                                                    <button type="button" onclick="searchProduct();">
                                                        <i class="zmdi zmdi-search"></i>
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                    <!-- total-cart -->
                                    <div class="header-account header-account-2 f-right">
                                        <ul class="user-meta">
                                            <li><a href="#"><i class="zmdi zmdi-view-headline"></i></a>
                                                <ul>
                                                    <li><a href="Home.htm"><spring:message code="label.home"/></a></li>
                                                    <li><a href="About.htm"><spring:message code="label.aboutUs"/></a></li>
                                                    <li><a href="#"><spring:message code="label.contact"/></a></li>
                                                    <li><a href="Home.htm?locale=en">Language : English</a></li>
                                                    <li><a href="Home.htm?locale=ar">ً بكم في سوق أ</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER AREA -->
        
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