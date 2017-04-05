package com.codelab.souqamrika.utility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.codelab.souqamrika.entity.UserMst;
import com.codelab.souqamrika.service.AdminService;

public class CustomAuthenticationSuccessHandler implements
AuthenticationSuccessHandler{
	
	@Autowired
	AdminService adminService;
		
	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		/*List<Role> roles = (List<Role>) auth.getAuthorities();
		String dsgn = roles.get(0).getName();*/
		UserMst usermst = null;
		try {
			usermst = this.getAdminService().getUserByUserName(auth.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession(true);
			if(null!=usermst){
			session.setAttribute("userId", usermst.getUser_id());
			session.setAttribute("userFname", usermst.getUser_fname());
			session.setAttribute("userLname", usermst.getUser_lname());
			//session.setAttribute("userDsgn", dsgn);
			//session.setAttribute("authorities", modPermLst);
		}
		//response.sendRedirect(request.getContextPath() + "/dashboard.htm");
		response.sendRedirect("dashboard.htm");

	}
}
