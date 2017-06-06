package com.codelab.souqamrika.service;

import java.util.List;

import com.codelab.souqamrika.dto.AdminCustomDTO;
import com.codelab.souqamrika.dto.PaginationBO;
import com.codelab.souqamrika.entity.ContactDtl;
import com.codelab.souqamrika.entity.UserMst;

public interface AdminService {

	UserMst getUserByUserName(String userName) throws Exception;

	boolean deleteCustomer(long custID) throws Exception;

	AdminCustomDTO getOrderDtls(Long customerId) throws Exception;

	ContactDtl getContactDtls(Long contactId) throws Exception;

	boolean updateOrder(long orderId, int orderStatus) throws Exception;

}
