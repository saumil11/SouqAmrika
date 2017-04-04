package com.codelab.souqamrika.dto;

import java.io.Serializable;

import com.codelab.souqamrika.entity.CustomerMst;

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
	
}
