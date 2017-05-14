<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<c:set var="mainTitle" value="Messages" scope="request"/>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-4">
			<h2>${mainTitle}</h2>
			<ol class="breadcrumb">
				<li><a href="dashboard.htm">Home</a></li>
				<li class="active"><strong>${mainTitle}</strong></li>
			</ol>
		</div>
	</div>
	
	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox ">
					<div class="ibox-title">
						<h5>Manage Messages</h5>
					</div>
					<div class="ibox-content">

						<div class="jqGrid_wrapper">
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<form:form name="viewMessageForm" id="viewMessageForm" method="post">
		<input type="hidden" value="" id="messageId" name="messageId"/>
	</form:form>
	
    <script src="<c:url value="/admin/assets/js/plugins/jquery-ui/jquery-ui.min.js"/>"></script>
	
    <!-- jqGrid -->
    <script src='<c:url value="/admin/assets/js/plugins/jqGrid/i18n/grid.locale-en.js"/>'></script>
    <script src='<c:url value="/admin/assets/js/plugins/jqGrid/jquery.jqGrid.min.js"/>'></script>
    <script src='<c:url value="/admin/assets/js/plugins/jquery-ui/jquery-ui.min.js"/>'></script>
    
    <script type="text/javascript">
	
    var grid_selector = "#grid-table";
	var pager_selector = "#grid-pager";
	
    $(document).ready(function () {
    		//$('.chosen-select').chosen();
            // Configuration for jqGrid Example 2
            $(grid_selector).jqGrid({
                url: "getAllMessages.htm",
                datatype: "json",
                mtype: 'GET',
                height: 340,
                rownumbers: true,
                autowidth: true,
                shrinkToFit: true,
                sortorder: 'DESC',
                rowNum: 10,
                rowList: [10, 20, 30],
                colNames:['Name','Subject'],
    			colModel:[
    				{name:'name',index:'name', width:30,editable: false},
    				{name:'subject',index:'subject', width:70,editable: false}
    				
    			],
                pager: pager_selector,
                viewrecords: true,
                caption: "",
                hidegrid: false,
            });
            
         // Setup buttons
            $(grid_selector).jqGrid('navGrid',pager_selector,
                    {
            			edit: false, 
            			add: false, 
            			del: false, 
            			search: false,
            			refresh: true,
            			beforeRefresh: function(){
            		        var oldURL = "getAllMessages.htm";
            		        $(grid_selector).setGridParam({url:oldURL,page:1});
            		    }
            		},
                    {},{},{},
                    {
                    	height: 200, 
                    	reloadAfterSubmit: true
                    }
            );
            
            // Add responsive to jqGrid
            $(window).bind('resize', function () {
                var width = $('.jqGrid_wrapper').width();
                $('#grid-table').setGridWidth(width);
            });
	});
    
    function messageDetails(id){
    	$('#messageId').val(id);
    	$("#viewMessageForm").attr("action","ViewMessage.htm");
   	 	$('#viewMessageForm').submit();
    	
    }
    
    
    </script>

</body>
</html>