<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>