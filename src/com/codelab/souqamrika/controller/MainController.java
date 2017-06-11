package com.codelab.souqamrika.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import amazon.ImageSet;
import amazon.Item;
import amazon.Item.ImageSets;
import amazon.Items;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dto.ImageShowCase;
import com.codelab.souqamrika.dto.PortalCustomDTO;
import com.codelab.souqamrika.dto.PortalForm;
import com.codelab.souqamrika.entity.ContactDtl;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;
import com.codelab.souqamrika.entity.ProductUrlMst;
import com.codelab.souqamrika.service.AmazonService;
import com.codelab.souqamrika.service.CommonService;
import com.codelab.souqamrika.service.PortalService;
import com.codelab.souqamrika.utility.EncryptionUtil;
import com.codelab.souqamrika.utility.MailUtil;

@Controller
@RequestMapping(value = "portal")
public class MainController {
	
	SimpleDateFormat formatWithSlashWithTime = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
	static ResourceBundle mailbundle = ResourceBundle.getBundle("config/Mail");
	
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
	private AmazonService amazonService;
	
	public AmazonService getAmazonService() {
		return amazonService;
	}

	public void setAmazonService(AmazonService amazonService) {
		this.amazonService = amazonService;
	}
	
	@Autowired
	private EncryptionUtil encryptionUtil;
	
	public EncryptionUtil getEncryptionUtil() {
		return encryptionUtil;
	}

	public void setEncryptionUtil(EncryptionUtil encryptionUtil) {
		this.encryptionUtil = encryptionUtil;
	}

	@RequestMapping(value="/Home")
	public ModelAndView loadHome(Locale locale) throws Exception{
		//System.out.println(locale);
		return new ModelAndView("home");
		
	}
	
	@RequestMapping(value="/setLanguage")
	public void setLanguage(Locale locale, HttpServletRequest request, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.print("SUCCESS");
	}
	
	@RequestMapping(value="/About")
	public ModelAndView loadAboutUs() throws Exception{
		
		return new ModelAndView("about");
		
	}
	
	@RequestMapping(value="/RequestProduct")
	public ModelAndView requestProduct(@ModelAttribute("portal") PortalForm portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		if(null!=request.getParameter("url") && ( null!=request.getParameter("priceRange") 
				|| null!=request.getParameter("isFromAmazon"))){
			String url = request.getParameter("url");
			Double requestPrice = 0.0;
			if(null!=request.getParameter("price")){
				BigInteger price = new BigInteger(request.getParameter("price").toString());
				BigDecimal formattedPrice = new BigDecimal(price, 2);
				Double productPrice = Double.parseDouble(formattedPrice.toString());
				if(productPrice<=50){
					requestPrice = Double.valueOf(3.5);
				}else if(productPrice<=75){
					requestPrice = Double.valueOf(7);
				}else if(productPrice<=100){
					requestPrice = Double.valueOf(10);
				}else if(productPrice<=150){
					requestPrice = Double.valueOf(15);
				}else if(productPrice<=200){
					requestPrice = Double.valueOf(20);
				}else if(productPrice<300){
					requestPrice = Double.valueOf(25);
				}else if(productPrice<=400){
					requestPrice = Double.valueOf(30);
				}else if(productPrice<=500){
					requestPrice = Double.valueOf(35);
				}else {
					requestPrice = Double.valueOf(40);
				}
			}else{
				if(11.0==Double.parseDouble(request.getParameter("priceRange"))){
					requestPrice = Double.valueOf(40);
				}else{
					requestPrice = Double.parseDouble(request.getParameter("priceRange"));
				}
			}
			
			System.out.println(request.getParameter("url"));
			System.out.println(request.getParameter("priceRange"));
			model.put("url", url);
			model.put("requestPrice", requestPrice.toString());
		}
		return new ModelAndView("getCustomerDetails");
	}
	
	@RequestMapping(value="/SaveCustomerDetails")
	public ModelAndView saveCustomerDetails(@ModelAttribute("portal") PortalCustomDTO portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		CustomerMst customerMstDTO = null;
		ProductUrlMst productUrlMstDTO = null;
		OrderMst orderMstDTO = null;
		if(null!=portal.getCustomerMstBO() && null!=portal.getProductUrlMstBO()){
			customerMstDTO = portal.getCustomerMstBO();
			productUrlMstDTO = portal.getProductUrlMstBO();
			customerMstDTO.setCreated_date(formatWithSlashWithTime.format(new Date()));
			customerMstDTO.setCreated_by(1L);
			customerMstDTO.setStatus(SouqAmrikaConstants.ACTIVE_STATUS);
			productUrlMstDTO.setCreated_date(formatWithSlashWithTime.format(new Date()));
			productUrlMstDTO.setCreated_by(1L);
			productUrlMstDTO.setStatus(SouqAmrikaConstants.ACTIVE_STATUS);
			orderMstDTO = portal.getOrderMstBO();
			orderMstDTO.setCreated_date(formatWithSlashWithTime.format(new Date()));
			orderMstDTO.setCreated_by(1L);
			orderMstDTO.setPayment_status(SouqAmrikaConstants.PAYMENT_STATUS_N);
			orderMstDTO.setStatus(SouqAmrikaConstants.ACTIVE_STATUS);
			
			portal.setCustomerMstBO(customerMstDTO);
			portal.setProductUrlMstBO(productUrlMstDTO);
			portal.setOrderMstBO(orderMstDTO);
			
			boolean flag = this.getPortalService().saveCustomerReg(portal);
			/*if(flag){
				MailUtil mailUtil = new MailUtil();
				String msg = mailbundle.getString("mail.orderBody");
				msg = msg.replace("{0}", customerMstDTO.getCustomer_fname());
				mailUtil.sendMail(customerMstDTO.getCustomer_email(), mailbundle.getString("subject.orderSuccess"), msg);
			}*/
			model.put("portal", portal);
			//request.setAttribute("success", "Home.htm");
		}
		return new ModelAndView("checkOut");
	}
	
	@RequestMapping(value="/PaymentCancel")
	public ModelAndView loadPaymentCancel() throws Exception{
		
		return new ModelAndView("paymentCancel");
		
	}
	
	@RequestMapping(value="/PaymentSuccess")
	public ModelAndView loadPaymentSuccess() throws Exception{
		
		return new ModelAndView("paymentSuccess");
		
	}
	
	@RequestMapping(value="/SearchPrpduct")
	public ModelAndView loadSearchPrpduct() throws Exception{
		return new ModelAndView("productSearch");
	}

	@RequestMapping(value="/SearchKeyWord")
	public ModelAndView searchKeyWord(@ModelAttribute("portal") PortalCustomDTO portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		List<Items> resultList = new ArrayList<Items>();
		
		if(null!=request.getParameter("keyWord") && !("").equals(request.getParameter("keyWord"))){
			String keyWord = (String) request.getParameter("keyWord");
			Integer page = 1;
			resultList = this.getAmazonService().getProductSearchLst(keyWord, page);
			model.put("keyWord", keyWord);
			model.put("page", page);
			if(null==resultList){
				model.put("isEmpty", "Y");
			}else{
				model.put("resultList", resultList.get(0).getItem());
			}
		}
		return new ModelAndView("productSearch");
	}
	
	@RequestMapping(value="/SingleProduct")
	public ModelAndView loadSingleProduct(@ModelAttribute("portal") PortalCustomDTO portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		List<Items> resultList = new ArrayList<Items>();
		
		if(null!=request.getParameter("itemId") && !("").equals(request.getParameter("itemId"))){
			String itemId = (String) request.getParameter("itemId");
			
			resultList = this.getAmazonService().getSingleProduct(itemId);
			if(null==resultList || null==resultList.get(0).getItem()){
				model.put("isEmpty", "Y");
			}else{
				Item item = resultList.get(0).getItem().get(0);
				List<ImageShowCase> imageShowCaseLst = new ArrayList<ImageShowCase>();
				for(ImageSets sets : item.getImageSets()){
					for(ImageSet set : sets.getImageSet()){
						ImageShowCase imageShowCaseDto = new ImageShowCase();
						imageShowCaseDto.setSmallImage(set.getSmallImage().getURL());
						imageShowCaseDto.setLargeImage(set.getLargeImage().getURL());
						imageShowCaseDto.setThumbnailImage(set.getThumbnailImage().getURL());
						imageShowCaseLst.add(imageShowCaseDto);
					}
				}
				model.put("item", item);
				model.put("thumbnailImages", imageShowCaseLst);
			}
		}
		return new ModelAndView("singleProduct");
	}
	
	@RequestMapping(value="/NextProductList")
	public ModelAndView loadNextProductList(@ModelAttribute("portal") PortalCustomDTO portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		List<Items> resultList = new ArrayList<Items>();
		
		if(null!=request.getParameter("keyWord") && !("").equals(request.getParameter("keyWord")) &&
				null!=request.getParameter("loadPage") && !("").equals(request.getParameter("loadPage"))){
			
			String keyWord = (String) request.getParameter("keyWord");
			Integer page = Integer.parseInt(request.getParameter("loadPage"));
			resultList = this.getAmazonService().getProductSearchLst(keyWord, page);
			model.put("keyWord", keyWord);
			model.put("page", page);
			if(null==resultList){
				model.put("isEmpty", "Y");
			}else{
				model.put("resultList", resultList.get(0).getItem());
			}
		}
		return new ModelAndView("productSearch");
	}
	
	@RequestMapping(value="/checkOut")
	public ModelAndView loadCustomerDetails() throws Exception{
		return new ModelAndView("checkOut");
	}
	
	@RequestMapping(value="/SaveContactDetails")
	public void saveContactDetails(@ModelAttribute("portal") PortalCustomDTO portal,Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		if(null!=request.getParameter("name") && null!=request.getParameter("email") &&
				null!=request.getParameter("subject") && null!=request.getParameter("message")){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String message = request.getParameter("message");
			
			MailUtil mailUtil = new MailUtil();
			String msg = mailbundle.getString("mail.contactBody");
			msg = msg.replace("{0}", name);
			msg = msg.replace("{1}", email);
			msg = msg.replace("{2}", message);
			
			mailUtil.sendMail(mailbundle.getString("mail.contactEmail"), subject, msg);
			
			ContactDtl contactDtl = new ContactDtl();
			contactDtl.setName(name);
			contactDtl.setEmail(email);
			contactDtl.setSubject(subject);
			contactDtl.setMessage(message);
			String res;
			boolean flag = this.getPortalService().saveContactDtl(contactDtl);
			if (flag) {
				res = "success";
			} else {
				res = "error";
			}
			response.getWriter().println(res);
		}
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value="/viewOrderStatus")
	public ModelAndView loadOrderStatus(@ModelAttribute("portal") PortalForm portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		if(null!=request.getParameter("order") && !("").equalsIgnoreCase(request.getParameter("order"))){
			String encOrderId = request.getParameter("order");
			String orderId = encryptionUtil.decode(encOrderId);
			if(null!=orderId && !("").equals(orderId)){
				System.out.println(orderId);
				PortalCustomDTO portalCustomDTO = this.getCommonService().getOrderDtls(Long.valueOf(orderId));
				if(null!=portalCustomDTO){
					model.put("portal", portalCustomDTO);
				}
			}
		}
		return new ModelAndView("viewOrderDtls");
	}
	
}
