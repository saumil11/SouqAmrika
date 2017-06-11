package com.codelab.souqamrika.controller;

import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codelab.souqamrika.dto.PortalCustomDTO;
import com.codelab.souqamrika.dto.PortalForm;
import com.codelab.souqamrika.service.CommonService;
import com.codelab.souqamrika.service.PortalService;
import com.codelab.souqamrika.utility.Configuration;
import com.codelab.souqamrika.utility.EncryptionUtil;
import com.codelab.souqamrika.utility.MailUtil;
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
	
	@Autowired
	private CommonService commonService;
	
	public CommonService getCommonService() {
		return commonService;
	}

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}
	
	@Autowired
	private EncryptionUtil encryptionUtil;
	
	public EncryptionUtil getEncryptionUtil() {
		return encryptionUtil;
	}

	public void setEncryptionUtil(EncryptionUtil encryptionUtil) {
		this.encryptionUtil = encryptionUtil;
	}
	
	@Autowired
	private MailUtil mailUtil;
	
	public MailUtil getMailUtil() {
		return mailUtil;
	}

	public void setMailUtil(MailUtil mailUtil) {
		this.mailUtil = mailUtil;
	}
	
	static ResourceBundle mailbundle = ResourceBundle.getBundle("config/Mail");

	@SuppressWarnings("static-access")
	@RequestMapping(value="/IPN")
	public void requestProduct(@ModelAttribute("portal") PortalForm portal,Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
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
				
				PortalCustomDTO portalCustomDTO = commonService.getOrderDtls(orderId);
				String order=encryptionUtil.encode(orderId.toString());
				String trackOrderLink = mailbundle.getString("trackYourOrderLink");
				trackOrderLink = trackOrderLink.replace("{0}", order);
				
				String msg = mailbundle.getString("mail.orderBody");
				msg = msg.replace("{0}", portalCustomDTO.getCustomerMstBO().getCustomer_fname());
				msg = msg.replace("{1}", trackOrderLink);
				mailUtil.sendMail(portalCustomDTO.getCustomerMstBO().getCustomer_email(), mailbundle.getString("subject.orderSuccess"), msg);
				
				String adminMsg = mailbundle.getString("mail.newOrderRcvdBody");
				adminMsg = adminMsg.replace("{0}", trackOrderLink);
				mailUtil.sendMail(mailbundle.getString("mail.admin.emailId"), mailbundle.getString("subject.newOrderRcvd"), adminMsg);
			}
		}
	
	}

}
