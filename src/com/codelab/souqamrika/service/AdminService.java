package com.codelab.souqamrika.service;

import java.util.List;

import com.codelab.souqamrika.entity.UserMst;

public interface AdminService {

	UserMst getUserByUserName(String userName) throws Exception;

	boolean deleteCustomer(long custID) throws Exception;

}
