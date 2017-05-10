<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>SOUQAMRIKA - Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/admin/assets/css/bootstrap.css"/>" rel="stylesheet">
    <!--external css-->
    <link href="<c:url value="/admin/assets/font-awesome/css/font-awesome.css"/>" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<c:url value="/admin/assets/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/admin/assets/css/style-responsive.css"/>" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>SOUQAMRIKA</b></a>
            <!--logo end-->
            
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logOut.htm">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Basil</h5>
              	  	
                  <li class="mt">
                      <a class="active" href="dashboard.htm">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                      <a class="active" href="messages.htm">
                          <i class="fa fa-envelope"></i>
                          <span>Messages</span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <form:form name="viewMessageForm" id="viewMessageForm" method="post">
		<input type="hidden" value="" id="messageId" name="messageId"/>
	</form:form>
	
      <section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Manage Messages</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          			<div class="row">
						<div class="col-lg-12">
							<div class="ibox ">
								<div class="ibox-title">
									<h5>Messages</h5>
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
          	</div>
			
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="blank.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
  
   <!-- js placed at the end of the document so the pages load faster -->
    <script src="<c:url value="/admin/assets/js/jquery.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/jquery-ui-1.9.2.custom.min.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/jquery.ui.touch-punch.min.js"/>"></script>
    <script class="include" type="text/javascript" src="<c:url value="/admin/assets/js/jquery.dcjqaccordion.2.7.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/jquery.scrollTo.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/admin/assets/js/jquery.nicescroll.js"/>"></script>

	<!--common script for all pages-->
    <script src="<c:url value="/admin/assets/js/common-scripts.js"/>"></script>
    
	<%-- <script src="<c:url value="/admin/assets/js/plugins/jquery-ui/jquery-ui.min.js"/>"></script> --%>
		
    <!-- jqGrid -->
    <script src="<c:url value="/admin/assets/js/plugins/jqGrid/i18n/grid.locale-en.js"/>"></script>
    <script src="<c:url value="/admin/assets/js/plugins/jqGrid/jquery.jqGrid.min.js"/>"></script>
    <%-- <script src='<c:url value="/admin/assets/js/plugins/jquery-ui/jquery-ui.min.js"/>'></script> --%>

    

    <!--script for this page-->
    
 <!--  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script> -->
  
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