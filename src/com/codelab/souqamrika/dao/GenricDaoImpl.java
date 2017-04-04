package com.codelab.souqamrika.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;

@Repository
public class GenricDaoImpl implements GenricDao{

	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public <T> boolean save(T t)  throws Exception{
		
		Session session=null;
		Transaction tx=null;
		Boolean flag=false;
		try{
		
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			session.save(t);
			tx.commit();
			flag = true;
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}
	
	//To save entire list of different objects
	@Override
	public <T> boolean save(List<T> t) throws Exception{
		
		Session session=null;
		Transaction tx=null;
		Boolean flag=false;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			for(int i=0;i<t.size();i++)
			{
				session.save(t.get(i));
			}
			tx.commit();
			flag=true;
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
	public <T> Boolean savealllist(List<T> t) {
		
		Session session=null;
		Transaction tx=null;
		Boolean flag=false;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			for(int i=0;i<t.size();i++)
			{
				session.save(t.get(i));
			}
			tx.commit();
			flag=true;
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
	public <T> Boolean update(T t) {
		
		Session session=null;
		Transaction tx=null;
		Boolean flag = false;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			session.update(t);
			tx.commit();
			flag=true;
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
	public <T> Boolean update(List<T> t) {
		
		Session session=null;
		Transaction tx=null;
		Boolean flag = false;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			for(int i=0;i<t.size();i++)
			{
				session.update(t.get(i));
			}
			tx.commit();
			flag=true;
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
	public <T> T get(Class<T> c, long id) {
		
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
	public <T> T load(Class<T> c, long id) {
		
		Session session=null;
		T t_obj = null;
		try {
			session =this.getSessionFactory().openSession();
			t_obj = (T) session.load(c, id);

		} catch (Exception e) {
			this.get(c, id);
		} finally {
			
			session.close();
		}
		return t_obj;
	}
	
	@Override
	public <T> void delete(List<T> t) {
		
		Session session=null;
		Transaction tx=null;
		try{
			session=this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			for(int i=0;i<t.size();i++)
			{
				session.delete(t.get(i));
			}
			tx.commit();
		}
		catch(Exception e){
			tx.rollback();
			e.printStackTrace();
				}
		finally{
			session.close();
		}
		
	}
	
	@Override
	public <T> boolean delete(Class<T> c, long id) {
		
		Session session=null;
		Transaction tx=null;
		T t_obj = null;
		boolean flag = false;
		try {
			session =this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			t_obj = (T) session.get(c, id);
			session.delete(t_obj);
			tx.commit();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		return flag;
	}
	
	@Override
	public <T> List<T> getSingleList(Class<T> c, String statuCol) {
		
		List<T> list = new ArrayList<T>();
		Session session=null;
		Transaction tx=null;
		try {
			session =this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			String c_name = c.getSimpleName();
			list = session.createQuery("from " + c_name +" where "+statuCol+" != "+SouqAmrikaConstants.DELETE_STATUS).list();
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
	public <T> Map<Integer, Object> getMultipleList(Map<Integer, T> t, Map<Integer, String> t1) {
		
		Map<Integer, Object> map=new HashMap<Integer,Object>();
		Session session=null;
		Transaction tx=null;
		try {
			session =this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			for(int i=0;i<t.size();i++){
				Class<T> cl=(Class<T>)t.get(i);
				String c_name=cl.getSimpleName();
				String statusCol = (String) t1.get(i);
				List<T> list = session.createQuery("from " + c_name +" where "+statusCol+" != "+SouqAmrikaConstants.DELETE_STATUS).list();
				map.put(i, list);
				cl=null;
				c_name=null;
				
			}
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		return map;
	}
	
	/*Master Generic Method
	 * get multiple object list by putting particular class type as key and pass another map as value
	 * anotehr map contain bo column and value as key value pair
	 * */
	@Override
	public <T> Map<T, Object> getMultipleListMulArgs(
			Map<T, Map<String, String>> t) {
		
		Map<T, Object> map=new HashMap<T, Object>();
		Session session=null;
		Transaction tx=null;
		StringBuilder builder=new StringBuilder();
		try {
			session =this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			for(Map.Entry<T, Map<String, String>> m:t.entrySet()){
				Class<T> cl=(Class<T>)m.getKey();
				String c_name=cl.getSimpleName();
				Map<String, String> sub_map=m.getValue();
				builder.replace(0, builder.length(), "");
				builder.append("from " + c_name+" where ");
				if(sub_map!=null && sub_map.size()>0){
					boolean isAppend=sub_map.containsKey("append");
					Object[] sub_map_arr=sub_map.keySet().toArray();
				Object lastKey=sub_map_arr[sub_map_arr.length-1];
				Object secondLastKey=null;
				if(sub_map_arr.length>=2){
				secondLastKey=sub_map_arr[sub_map_arr.length-2];
				}
				
				for(Map.Entry<String, String> sm:sub_map.entrySet()){
					if(sm.getKey().equals(lastKey) && sm.getKey().equals("append") && sub_map_arr.length==1){
						builder.replace(0, builder.length(), "");
						builder.append("from " + c_name+" "+sm.getValue());
					}
					else if(sm.getKey().equals(lastKey) && sm.getKey().equals("append") && sub_map_arr.length!=1){
						builder.append(" "+sm.getValue());
					}
					else if(sm.getKey().equals(lastKey) && !sm.getKey().equals("append")){
						builder.append(sm.getKey()+"="+sm.getValue());
					}
					else if(sm.getKey().equals(secondLastKey) && !sm.getKey().equals("append") && isAppend){
						builder.append(sm.getKey()+"="+sm.getValue());
					}
					else if(sm.getKey().equals(secondLastKey) && !sm.getKey().equals("append") && !isAppend){
						builder.append(sm.getKey()+"="+sm.getValue()+" and ");
					}

					else if(!sm.getKey().equals(lastKey) && !sm.getKey().equals("append")){
						builder.append(sm.getKey()+"="+sm.getValue()+" and ");
					}//
					
					
					
				}
				}else{
					builder.replace(0, builder.length(), "");
					builder.append("from " + c_name);
				}
				System.err.println(builder.toString());
				List<T> list = session.createQuery(builder.toString()).list();
				
				map.put(m.getKey(), list);
				list=null;
				
				
			}
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		return map;
	}
	
	@Override
	public <T> boolean validateSingleCol(Map<String, Object> map) {
		
		Session session=null;
		Transaction tx=null;
		List<T> list =null;
		boolean flag = true;
		Map<String, Object> validMap = map;
		if(!validMap.isEmpty()){
			String idCol = (String) validMap.get("idCol");
			long id = (long) validMap.get("id");
			String valCol = (String) validMap.get("valCol");
			String val = (String) validMap.get("val");
			Class<T> cl=(Class<T>)validMap.get("entityClass");
			String statusCol = (String) validMap.get("statusCol");
		
		try {
			session =this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			Criteria cr=session.createCriteria(cl);
			cr.add(Restrictions.ne(statusCol, SouqAmrikaConstants.DELETE_STATUS));
			if (id!=0) {
				cr.add(Restrictions.ne(idCol, id));
			}
			if (null!=val && !("").equalsIgnoreCase(val)) {
				cr.add(Restrictions.eq(valCol, val).ignoreCase());
			}
			list = cr.list();
			if(null!=list && !list.isEmpty())
				flag = false;
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			
			tx.rollback();
		} finally {
			
			session.close();
		}
		}
		return flag;
	}
	
	/*@Override
	public <T> boolean deleteSingleRow(Class<T> c, long id) {
		
		Session session=null;
		Transaction tx=null;
		T t_obj = null;
		boolean flag = false;
		try {
			session =this.getSessionFactory().openSession();
			tx=session.beginTransaction();
			t_obj = (T) session.get(c, id);
			if(null!=t_obj){
				BeanUtils.setProperty(t_obj,"status","");
			}
			
			session.delete(t_obj);
			tx.commit();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			session.close();
		}
		return flag;
	}*/

}
