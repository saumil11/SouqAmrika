<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Souqamrika || <tiles:insertAttribute name="title" ignore="true" /></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/portal/assets/img/icon/favicon.png"/>">

    <!-- All CSS Files -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/css/bootstrap.min.css"/>">
    <!-- Nivo-slider css -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/lib/css/nivo-slider.css"/>">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/css/core.css"/>">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/css/shortcode/shortcodes.css"/>">
    <!-- Theme main style -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/style.css"/>">
    <!-- Responsive css -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/css/responsive.css"/>">
    <!-- Template color css -->
    <link href="<c:url value="/portal/assets/css/color/color-core.css"/>" data-style="styles" rel="stylesheet">
    <!-- User style -->
    <link rel="stylesheet" href="<c:url value="/portal/assets/css/custom.css"/>">
 	<!-- jquery latest version -->
    <script src="<c:url value="/portal/assets/js/vendor/jquery-3.1.1.min.js"/>"></script>
    <!-- Modernizr JS -->
    <script src="<c:url value="/portal/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/jquery-ui.min.js"></script>
    
    <style type="text/css">
    	.sticky .user-meta > li > a {
		    padding: 25px 20px;
		}
    	.user-meta > li > a {
		    padding: 20px 20px;
		}
    </style>
    
    <style>
	/* #aboutright { 
	  display: block;
	  width: 350px;
	  padding: 8px 30px;
	  position: absolute;
	  left: 0;
	  background: #fff;
	  z-index: -1;
	} */
	
	#about { 
	  display: block;
	  width: 350px;
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
	<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  


	<!-- Body main wrapper start -->
    <div class="wrapper">
    	
    	<!-- START HEADER AREA -->
    		<tiles:insertAttribute name="header" />
    	<!-- END HEADER AREA -->

        <!-- START MOBILE MENU AREA -->
        	<tiles:insertAttribute name="mobileMenu" />
        <!-- END MOBILE MENU AREA -->

	<div id="about">
		<a href="#" id="closebtn" class="close"><i class="zmdi zmdi-close-circle"></i></a>
		<h2 class="text-center">
			<span><spring:message code="label.aboutUs" /></span>
		</h2>
		<hr />
		<p style="font-size: 25px;text-align: justify;">
			<spring:message code="text.aboutLine1" />
		</p>
		<p style="font-size: 17px;text-align: justify;">
			<spring:message code="text.aboutLine2" />
		</p>
	</div>
  
  <div id="mainpage">
  
  <div id="content"> 
  
        <!-- Start page content -->
       		<tiles:insertAttribute name="content" />
        <!-- End page content -->
 </div>
</div>
	

        <!-- START FOOTER AREA -->
        	<tiles:insertAttribute name="footer" />
        <!-- END FOOTER AREA -->
        
    </div>

	
	 <!-- Placed JS at the end of the document so the pages load faster -->

   
    <!-- Bootstrap framework js -->
    <script src="<c:url value="/portal/assets/js/bootstrap.min.js"/>"></script>
    <!-- jquery.nivo.slider js -->
    <script src="<c:url value="/portal/assets/lib/js/jquery.nivo.slider.js"/>"></script>
    <!-- All js plugins included in this file. -->
    <script src="<c:url value="/portal/assets/js/plugins.js"/>"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="<c:url value="/portal/assets/js/main.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function(){

		  $("#asd").on("click", function(e){
		    e.preventDefault();
		    var hrefval = $(this).attr("href");
		    
		    if(hrefval == "#about") {
		      var distance = $('#mainpage').css('left');
		      
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
		      left: '350px'
		    }, 400, 'easeOutBack'); 
		    $('#about').css("z-index", "1");
		  }
		  
		  function closeSidepage(){
		    $('#mainpage').animate({
		      left: '0px'
		    }, 400, 'easeOutQuint'); 
		    $('#about').css("z-index", "-1")
		  }
		}); 
		</script>
</body>
</html>