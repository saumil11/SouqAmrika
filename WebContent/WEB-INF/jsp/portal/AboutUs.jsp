<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<div class="container">
	<div class="row">
		<form:form method="post" name="productSearchForm"
								id="productSearchForm" role="form" modelAttribute="portal" style="padding-bottom: 10px;">
								<div class="top-search-box f-right">
									<input type="text" name="keyWord" id="keyWord"
										placeholder="<spring:message code="label.search"/>">
									<button type="button" onclick="searchProduct();">
										<i class="zmdi zmdi-search"></i>
									</button>
								</div>
							</form:form>
	</div>
		<div class="row" style="margin-top:55px;">
			<div>
				
				<h2 class="text-center">
					<span><spring:message code="label.aboutUs"/></span>
				</h2>
				<hr />
				<p style="font-size: 25px;text-align:justify;">
					<i><spring:message code="text.aboutLine1"/></i>
				</p>
				<p style="font-size: 17px;text-align:justify;">
					<spring:message code="text.aboutLine2"/>
				</p>
			</div>
		</div>
	</div>
<!-- End page content -->
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
</body>
</html>