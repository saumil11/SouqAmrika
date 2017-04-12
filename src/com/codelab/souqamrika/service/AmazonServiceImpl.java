package com.codelab.souqamrika.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import amazon.AWSECommerceService;
import amazon.AWSECommerceServicePortType;
import amazon.ItemSearch;
import amazon.ItemSearchRequest;
import amazon.ItemSearchResponse;
import amazon.Items;

import com.codelab.souqamrika.utility.AwsHandlerResolver;

@Service("AmazonService")
@Transactional
public class AmazonServiceImpl implements AmazonService{
	
	Logger log = Logger.getLogger(AmazonServiceImpl.class);

	@Override
	public List<Items> getProductSearchLst(String keyWord) throws Exception {

		List<Items> itemList = new ArrayList<Items>();
		final String accessId = "AKIAJAIQX43OPRQ4MVFQ";
	    final String secretKey = "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";
	    
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
	        itemSearch.setAssociateTag("souqamrika25-20");
	        itemSearch.getRequest().add(request); 
	        ItemSearchResponse response = port.itemSearch(itemSearch);                
	        itemList = response.getItems();                              
	       /* int i = 1;
	        for (Items next : itemsList)
	           for (Item item : next.getItem()){
	        	   System.out.println("Item : "+ String.format("%2d: ", i++));
	        	   System.out.println(item.getItemAttributes().getTitle());
	        	   System.out.println(item.getItemAttributes().getManufacturer());
	        	   System.out.println(item.getItemAttributes().getListPrice().getFormattedPrice());
	        	   System.out.println(item.getLargeImage().getURL());
	           }
	        */
	        /*if(null==itemList || 0>itemList.size()){
		    	log.error("No result found");
		    	throw new IllegalStateException();
		    }*/
	        if(null!=itemList && 0<itemList.size()){
	        	return itemList;
	        }else{
	        	return null;
	        }
	            
	    }

	
}
