package com.codelab.souqamrika.dao;

import java.util.List;
import java.util.Map;

public interface GenricDao {

	<T> boolean save(T t)  throws Exception;

	<T> boolean save(List<T> t)  throws Exception; // To save entire list of different objects

	<T> T get(Class<T> c, long id); // get object by passing primary key or id
									// as parameter

	<T> T load(Class<T> c, long id); // load object by passing primary key or id
										// as parameter

	<T> boolean delete(Class<T> c, long id); // for delete object by passing
												// primary key or id

	<T> List<T> getSingleList(Class<T> c, String statuCol);

	<T> Map<Integer, Object> getMultipleList(Map<Integer, T> t,
			Map<Integer, String> t1); // get multiple object list by putting
										// particular class type in map and key
										// is in sequence start from 0

	<T> void delete(List<T> t); // for delete multiple object by passing list

	<T> Boolean savealllist(List<T> t);

	<T> Boolean update(T t);

	<T> Boolean update(List<T> t);

	/*
	 * Master Generic Method get multiple object list by putting particular
	 * class type as key and pass another map as value anotehr map contain bo
	 * column and value as key value pair
	 */
	<T> Map<T, Object> getMultipleListMulArgs(Map<T, Map<String, String>> t);

	<T> boolean validateSingleCol(Map<String, Object> map);
	
	/*<T> boolean deleteSingleRow(Class<T> c, long pID) throws Exception;*/
}
