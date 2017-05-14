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
	<c:set var="mainTitle" value="Message Details" scope="request"/>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-4">
			<h2>${mainTitle}</h2>
			<ol class="breadcrumb">
				<li><a href="dashboard.htm">Home</a></li>
				<li><a href="messages.htm">Messages</a></li>
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
							<div class="col-lg-12">
								<h2 align="center">Message Info</h2>
								<dl class="dl-horizontal">
									<dt>Name :</dt>
									<dd>${admin.contactDtl.name}</dd>
									<dt>Email :</dt>
									<dd>${admin.contactDtl.email}</dd>
									<dt>Subject : </dt>
									<dd>${admin.contactDtl.subject}</dd>
									<dt>Message : </dt>
									<dd>${admin.contactDtl.message}</dd>
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