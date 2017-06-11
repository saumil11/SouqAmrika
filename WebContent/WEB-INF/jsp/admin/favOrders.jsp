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
	<c:set var="mainTitle" value="Saved Orders" scope="request"/>
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
						<h5>Saved Orders</h5>
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
	
	<form:form name="viewOrderForm" id="viewOrderForm" method="post">
		<input type="hidden" value="" id=orderId name="orderId"/>
	</form:form>
	
	<c:set var="delMsg" value="Are you sure you want to delete this Order?" scope="request"/>
	<%@ include file="deletePopUp.jsp" %>
	
	    <div class="modal inmodal fade" id="saveModel" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					
					<h4 class="modal-title"><i class="fa fa-warning"></i> Alert</h4>
				</div>
				<div class="modal-body">
					<p>
						<strong>Are you sure you want to save this Order?</strong>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal" id="confirmFalse">Cancel</button>
					<button type="button" class="btn btn-primary" id="confirmTrue">Save</button>
				</div>
			</div>
		</div>
</div>
	
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
                url: "getAllFavOrders.htm",
                datatype: "json",
                mtype: 'GET',
                height: 340,
                rownumbers: true,
                autowidth: true,
                shrinkToFit: true,
                sortname: 'o.order_id',
                sortorder: 'desc',
                rowNum: 10,
                rowList: [10, 20, 30],
                colNames:['Customer Name','URL','Payment Done'],
    			colModel:[
    				{name:'c.customer_fname',index:'c.customer_fname', width:30,editable: false, classes: 'align_center'},
    				{name:'u.product_url',index:'u.product_url', width:30,editable: false, classes: 'align_center'},
    				{name:'payment_status',index:'payment_status', width:20,editable: false, classes: 'align_center' },
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
            		        var oldURL = "getAllFavOrders.htm";
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
    
    function orderDetails(id){
    	$('#orderId').val(id);
    	$("#viewOrderForm").attr("action","viewOrder.htm");
   	 	$('#viewOrderForm').submit();
    	
    }
    
    function deleteOrder(id) {
		var data1 = { "order_id" : id };
		deleteSingleRow(data1, "deleteOrder.htm");
	}
    
    function saveOrder(id) {
		var data1 = { "order_id" : id };
		saveOrderModel(data1, "saveOrder.htm");
	}
    
    
    </script>
    


<script type="text/javascript">
function getConfirm(callback){

    $("#saveModel").modal({show:true,
        keyboard: false
	});

    $('#confirmFalse').click(function(){
        $('#saveModel').modal('hide');
        if (callback) callback(false);

    });
    
    $('#confirmTrue').click(function(){
        $('#saveModel').modal('hide');
        if (callback) callback(true);
    });
}

function saveOrderModel(fromData,saveUrl) {
	
	getConfirm(function(result) {
		var flag = result;
		if (flag) {
			
			$.ajax({
				url : saveUrl,
				data : fromData,
				type : "POST",
				success : function(resdata, status, xhr) {
					/* var res = resdata.trim();
					if (res == 'Correct') {
						alert("done");
					} */
				},
				error : function(xhr, status, errorThrown) {
					alert("Sorry, there was a problem!");
					console.log("Error: " + errorThrown);
					console.log("Status: " + status);
					console.dir(xhr);
				},
				complete : function(xhr, status) {
					$(grid_selector).trigger( 'reloadGrid' );
				}
			});
		}
		});
}
</script>

</body>
</html>