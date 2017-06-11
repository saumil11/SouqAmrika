package com.codelab.souqamrika.dto;

import java.io.Serializable;

import com.codelab.souqamrika.entity.ContactDtl;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;
import com.codelab.souqamrika.entity.ProductUrlMst;

public class AdminCustomDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2232092744149905256L;
	
	private CustomerMst customerMstBO = new CustomerMst();

	public CustomerMst getCustomerMstBO() {
		return customerMstBO;
	}

	public void setCustomerMstBO(CustomerMst customerMstBO) {
		this.customerMstBO = customerMstBO;
	}
	
	private ProductUrlMst productUrlMstBO = new ProductUrlMst();

	public ProductUrlMst getProductUrlMstBO() {
		return productUrlMstBO;
	}

	public void setProductUrlMstBO(ProductUrlMst productUrlMstBO) {
		this.productUrlMstBO = productUrlMstBO;
	}
	
	private ContactDtl contactDtl = new ContactDtl();

	public ContactDtl getContactDtl() {
		return contactDtl;
	}

	public void setContactDtl(ContactDtl contactDtl) {
		this.contactDtl = contactDtl;
	}
	
	private OrderMst orderMstBO = new OrderMst();

	public OrderMst getOrderMstBO() {
		return orderMstBO;
	}

	public void setOrderMstBO(OrderMst orderMstBO) {
		this.orderMstBO = orderMstBO;
	}
	
	
	
	

	
	
}
