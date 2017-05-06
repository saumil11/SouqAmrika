package com.codelab.souqamrika.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codelab.souqamrika.dto.PortalForm;
import com.codelab.souqamrika.service.PortalService;
import com.codelab.souqamrika.utility.Configuration;
import com.paypal.core.LoggingManager;
import com.paypal.ipn.IPNMessage;

@Controller
@RequestMapping(value = "IPNListener")
public class IPNListenerController {
	
	@Autowired
	private PortalService portalService;
	
	public PortalService getPortalService() {
		return portalService;
	}

	public void setPortalService(PortalService portalService) {
		this.portalService = portalService;
	}
	
	@RequestMapping(value="/IPN")
	public void requestProduct(@ModelAttribute("portal") PortalForm portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		Map<String,String> mode =  Configuration.getConfig();
		IPNMessage 	ipnlistener = new IPNMessage(request,mode);
		boolean isIpnVerified = ipnlistener.validate();
		String transactionType = ipnlistener.getTransactionType();
		Map<String,String> map = ipnlistener.getIpnMap();
		LoggingManager.info(IPNListenerController.class,"Order Id : "+map.get("custom"));
		LoggingManager.info(IPNListenerController.class, "******* IPN (name:value) pair : "+ map + "  " +
				"######### TransactionType : "+transactionType+"  ======== IPN verified : "+ isIpnVerified);
		Long orderId = 0L;
		if(isIpnVerified){
			orderId = Long.parseLong(map.get("custom"));
			if(orderId!=0){
				this.getPortalService().updatePaymentStatus(orderId);
			}
		}
		
	}

}
