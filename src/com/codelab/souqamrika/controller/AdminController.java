package com.codelab.souqamrika.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dto.AdminCustomDTO;
import com.codelab.souqamrika.dto.PaginationBO;
import com.codelab.souqamrika.entity.ContactDtl;
import com.codelab.souqamrika.entity.CustomerMst;
import com.codelab.souqamrika.entity.OrderMst;
import com.codelab.souqamrika.service.AdminService;
import com.codelab.souqamrika.service.CommonService;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	
	@Autowired
	private CommonService  commonService;

	public CommonService getCommonService() {
		return commonService;
	}

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}
	
	@Autowired
	private AdminService adminService;
	
	
	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	SimpleDateFormat formatWithSlashWithTime = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

	public PaginationBO setPagination(HttpServletRequest request,String listClass,
			String defaulColumn, String statusColumn) throws Exception{
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = Integer.parseInt(request.getParameter("rows"));
		String sidx = request.getParameter("sidx");
		String sord = request.getParameter("sord");
		
		PaginationBO paginationBo = new PaginationBO();
		paginationBo.setPage(page);
		paginationBo.setLimit(limit);
		paginationBo.setSidx(sidx);
		paginationBo.setSord(sord);
		paginationBo.setPageClass(listClass);
		paginationBo.setDefault_column(defaulColumn);
		paginationBo.setStatus_column(statusColumn);
		PaginationBO pagebo = this.getCommonService().setPagination(paginationBo);
		return pagebo;
	}
	
	public PaginationBO setOrderPagination(HttpServletRequest request,String listClass,
			String defaulColumn, String statusColumn) throws Exception{
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = Integer.parseInt(request.getParameter("rows"));
		String sidx = request.getParameter("sidx");
		String sord = request.getParameter("sord");
		
		PaginationBO paginationBo = new PaginationBO();
		paginationBo.setPage(page);
		paginationBo.setLimit(limit);
		paginationBo.setSidx(sidx);
		paginationBo.setSord(sord);
		paginationBo.setPageClass(listClass);
		paginationBo.setDefault_column(defaulColumn);
		paginationBo.setStatus_column(statusColumn);
		PaginationBO pagebo = this.getCommonService().setOrderPagination(paginationBo);
		return pagebo;
	}
	
	
	@RequestMapping(value="/logIn")
	public ModelAndView loadLoginPage() throws Exception{
		return new ModelAndView("logIn");
	}
	
	@RequestMapping(value="/logOut")
	public ModelAndView loadLogout(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session=request.getSession(false);
		session.removeAttribute("user_id");
		session.removeAttribute("user_fname");
		session.removeAttribute("user_lname");
		session.invalidate();
		session.setMaxInactiveInterval(0);
		
		return new ModelAndView("logIn");
	}
	
	@RequestMapping(value="/dashboard")
	public ModelAndView loadDashboard() throws Exception{
		
		return new ModelAndView("dashboard");
		
	}
	
	/*----Start : Customer Management----*/
	
	@RequestMapping(value="/getAllOrders")
	public @ResponseBody String getAllOrders(HttpServletRequest request) throws Exception{
		PaginationBO pagebo = this.setOrderPagination(request, "", "customer_fname", "status");
		
		List<OrderMst> lst =this.getCommonService().getOrderListWithPagination(pagebo);
		String grid = this.getAllOrderGrid(pagebo, lst);
		return grid;
	}
	
	public String getAllOrderGrid(PaginationBO pagebo, List<OrderMst> lst) throws Exception{
		JSONObject jsondata = new JSONObject();
		JSONArray rows = new JSONArray();
		if(null!=pagebo){
			jsondata.put("page", pagebo.getPage());
			jsondata.put("total", pagebo.getTotal_pages());
			jsondata.put("records", pagebo.getRecords());
		}
		if (!lst.isEmpty()) {
			for (OrderMst order : lst) {
				JSONArray listdata = new JSONArray();
				JSONObject row = new JSONObject();
				
				listdata.put("<a onclick='orderDetails("+order.getCustomer_id()+");'>"+order.getCustomer_fname()+" "+order.getCustomer_lname()+"</a>");
//				listdata.put("<a href='"+order.getProduct_url()+"'>"+order.getProduct_url()+"</a>");
				listdata.put("<a href='"+order.getProduct_url()+"' target='_blank' class='btn btn-white btn-sm'><i class='fa fa-external-link'></i> Product URL</a>");
				listdata.put(order.getPayment_status());
				/*if(customer.getStatus() == SouqAmrikaConstants.ACTIVE_STATUS){
					listdata.put(SouqAmrikaConstants.ACTIVE_STATUS_STR);
				}
				else{
					listdata.put(SouqAmrikaConstants.INACTIVE_STATUS_STR);
				}*/
				//listdata.put(actionStr.toString());
				
				row.put("id",order.getCustomer_id());
				row.put("cell", listdata);
				rows.put(row);
				jsondata.put("rows", rows);
			}
		}
		return jsondata.toString();
	}
	
	@RequestMapping(value = "/viewOrder")
	public ModelAndView loadViewOrder(@ModelAttribute("admin") AdminCustomDTO admin, Map<String, Object> model,HttpServletRequest request) throws Exception{
		Long customerId =0L;
		if (null!=request.getParameter ("customerId")) {
			customerId= Long.parseLong(request.getParameter("customerId").toString());
			admin = this.getAdminService().getOrderDtls(customerId);
			model.put("admin", admin);
		}
		return new ModelAndView("viewOrder");
		
	}
	
	/*----End : Customer Management----*/
	
	@RequestMapping(value="/messages")
	public ModelAndView loadMessages() throws Exception{
		
		return new ModelAndView("messages");
		
	}
	
	@RequestMapping(value="/getAllMessages")
	public @ResponseBody String getAllMessages(HttpServletRequest request) throws Exception{
		PaginationBO pagebo = this.setPagination(request, "ContactDtl", "name", "status");
		List<ContactDtl> lst =this.getCommonService().getListWithPagination(pagebo);
		String grid = this.getAllMessageGrid(pagebo, lst);
		return grid;
	}
	
	public String getAllMessageGrid(PaginationBO pagebo, List<ContactDtl> lst) throws Exception{
		JSONObject jsondata = new JSONObject();
		JSONArray rows = new JSONArray();
		if(null!=pagebo){
			jsondata.put("page", pagebo.getPage());
			jsondata.put("total", pagebo.getTotal_pages());
			jsondata.put("records", pagebo.getRecords());
		}
		if (!lst.isEmpty()) {
			for (ContactDtl msg : lst) {
				JSONArray listdata = new JSONArray();
				JSONObject row = new JSONObject();
				
				listdata.put("<a onclick='messageDetails("+msg.getContact_id()+");'>"+msg.getName()+"</a>");
				listdata.put(msg.getSubject());
				row.put("id",msg.getContact_id());
				row.put("cell", listdata);
				rows.put(row);
				jsondata.put("rows", rows);
			}
		}
		return jsondata.toString();
	}
	
	@RequestMapping(value = "/ViewMessage")
	public ModelAndView loadViewMessage(@ModelAttribute("admin") AdminCustomDTO admin, Map<String, Object> model,HttpServletRequest request) throws Exception{
		Long contactId =0L;
		if (null!=request.getParameter ("messageId")) {
			contactId= Long.parseLong(request.getParameter("messageId").toString());
			ContactDtl contactDtl = this.getAdminService().getContactDtls(contactId);
			if(null!=contactDtl){
				admin.setContactDtl(contactDtl);
			}
			model.put("admin", admin);
		}
		return new ModelAndView("viewMessage");
		
	}
	
}
