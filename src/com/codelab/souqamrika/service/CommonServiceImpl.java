package com.codelab.souqamrika.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codelab.souqamrika.dao.CommonDao;
import com.codelab.souqamrika.dto.PaginationBO;
import com.codelab.souqamrika.dto.PortalCustomDTO;

@Service("CommonService")
@Transactional
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao commonDao;
	
	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	@Override
	public PaginationBO setPagination(PaginationBO paginationBo) throws Exception {
		PaginationBO pageObj = this.getCommonDao().setPagination(paginationBo);
		int count = pageObj.getRecords();
		int limit = pageObj.getLimit();
		int total_pages = pageObj.getTotal_pages();
		int page = pageObj.getPage();
		int start = pageObj.getStart();
		String sidx = pageObj.getSidx();
		String sord = pageObj.getSord();

		if (count > 0) {
			total_pages = (int) Math.ceil((float) count / limit);
		} else {
			total_pages = 0;
		}
		if (page > total_pages) {
			page = total_pages;
		}
		start = limit * page - limit; // do not put $limit*($page - 1)
		if (start < 0) {
			start = 0;
		}
		if (sidx.isEmpty()) {
			sidx = pageObj.getDefault_column();
			sord = "asc";
		}
		if (!sord.equals("desc")) {
			sord = "asc";
		}
		pageObj.setSidx(sidx);
		pageObj.setSord(sord);
		pageObj.setPage(page);
		pageObj.setStart(start);
		pageObj.setTotal_pages(total_pages);
		return pageObj;
	}
	
	@Override
	public <T> List<T> getListWithPagination(PaginationBO paginationBo) throws Exception{
		return this.getCommonDao().getListWithPagination(paginationBo);
	}
	
	@Override
	public PaginationBO setOrderPagination(PaginationBO paginationBo) throws Exception {
		PaginationBO pageObj = this.getCommonDao().setOrderPagination(paginationBo);
		int count = pageObj.getRecords();
		int limit = pageObj.getLimit();
		int total_pages = pageObj.getTotal_pages();
		int page = pageObj.getPage();
		int start = pageObj.getStart();
		String sidx = pageObj.getSidx();
		String sord = pageObj.getSord();

		if (count > 0) {
			total_pages = (int) Math.ceil((float) count / limit);
		} else {
			total_pages = 0;
		}
		if (page > total_pages) {
			page = total_pages;
		}
		start = limit * page - limit; // do not put $limit*($page - 1)
		if (start < 0) {
			start = 0;
		}
		if (sidx.isEmpty()) {
			sidx = pageObj.getDefault_column();
			sord = "asc";
		}
		if (!sord.equals("desc")) {
			sord = "asc";
		}
		pageObj.setSidx(sidx);
		pageObj.setSord(sord);
		pageObj.setPage(page);
		pageObj.setStart(start);
		pageObj.setTotal_pages(total_pages);
		return pageObj;
	}
	
	@Override
	public <T> List<T> getOrderListWithPagination(PaginationBO paginationBo)
			throws Exception {
		return this.getCommonDao().getOrderListWithPagination(paginationBo);
	}

	@Override
	public PortalCustomDTO getOrderDtls(Long orderId) throws Exception {
		return this.getCommonDao().getOrderDtls(orderId);
	}

}
