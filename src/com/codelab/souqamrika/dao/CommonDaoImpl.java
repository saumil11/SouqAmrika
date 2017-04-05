package com.codelab.souqamrika.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dto.PaginationBO;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;

@Repository("CommonDao")
public class CommonDaoImpl implements CommonDao {

	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public PaginationBO setPagination(PaginationBO paginationBo) {

		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = this.getSessionFactory().openSession();
			tx = session.beginTransaction();
			StringBuilder hql = new StringBuilder(
					"select count(*) as records from "
							+ paginationBo.getPageClass() + " Where "
							+ paginationBo.getStatus_column() + " != "
							+ SouqAmrikaConstants.DELETE_STATUS);
			count = ((Long) session.createQuery(hql.toString()).uniqueResult())
					.intValue();
			paginationBo.setRecords(count);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();

			e.printStackTrace();
		} finally {

			session.close();
		}
		return paginationBo;
	}

	@Override
	public <T> List<T> getListWithPagination(PaginationBO paginationBo)
			throws Exception {

		List<T> list = new ArrayList<T>();
		Session session = null;
		Transaction tx = null;
		try {
			session = this.getSessionFactory().openSession();
			tx = session.beginTransaction();
			String c_name = paginationBo.getPageClass();
			StringBuilder hql = new StringBuilder("from " + c_name + " Where "
					+ paginationBo.getStatus_column() + " != "
					+ SouqAmrikaConstants.DELETE_STATUS + " ORDER BY " + "	"
					+ paginationBo.getSidx() + "  " + paginationBo.getSord()
					+ "	");
			Query query = session.createQuery(hql.toString());
			query.setFirstResult(paginationBo.getStart());
			query.setMaxResults(paginationBo.getLimit());
			list = query.list();
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public PaginationBO setOrderPagination(PaginationBO paginationBo) throws Exception {

		Session session = null;
		Transaction tx = null;
		int count = 0;
		try {
			session = this.getSessionFactory().openSession();
			tx = session.beginTransaction();
			StringBuilder hql = new StringBuilder(
					"select count(c.customer_id) as records from CustomerMst as c, ProductUrlMst as u Where c.customer_id = u.customer_id"
							+ " and c.status != "+ SouqAmrikaConstants.DELETE_STATUS);
			count = ((Long) session.createQuery(hql.toString()).uniqueResult())
					.intValue();
			paginationBo.setRecords(count);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();

			e.printStackTrace();
		} finally {

			session.close();
		}
		return paginationBo;
	}

	@Override
	public <T> List<T> getOrderListWithPagination(PaginationBO paginationBo)
			throws Exception {

		List<T> list = new ArrayList<T>();
		Session session = null;
		Transaction tx = null;
		try {
			session = this.getSessionFactory().openSession();
			tx = session.beginTransaction();
			String c_name = paginationBo.getPageClass();
			StringBuilder hql = new StringBuilder(
					"select c.customer_id as customer_id , c.customer_fname as customer_fname, c.customer_lname as customer_lname, u.product_url as product_url "
					+ "from CustomerMst as c, ProductUrlMst as u Where c.customer_id=u.customer_id"
							+ " and c.status != "+ SouqAmrikaConstants.DELETE_STATUS
							+ " ORDER BY "
							+ "	"
							+ paginationBo.getSidx()
							+ "  "
							+ paginationBo.getSord() + "	");
			Query query = session.createQuery(hql.toString());
			query.setFirstResult(paginationBo.getStart());
			query.setMaxResults(paginationBo.getLimit());
			list = query.setResultTransformer(Transformers.aliasToBean(OrderMst.class)).list();
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		return list;
	}

}