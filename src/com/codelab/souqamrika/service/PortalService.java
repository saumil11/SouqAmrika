package com.codelab.souqamrika.service;

import com.codelab.souqamrika.dto.PortalCustomDTO;
import com.codelab.souqamrika.entity.ContactDtl;


public interface PortalService {

	boolean saveCustomerReg(PortalCustomDTO portal) throws Exception;

	boolean saveContactDtl(ContactDtl contactDtl) throws Exception;

	void updatePaymentStatus(Long orderId) throws Exception;

}
