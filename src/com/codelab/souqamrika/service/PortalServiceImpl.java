package com.codelab.souqamrika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dao.GenricDao;
import com.codelab.souqamrika.dao.PortalDao;
import com.codelab.souqamrika.dto.PortalCustomDTO;
import com.codelab.souqamrika.entity.ContactDtl;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;

@Service("PortalService")
@Transactional
public class PortalServiceImpl implements PortalService{

	@Autowired
	private PortalDao portalDao;
	
	@Autowired
	private GenricDao genricDao;

	public PortalDao getPortalDao() {
		return portalDao;
	}

	public void setPortalDao(PortalDao portalDao) {
		this.portalDao = portalDao;
	}

	public GenricDao getGenricDao() {
		return genricDao;
	}

	public void setGenricDao(GenricDao genricDao) {
		this.genricDao = genricDao;
	}

	@Override
	public boolean saveCustomerReg(PortalCustomDTO portalCustomDTO) throws Exception {
		Boolean flag = false;
		flag = this.getGenricDao().save(portalCustomDTO.getCustomerMstBO());
		if(flag && null!=portalCustomDTO.getCustomerMstBO().getCustomer_id()){
			portalCustomDTO.getProductUrlMstBO().setCustomer_id(portalCustomDTO.getCustomerMstBO().getCustomer_id());
			flag = this.getGenricDao().save(portalCustomDTO.getProductUrlMstBO());
		}
		if(flag && null!=portalCustomDTO.getCustomerMstBO().getCustomer_id()
				&& null!=portalCustomDTO.getProductUrlMstBO().getProduct_url_id()){
			portalCustomDTO.getOrderMstBO().setCustomer_id(portalCustomDTO.getCustomerMstBO().getCustomer_id());
			portalCustomDTO.getOrderMstBO().setProduct_url_id(portalCustomDTO.getProductUrlMstBO().getProduct_url_id());
			flag = this.getGenricDao().save(portalCustomDTO.getOrderMstBO());
		}
		return flag; 
	}

	@Override
	public boolean saveContactDtl(ContactDtl contactDtl) throws Exception {
		return this.getGenricDao().save(contactDtl);
	}

	@Override
	public void updatePaymentStatus(Long orderId) throws Exception {
		OrderMst orderMst = this.getGenricDao().get(OrderMst.class, orderId);
		if(null!=orderMst){
			orderMst.setPayment_status(SouqAmrikaConstants.PAYMENT_STATUS_Y);
			this.getGenricDao().update(orderMst);
		}
	}
	
	
}
