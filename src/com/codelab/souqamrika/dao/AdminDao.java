package com.codelab.souqamrika.dao;

import com.codelab.souqamrika.dto.AdminCustomDTO;
import com.codelab.souqamrika.entity.UserMst;

public interface AdminDao {

	UserMst getUserByUserName(String userName) throws Exception;
	
	boolean deleteCustomer(long custID) throws Exception;

	<T> T get(Class<T> c, long id) throws Exception;

	AdminCustomDTO getOrderDtls(Long orderId) throws Exception;

	boolean updateOrder(long orderId, int orderStatus) throws Exception;

}
