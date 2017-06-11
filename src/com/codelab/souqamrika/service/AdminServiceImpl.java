package com.codelab.souqamrika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codelab.souqamrika.dao.AdminDao;
import com.codelab.souqamrika.dao.GenricDao;
import com.codelab.souqamrika.dto.AdminCustomDTO;
import com.codelab.souqamrika.entity.ContactDtl;
import com.codelab.souqamrika.entity.UserMst;

@Service("AdminService")
@Transactional
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	private GenricDao genricDao;
	
	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public GenricDao getGenricDao() {
		return genricDao;
	}

	public void setGenricDao(GenricDao genricDao) {
		this.genricDao = genricDao;
	}

	@Override
	public UserMst getUserByUserName(String userName) throws Exception {
		return this.getAdminDao().getUserByUserName(userName);
	}

	@Override
	public boolean deleteCustomer(long custID) throws Exception {
		return this.getAdminDao().deleteCustomer(custID);
	}

	@Override
	public AdminCustomDTO getOrderDtls(Long orderId) throws Exception {
		return this.getAdminDao().getOrderDtls(orderId);
	}

	@Override
	public ContactDtl getContactDtls(Long contactId) throws Exception {
		return this.getGenricDao().get(ContactDtl.class, contactId);
	}

	@Override
	public boolean updateOrder(long orderId, int orderStatus) throws Exception {
		return this.getAdminDao().updateOrder(orderId, orderStatus);
	}

	@Override
	public <T> T get(Class<T> c, long id) {
		return this.getGenricDao().get(c, id);
	}

	@Override
	public <T> Boolean update(T t) {
		return this.getGenricDao().update(t);
	}
	
	

}
