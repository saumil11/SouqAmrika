package com.codelab.souqamrika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.codelab.souqamrika.dao.AdminDao;
import com.codelab.souqamrika.dto.User;
import com.codelab.souqamrika.entity.UserMst;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	AdminDao adminDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public UserDetails loadUserByUsername(String userName)
			throws UsernameNotFoundException {
		User user = new User();
		try {
			
			UserMst userMst = this.getAdminDao().getUserByUserName(userName);
			user.setPassword(userMst.getUser_password());
			user.setUsername(userMst.getUser_name());
			user.setUserID(userMst.getUser_id());

		} catch (Exception e) {
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		
		return user;
	}
}
