<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/unstandard-1.0" prefix="un" %>
<tiles:useAttribute name="current"/>
<tiles:useAttribute name="parentcurrent"/>
<nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="<c:url value="/admin/assets/img/profile_small.jpg"/>"/>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${sessionScope.userFname} ${sessionScope.userLname}</strong>
                             </span> <span class="text-muted text-xs block">Admin <!-- <b class="caret"></b> --></span> </span> </a>
                    </div>
                    <div class="logo-element">
                        SA
                    </div>
                </li>
                <li class="${current == 'DASHBOARD' ? 'active' : ''}">
                    <a href="dashboard.htm"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span></a>
                </li>
                <li class="${current == 'FAVORDERS' ? 'active' : ''}">
                    <a href="orders.htm"><i class="fa fa-file-text-o"></i> <span class="nav-label">Saved Orders</span></a>
                </li>
                <li class="${current == 'MSGS' ? 'active' : ''}">
                    <a href="messages.htm"><i class="fa fa-envelope"></i> <span class="nav-label">Messages</span></a>
                </li>
            </ul>

        </div>
    </nav>