package com.codelab.souqamrika.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import amazon.AWSECommerceService;
import amazon.AWSECommerceServicePortType;
import amazon.ItemLookup;
import amazon.ItemLookupRequest;
import amazon.ItemLookupResponse;
import amazon.ItemSearch;
import amazon.ItemSearchRequest;
import amazon.ItemSearchResponse;
import amazon.Items;

import com.codelab.souqamrika.utility.AwsHandlerResolver;

@Service("AmazonService")
@Transactional
public class AmazonServiceImpl implements AmazonService{
	
	Logger log = Logger.getLogger(AmazonServiceImpl.class);
	final String accessId = "AKIAJAIQX43OPRQ4MVFQ";
    final String secretKey = "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";
    final String associateTag = "souqamrika25-20";
	
    @Override
	public List<Items> getProductSearchLst(String keyWord) throws Exception {

		List<Items> itemList = new ArrayList<Items>();
	    
	    if(null==keyWord || "".equals(keyWord)){
	    	log.error("KeyWord not found.");
	    	throw new IllegalArgumentException();
	    }
	    
	    AWSECommerceService service = new AWSECommerceService();                  
	    service.setHandlerResolver(new AwsHandlerResolver(secretKey));            
	    AWSECommerceServicePortType port = service.getAWSECommerceServicePort();  
	    ItemSearchRequest request = new ItemSearchRequest();                      
	    request.setSearchIndex("All");
	    request.setKeywords(keyWord);
	        //request.setItemPage(BigInteger.valueOf(11));
	        request.getResponseGroup().add("ItemAttributes");
	        request.getResponseGroup().add("Images");
	        ItemSearch itemSearch= new ItemSearch();                                  
	        itemSearch.setAWSAccessKeyId(accessId);
	        itemSearch.setAssociateTag(associateTag);
	        itemSearch.getRequest().add(request); 
	        ItemSearchResponse response = port.itemSearch(itemSearch);                
	        itemList = response.getItems();                              
	        if(null!=itemList && 0<itemList.size()){
	        	return itemList;
	        }else{
	        	return null;
	        }
	            
	    }
	
    @Override
	public List<Items> getSingleProduct(String itemId) throws Exception {

		List<Items> itemList = new ArrayList<Items>();

		if(null==itemId || "".equals(itemId)){
	    	log.error("ItemId not found.");
	    	throw new IllegalArgumentException();
	    }
	    
	    AWSECommerceService service = new AWSECommerceService();                  
	    service.setHandlerResolver(new AwsHandlerResolver(secretKey));            
	    AWSECommerceServicePortType port = service.getAWSECommerceServicePort();
	    ItemLookupRequest request = new ItemLookupRequest();
	    request.setIdType("ASIN");
	    request.getItemId().add(itemId);
	    request.getResponseGroup().add("ItemAttributes");
	    request.getResponseGroup().add("Images");
	    ItemLookup itemLookup = new ItemLookup();
	    itemLookup.setAWSAccessKeyId(accessId);
	    itemLookup.setAssociateTag(associateTag);
	    itemLookup.getRequest().add(request); 
	    ItemLookupResponse response = port.itemLookup(itemLookup);             
	    itemList = response.getItems();                            
	    if(null!=itemList && 0<itemList.size()){
	    	return itemList;
	    }else{
	      	return null;
	    }
	            
	}

	
}
