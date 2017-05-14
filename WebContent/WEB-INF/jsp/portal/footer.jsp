<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<style>
	.error{
		color: red;
	}
	.message-box input {
     margin-bottom: 15px;
}
		.footer-social > li > a > i{
			line-height: 28px;
		}
		
		.modal {
  text-align: center;
  padding: 0!important;
}

.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -4px;
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
  margin-top:140px;
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
											<li style="padding-top: 0px; padding-bottom: 10px; margin: 0 5px;"><a href="#" data-toggle="modal" data-target="#myModal"><spring:message code="label.contact"/></a></li>
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
        
        <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
        <div class="">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="message-box box-shadow white-bg">
                            	<form name="contact-form" id="contact-form">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4 class="blog-section-title border-left mb-30"><spring:message code="label.getInTounch"/></h4>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="name" id="name" placeholder="<spring:message code="label.cName"/>">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="email" id="email" placeholder="<spring:message code="label.cEmail"/>">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="subject" id="subject" placeholder="<spring:message code="label.cSubject"/>">
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <textarea class="custom-textarea" name="message" id="message" placeholder="<spring:message code="label.cMsg"/>"></textarea>
                                        </div>
                                        <div class="col-md-12">
                                        	<button id="sendMsg"class="submit-btn-1 mt-30 btn-hover-1" onclick="validateContactDtls();" type="button"><spring:message code="label.cSendMsg"/></button>
                                        </div>
                                    </div>
                            	</form>        
                            </div>
                        </div>
                    </div>
            </div>
    </div>
  </div>
	<script type="text/javascript">
	
		function validateContactDtls() {
			var valid = false;
			valid = $("#contact-form").valid();
			if (valid)
				saveContactDetails();
		}

		function saveContactDetails() {
			$("#sendMsg").attr("disabled", true);
			var c_name = $("#name").val();
			var c_email = $("#email").val();
			var c_subject = $("#subject").val();
			var c_msg = $("#message").val();

			var data1 = {
				"name" : c_name,
				"email" : c_email,
				"subject" : c_subject,
				"message" : c_msg
			};

			$.ajax({
				url : "SaveContactDetails.htm",
				data : data1,
				type : "POST",
				success : function(resdata, status, xhr) {
					/* var res = resdata.trim();
					if (res == 'Correct') {
						alert("done");
					} */
				},
				error : function(xhr, status, errorThrown) {
					console.log("Error: " + errorThrown);
					console.log("Status: " + status);
					console.dir(xhr);
					$('#myModal').modal('toggle');
					alert("Sorry, there was a problem!");
				},
				complete : function(xhr, status) {
					$("#contact-form").trigger('reset');
					$('#myModal').modal('toggle');
					$("#sendMsg").removeAttr("disabled");
				}
			});

		}

		$(document).ready(function() {

			$("#contact-form").validate({
				rules : {
					"name" : {
						required : true
					},
					"email" : {
						required : true,
						email : true

					},
					"subject" : {
						required : true
					},
					"message" : {
						required : true
					}
				}

			});
		});
		//detect language and justify the text accordingly
		/* var text = $("#websiteLabel").text();
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
		$(".alignExceptionJustify").css("text-align", "justify"); */
	</script>
</body>
</html>