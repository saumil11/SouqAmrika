package com.codelab.souqamrika.service;

import java.util.List;

import com.codelab.souqamrika.dto.PaginationBO;
import com.codelab.souqamrika.dto.PortalCustomDTO;

public interface CommonService {
	
	PaginationBO setPagination(PaginationBO paginationBo) throws Exception;

	<T> List<T> getListWithPagination(PaginationBO paginationBo) throws Exception;
	
	<T> List<T> getOrderListWithPagination(PaginationBO paginationBo) throws Exception;

	PaginationBO setOrderPagination(PaginationBO paginationBo) throws Exception;

	PortalCustomDTO getOrderDtls(Long orderId) throws Exception;

}
