package com.codelab.souqamrika.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dto.PortalCustomDTO;
import com.codelab.souqamrika.dto.PortalForm;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;
import com.codelab.souqamrika.entity.ProductUrlMst;
import com.codelab.souqamrika.service.PortalService;

@Controller
@RequestMapping(value = "portal")
public class MainController {
	
	SimpleDateFormat formatWithSlashWithTime = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
	
	@Autowired
	private PortalService portalService;
	
	public PortalService getPortalService() {
		return portalService;
	}

	public void setPortalService(PortalService portalService) {
		this.portalService = portalService;
	}

	
	@RequestMapping(value="/Home")
	public ModelAndView loadHome() throws Exception{
		
		return new ModelAndView("home");
		
	}
	
	@RequestMapping(value="/RequestProduct")
	public ModelAndView requestProduct(@ModelAttribute("portal") PortalForm portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		if(null!=request.getParameter("url") && null!=request.getParameter("priceRange")){
			String url = request.getParameter("url");
			int requestPrice = Integer.parseInt(request.getParameter("priceRange"));
			System.out.println(request.getParameter("url"));
			System.out.println(request.getParameter("priceRange"));
			//boolean flag = this.getPortalService().saveCustomerReg(customerMstDTO);
			//request.setAttribute("success", "home.htm");
			model.put("url", url);
			model.put("requestPrice", requestPrice);
		}
		return new ModelAndView("getCustomerDetails");
	}
	
	@RequestMapping(value="/SaveCustomerDetails")
	public ModelAndView saveCustomerDetails(@ModelAttribute("portal") PortalCustomDTO portal,Map<String, Object> model,HttpServletRequest request) throws Exception{
		
		CustomerMst customerMstDTO = null;
		ProductUrlMst productUrlMstDTO = null;
		OrderMst orderMstDTO = new OrderMst();
		if(null!=portal.getCustomerMstBO() && null!=portal.getProductUrlMstBO()){
			customerMstDTO = portal.getCustomerMstBO();
			productUrlMstDTO = portal.getProductUrlMstBO();
			customerMstDTO.setCreated_date(formatWithSlashWithTime.format(new Date()));
			customerMstDTO.setCreated_by(1L);
			customerMstDTO.setStatus(SouqAmrikaConstants.ACTIVE_STATUS);
			productUrlMstDTO.setCreated_date(formatWithSlashWithTime.format(new Date()));
			productUrlMstDTO.setCreated_by(1L);
			productUrlMstDTO.setStatus(SouqAmrikaConstants.ACTIVE_STATUS);
			orderMstDTO.setCreated_date(formatWithSlashWithTime.format(new Date()));
			orderMstDTO.setCreated_by(1L);
			orderMstDTO.setStatus(SouqAmrikaConstants.ACTIVE_STATUS);
			
			portal.setCustomerMstBO(customerMstDTO);
			portal.setProductUrlMstBO(productUrlMstDTO);
			portal.setOrderMstBO(orderMstDTO);
			
			boolean flag = this.getPortalService().saveCustomerReg(portal);
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
	
}
