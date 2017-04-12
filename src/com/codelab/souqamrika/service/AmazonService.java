package com.codelab.souqamrika.service;

import java.util.List;

import amazon.Items;

public interface AmazonService {

	List<Items> getProductSearchLst(String keyWord) throws Exception;
}
