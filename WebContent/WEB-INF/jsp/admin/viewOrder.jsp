<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	dt, dl {
		line-height:2;
	}
</style>
</head>
<body>
	<c:set var="mainTitle" value="Order Details" scope="request"/>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-4">
			<h2>${mainTitle}</h2>
			<ol class="breadcrumb">
				<li><a href="dashboard.htm">Home</a></li>
				<li class="active"><strong>${mainTitle}</strong></li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-9">
			<div class="wrapper wrapper-content animated fadeInUp">
				<div class="ibox">
					<div class="ibox-content">
						<div class="row">
                                <div class="col-lg-6">
                                	<h2 align="center">Personal Info</h2>
                                    <dl class="dl-horizontal">
                                        <dt>Name : </dt> <dd>${admin.customerMstBO.customer_fname} ${admin.customerMstBO.customer_lname}</dd>
                                        <dt>Email : </dt> <dd>${admin.customerMstBO.customer_email}</dd>
                                        <dt>Mobile No : </dt> <dd>${admin.customerMstBO.customer_mobileNo}</dd>
                                    </dl>
                                </div>
                                <div class="col-lg-6">
                                	<h2 align="center">Shipping Info</h2>
                                    <dl class="dl-horizontal">
                                        <dt>Area : </dt> <dd>${admin.customerMstBO.customer_address}</dd>
                                        <dt>Block : </dt> <dd>${admin.customerMstBO.customer_city}</dd>
                                        <dt>Street : </dt> <dd>${admin.customerMstBO.customer_state}</dd>
                                        <dt>House : </dt> <dd>${admin.customerMstBO.customer_postalcode}</dd>
                                        <dt>Other Details : </dt> <dd>${admin.customerMstBO.customer_otherAddress}</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                	<h2 align="center">Order Info</h2>
                                    <dl class="dl-horizontal">
                                        <dt>Product URL : </dt> 
                                        	<dd>
                                        		<a title='Save order' style='font-size: 15px; padding-right: 10px;' target='_blank' 
                                        			href='${admin.productUrlMstBO.product_url}'> click here </a>
                                        	</dd>
                                        <dt>Payment Status : </dt> <dd>${admin.orderMstBO.payment_status}</dd>
                                        <dt>Order Status : </dt> 
                                        <dd>
	                                        <select class="form-control m-b" name="orderStatus" id="orderStatus" onchange="updateOrderStatus(${admin.orderMstBO.order_id});">
	                                        	<option value="0">-- Select --</option>
		                                        <option value="1">Order placed</option>
		                                        <option value="2">Order verified</option>
		                                        <option value="3">Payment done</option>
		                                        <option value="4">Shipped</option>
	                                    	</select>
	                                    </dd>
                                        

                                    
                                    </dl>
                                </div>
                               
                            </div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<Script type="text/javascript">
		$(document).ready(function(){
			if(''!='${admin.orderMstBO.order_status}'){
				$("#orderStatus").val('${admin.orderMstBO.order_status}');	
			}
			
		});
		function updateOrderStatus(id){
			var orderStatus = $("#orderStatus").val();
			var fromData = {"order_id":id,"order_status":orderStatus};
			$.ajax({
				url : "updateOrderStatus.htm",
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
					//$(grid_selector).trigger( 'reloadGrid' );
				}
			});
		}
	</script>


</body>
</html>