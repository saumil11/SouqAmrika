package com.codelab.souqamrika.service;

import java.util.List;

import com.codelab.souqamrika.dto.PaginationBO;

public interface CommonService {
	
	PaginationBO setPagination(PaginationBO paginationBo);

	<T> List<T> getListWithPagination(PaginationBO paginationBo) throws Exception;

}
