package com.codelab.souqamrika.service;

import com.codelab.souqamrika.dto.PortalCustomDTO;
import com.codelab.souqamrika.entity.CustomerMst;


public interface PortalService {

	boolean saveCustomerReg(PortalCustomDTO portal) throws Exception;

}
