package com.codelab.souqamrika.service;

import java.util.List;

import amazon.Items;

public interface AmazonService {

	List<Items> getProductSearchLst(String keyWord, Integer page) throws Exception;

	List<Items> getSingleProduct(String itemId) throws Exception;
}
