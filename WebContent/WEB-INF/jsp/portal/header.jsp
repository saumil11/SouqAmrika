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
                                <div class="logo" style="padding-top: 15px;padding-bottom: 10px;">
                                    <a href="Home.htm">
                                        <%-- <img src="<c:url value="/portal/assets/img/logo/logo.png"/>" alt="main logo"> --%>
                                        <h1 class="alignException">
                                        	<b><spring:message code="label.siteName"/></b>
                                        </h1>
                                    </a>
                                </div>
                                <div class="logo hidden-xs" style="padding-top: 15px;padding-bottom: 10px;">
									<nav id="primary-menu">
										<ul class="main-menu text-center">
											<li style="padding-top: 0px; padding-bottom: 10px; margin: 0 5px;font-size:110%;"><a href="Home.htm" id="websiteLabel"><spring:message code="label.home"/></a></li>
											<li style="padding-top: 0px;padding-bottom: 10px; margin: 0 5px;font-size:110%;"><a id="asd" href="#about"><spring:message code="label.aboutUs"/></a></li>
										</ul>
									</nav>
								</div>
								<div class="logo visible-xs" style="padding-top: 15px;padding-bottom: 10px;">
									<nav id="primary-menu">
										<ul class="main-menu text-center">
											<li style="padding-top: 0px; padding-bottom: 10px; margin: 0 5px;font-size:110%;"><a href="Home.htm" id="websiteLabel"><spring:message code="label.home"/></a></li>
											<li style="padding-top: 0px;padding-bottom: 10px; margin: 0 5px;"><a href="About.htm"><spring:message code="label.aboutUs"/></a></li>
										</ul>
									</nav>
								</div>
								<div class="col-xs-12 visible-xs">
                                <div class="search-top-cart f-right">
                                    <!-- header-search -->
                                    <div class="header-search header-search-2 col-xs-6" style="padding-right: 10px;">
                                        <div class="header-search-inner">
                                           <a class="btn btn-info" href="#" id="langChangeEn" onclick="setLangeuage('en');" style="padding: 0 15px;"><span>English</span> </a>
                                        </div>
                                    </div>
                                    <div class="header-search header-search-2 col-xs-6">
                                        <div class="header-search-inner">
                                           &nbsp;&nbsp;<a class="btn btn-success" href="#" id="langChangeAr" onclick="setLangeuage('ar');"><span> عربي</span> </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
		
							</div>
                            
                            <!-- primary-menu -->
                            <div class="col-md-push-2 col-md-4 hidden-sm hidden-xs">
                                <nav id="primary-menu">
                                    <ul class="main-menu text-center">
                                        <li>
                                        	<h2><spring:message code="label.welcome"/></h2>
                                        </li>
                                        
                                    </ul>
                                </nav>
                            </div>
                            <!-- header-search & total-cart -->
                            <%-- <div class="col-md-push-8 col-md-2 col-sm-2 col-xs-4">
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
                                                    <li><a id="langChangeEn" href="" onclick="setLangeuage('en');">Languagasnkajsndkjansdkjne : English</a></li>
                                                    <li><a id="langChangeAr" href="" onclick="setLangeuage('ar');">لغة: عربي</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                
                                </div>
                            </div> --%>
                            
                            <div class="col-md-push-2 col-md-4 col-sm-2 col-xs-4 hidden-xs">
                                <div class="search-top-cart  f-right">
                                    <!-- header-search -->
                                    <div class="header-search header-search-2 f-left">
                                        <div class="header-search-inner">
                                           <a class="btn btn-info" href="#" id="langChangeEn" onclick="setLangeuage('en');" style="padding: 0 15px;"><span>English</span> </a>
                                        </div>
                                    </div>
                                    <div class="header-search header-search-2 f-left">
                                        <div class="header-search-inner">
                                           &nbsp;&nbsp;<a class="btn btn-success" href="#" id="langChangeAr" onclick="setLangeuage('ar');"><span> عربي</span> </a>
                                        </div>
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
        
        function setLangeuage(ar1){
        	$.ajax
    		({
    			url : "setLanguage.htm?locale="+ar1,
    			success : function(result)
    			{
    				if(result=="SUCCESS"){
    					location.reload();
    				}
    			}
    		}); 	
        }
        
        </script>