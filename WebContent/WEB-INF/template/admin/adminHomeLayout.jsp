<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%response.setHeader(
		"Cache-Control",
		"no-cache, no-store, must-revalidate, max-age=0, proxy-revalidate, no-transform, pre-check=0, post-check=0, private");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("userId")!=null){%> 
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title><tiles:insertAttribute name="title" ignore="true" /></title>

    <link href="<c:url value="/admin/assets/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/admin/assets/css/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
    <link href="<c:url value="/admin/assets/css/animate.css"/>" rel="stylesheet">
    <link href="<c:url value="/admin/assets/css/plugins/chosen/chosen.css"/>" rel="stylesheet"/>
	<link href="<c:url value="/admin/assets/css/plugins/jqGrid/custome.jqgrid.css"/>" rel="stylesheet"/>
	<link href="<c:url value="/admin/assets/css/plugins/jqGrid/ui.jqgrid.css"/>" rel="stylesheet"/>
	<link href="<c:url value="/admin/assets/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css"/>" rel="stylesheet"/>
	<link href="<c:url value="/admin/assets/css/style.css"/>" rel="stylesheet">
	
    
    <!-- Mainly scripts -->
    <script src="<c:url value="/admin/assets/js/jquery-2.1.1.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/plugins/metisMenu/jquery.metisMenu.js"/>"></script>
	<script src="<c:url value="/admin/assets/js/plugins/slimscroll/jquery.slimscroll.min.js"/>"></script>

    <!-- Custom and plugin javascript -->
    <script src="<c:url value="/admin/assets/js/inspinia.js"/>"></script>
   	<script src="<c:url value="/admin/assets/js/plugins/pace/pace.min.js"/>"></script>

</head>

<body>

    <div id="wrapper">

    <!-- left menu start-->
		<tiles:insertAttribute name="leftmenu" />
	<!-- left menu end-->

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        	
        	<!-- header start-->
				<tiles:insertAttribute name="header" />
			<!-- header end-->
			
        </div>
        
        	<!-- content start-->
			<tiles:insertAttribute name="content" />
			<!-- content end-->

			<!-- footer start-->
			<tiles:insertAttribute name="footer" />
			<!-- footer end-->
			
        </div>
        </div>

	<script type="text/javascript">
		function removeEmptParent() {
			$("li.parent ul").each(function(i, el) {
			    var html = $(el).html().replace(/\s+/, "");

			    if ($(el).is(":empty") || html.length == 0)
			        $(el).remove();
			});
			$('li.parent').not(':has(ul)').remove();
			
		}
		$(document).ready(function() {
			removeEmptParent();
		});

		function setParent(val) {
			$("#" + val).addClass("active");
		}
	</script>

</body>

</html>
<%
	} else {
		response.sendRedirect("logIn.htm");
	}
%>