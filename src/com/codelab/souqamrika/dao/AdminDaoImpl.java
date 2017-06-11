package com.codelab.souqamrika.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dto.AdminCustomDTO;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;
import com.codelab.souqamrika.entity.ProductUrlMst;
import com.codelab.souqamrika.entity.UserMst;

@Repository("AdminDao")
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	SimpleDateFormat formatWithSlashWithTime = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T get(Class<T> c, long id) throws Exception{
		
		Session session=null;
		T t_obj = null;
		try {
			session =this.getSessionFactory().openSession();
			t_obj = (T) session.get(c, id);

		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			
			session.close();
		}
		return t_obj;
	}
	
	@Override
	public UserMst getUserByUserName(String userName) throws Exception{
		
		Session session = null;
		Transaction tx = null;
		UserMst userMst = new UserMst();
		
		try {
			session = this.getSessionFactory().openSession();
			tx = session.beginTransaction();
			Query query = session.createQuery("from UserMst where status!=:userStatus and user_name = :userName");
			query.setParameter("userStatus", SouqAmrikaConstants.DELETE_STATUS);
			query.setParameter("userName", userName);
			userMst = (UserMst) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			
			e.printStackTrace();
		} finally {
			
			session.close();
		}
		return userMst;
	}
	
	@Override
	public boolean deleteCustomer(long custID) throws Exception {
		Session session=null;
		Transaction tx=null;
		Boolean flag = false;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			CustomerMst customerMst = this.get(CustomerMst.class, custID);
			customerMst.setStatus(SouqAmrikaConstants.DELETE_STATUS);
			//customerMst.setUpdated_date();
			session.update(customerMst);
			tx.commit();
			flag = true;
		}
		catch(Exception e){
			tx.rollback();
			
			e.printStackTrace();
				}
		finally{
			
			session.close();
		}
		return flag;
	}

	@Override
	public AdminCustomDTO getOrderDtls(Long orderId) throws Exception {
		Session session = null;
		Transaction tx = null;
		AdminCustomDTO adminCustomDTO = new AdminCustomDTO();
		CustomerMst customerMst = null;
		ProductUrlMst productUrlMst = null;
		OrderMst orderMst = null;
		
		try {
			session = this.getSessionFactory().openSession();
			tx = session.beginTransaction();
			
			Query query = session.createQuery("from OrderMst where status!=:userStatus and order_id = :orderId");
			query.setParameter("userStatus", SouqAmrikaConstants.DELETE_STATUS);
			query.setParameter("orderId", orderId);
			orderMst = (OrderMst) query.uniqueResult();
			
			if(null!=orderMst && null!=orderMst.getCustomer_id()){
				Query query1 = session.createQuery("from CustomerMst where status!=:userStatus and customer_id = :customerId");
				query1.setParameter("userStatus", SouqAmrikaConstants.DELETE_STATUS);
				query1.setParameter("customerId", orderMst.getCustomer_id());
				customerMst = (CustomerMst) query1.uniqueResult();
			}
			
			if(null!=orderMst && null!=orderMst.getProduct_url_id()){
				Query query2 = session.createQuery("from ProductUrlMst where status!=:userStatus and customer_id = :customerId");
				query2.setParameter("userStatus", SouqAmrikaConstants.DELETE_STATUS);
				query2.setParameter("customerId", orderMst.getProduct_url_id());
				productUrlMst = (ProductUrlMst) query2.uniqueResult();
			}
			
			if(orderMst!=null){
				adminCustomDTO.setOrderMstBO(orderMst);
			}
			if(customerMst!=null){
				adminCustomDTO.setCustomerMstBO(customerMst);
			}
			if(productUrlMst!=null){
				adminCustomDTO.setProductUrlMstBO(productUrlMst);
			}
			
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			
			e.printStackTrace();
		} finally {
			
			session.close();
		}
		return adminCustomDTO;
	}
	
	@Override
	public boolean updateOrder(long orderId, int orderStatus) throws Exception {
		Session session=null;
		Transaction tx=null;
		Boolean flag = false;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			OrderMst orderMst = this.get(OrderMst.class, orderId);
			orderMst.setStatus(orderStatus);
			orderMst.setUpdated_date(formatWithSlashWithTime.format(new Date()));
			session.update(orderMst);
			tx.commit();
			flag = true;
		}
		catch(Exception e){
			tx.rollback();
			
			e.printStackTrace();
				}
		finally{
			
			session.close();
		}
		return flag;
	}

}
