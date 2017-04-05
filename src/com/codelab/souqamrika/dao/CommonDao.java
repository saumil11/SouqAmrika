package com.codelab.souqamrika.dao;

import java.util.List;

import com.codelab.souqamrika.dto.PaginationBO;

public interface CommonDao {
	
	PaginationBO setPagination(PaginationBO paginationBo);

	<T> List<T> getListWithPagination(PaginationBO paginationBo) throws Exception;

	<T> List<T> getOrderListWithPagination(PaginationBO paginationBo) throws Exception;

	PaginationBO setOrderPagination(PaginationBO paginationBo)  throws Exception;
	

}
