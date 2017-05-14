<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Souq Amrika | Admin Login</title>
<link href="<c:url value="/admin/assets/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/admin/assets/css/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
<link href="<c:url value="/admin/assets/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/admin/assets/css/style.css"/>" rel="stylesheet">
<!-- Mainly scripts -->	
<script src="<c:url value="/admin/assets/js/jquery-2.1.1.js"/>"></script>
<script src="<c:url value="/admin/assets/js/bootstrap.min.js"/>"></script>
<!-- Jquery Validate -->
<script src="<c:url value="/admin/assets/js/plugins/validate/jquery.validate.min.js"/>"></script>
</head>
<body class="gray-bg">
	<div class="loginColumns animated fadeInDown">
        <div class="row">

            <div class="col-md-6">
                <h2 class="font-bold">Welcome to Souq Amrika</h2>

                <p>
                    We are revolutionizing shopping in the Arabian Gulf and the Middle East and creating easy, 
                    cost effective and reliable ways to shop online and have the items delivered to your door. 
                </p>

                <p>
                    Here at SouqAmrika we are making it easy to get the products you want.
                </p>

                <p>
                   we believe in providing excellent service to our customers all across the globe… 
                   If there’s something you want but can’t find, contact us and we can provide you a personal shopper 
                   who will find the items you’re looking for.
                </p>

            </div>
            <div class="col-md-6">
                <div class="ibox-content">
                	<c:if test="${param.error.equals('true')}">
                		<div class="alert alert-danger" id="error_div">Sorry!! User Name or Password incorrect.</div>
                	</c:if>
                    <tiles:insertAttribute name="content" />
                    <p class="m-t">
                        <small>Souq Amrika &copy; 2017</small>
                    </p>
                </div>
            </div>
        </div>
        <hr/>
        <!-- <div class="row">
            <div class="col-md-6">
                Copyright Codelab Technologies
            </div>
            <div class="col-md-6 text-right">
               <small>© 2016-2017</small>
            </div>
        </div> -->
    </div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#error_div").fadeOut(5000);
			$("#loginForm").validate({
                rules: {
                	j_username: {
                        required: true
                    },
                    j_password: {
                        required: true
                    }
                }
            });
		});
		function checkDetails() {
   			var flag = false;
   			flag = $("#loginForm").valid();
   			
   			if (flag) {
   				document.loginForm.action="j_spring_security_check.htm";
       			document.loginForm.submit();
   			}
   		}
	</script>

</body>
</html>
