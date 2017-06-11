package com.codelab.souqamrika.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.codelab.souqamrika.entity.OrderMst;
import com.codelab.souqamrika.service.AdminService;
import com.codelab.souqamrika.service.CommonService;
import com.codelab.souqamrika.utility.EncryptionUtil;

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
	
	/*----Start : All Orders ----*/
	
	@RequestMapping(value="/getAllOrders")
	public @ResponseBody String getAllOrders(HttpServletRequest request) throws Exception{
		PaginationBO pagebo = this.setOrderPagination(request, "", "o.created_date", "status");
		
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
				StringBuilder actionStr = new StringBuilder("<a title='Save order' style='font-size: 15px; padding-right: 10px;' onclick='saveOrder("+order.getOrder_id()+");'><span class='fa fa-check-square-o'></span></a>");
				actionStr.append("<a title='Delete order' style='font-size: 15px;' onclick='deleteOrder("+order.getOrder_id()+");'><span class='fa fa-trash'></span></a>");
				
				JSONArray listdata = new JSONArray();
				JSONObject row = new JSONObject();
				
				listdata.put("<a onclick='orderDetails("+order.getOrder_id()+");'>"+order.getCustomer_fname()+" "+order.getCustomer_lname()+"</a>");
//				listdata.put("<a href='"+order.getProduct_url()+"'>"+order.getProduct_url()+"</a>");
				listdata.put("<a href='"+order.getProduct_url()+"' target='_blank' class='btn btn-white btn-sm'><i class='fa fa-external-link'></i> Product URL</a>");
				listdata.put(order.getPayment_status());
				listdata.put(actionStr.toString());
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
		Long orderId =0L;
		if (null!=request.getParameter ("orderId")) {
			orderId= Long.parseLong(request.getParameter("orderId").toString());
			admin = this.getAdminService().getOrderDtls(orderId);
			model.put("admin", admin);
		}
		return new ModelAndView("viewOrder");
		
	}
	
	/*----End : All Orders ----*/
	
	/*----Start : Saved Orders ----*/
	
	@RequestMapping(value="/orders")
	public ModelAndView loadOrders() throws Exception{
		
		return new ModelAndView("favOrders");
		
	}
	@RequestMapping(value="/getAllFavOrders")
	public @ResponseBody String getAllFavOrders(HttpServletRequest request) throws Exception{
		PaginationBO pagebo = this.setOrderPagination(request, "FAVORDERS", "o.created_date", "status");
		
		List<OrderMst> lst =this.getCommonService().getOrderListWithPagination(pagebo);
		String grid = this.getAllFavOrderGrid(pagebo, lst);
		return grid;
	}
	
	public String getAllFavOrderGrid(PaginationBO pagebo, List<OrderMst> lst) throws Exception{
		JSONObject jsondata = new JSONObject();
		JSONArray rows = new JSONArray();
		if(null!=pagebo){
			jsondata.put("page", pagebo.getPage());
			jsondata.put("total", pagebo.getTotal_pages());
			jsondata.put("records", pagebo.getRecords());
		}
		if (!lst.isEmpty()) {
			for (OrderMst order : lst) {
				/*StringBuilder actionStr = new StringBuilder("<a title='Save order' style='font-size: 15px; padding-right: 10px;' onclick='saveOrder("+order.getOrder_id()+");'><span class='fa fa-check-square-o'></span></a>");
				actionStr.append("<a title='Delete order' style='font-size: 15px;' onclick='deleteOrder("+order.getOrder_id()+");'><span class='fa fa-trash'></span></a>");
				*/
				JSONArray listdata = new JSONArray();
				JSONObject row = new JSONObject();
				
				listdata.put("<a onclick='orderDetails("+order.getOrder_id()+");'>"+order.getCustomer_fname()+" "+order.getCustomer_lname()+"</a>");
//				listdata.put("<a href='"+order.getProduct_url()+"'>"+order.getProduct_url()+"</a>");
				listdata.put("<a href='"+order.getProduct_url()+"' target='_blank' class='btn btn-white btn-sm'><i class='fa fa-external-link'></i> Product URL</a>");
				listdata.put(order.getPayment_status());
				//listdata.put(actionStr.toString());
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
	
	/*----End : Saved Orders ----*/
	
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
	
	@RequestMapping(value = "/deleteOrder")
	public void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long orderId =0;
		if (null != request.getParameter("order_id")) {
			orderId = Long.parseLong(request.getParameter("order_id").toString());
			String buffer;
			boolean flag = this.getAdminService().updateOrder(orderId,SouqAmrikaConstants.DELETE_STATUS);
			if (flag) {
				buffer = "Correct";
			} else {
				buffer = "Incorrect";
			}
			response.getWriter().println(buffer);
		}
	}
	
	@RequestMapping(value = "/saveOrder")
	public void saveOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long orderId =0;
		if (null != request.getParameter("order_id")) {
			orderId = Long.parseLong(request.getParameter("order_id").toString());
			String buffer;
			boolean flag = this.getAdminService().updateOrder(orderId,SouqAmrikaConstants.FAVOURIT_STATUS);
			if (flag) {
				buffer = "Correct";
			} else {
				buffer = "Incorrect";
			}
			response.getWriter().println(buffer);
		}
	}
	
	@RequestMapping(value = "/updateOrderStatus")
	public void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Long orderId = 0L;
		String orderStatus = null;
		boolean flag = false;
		
		if (null != request.getParameter("order_id") && null != request.getParameter("order_status")) {
			orderId = Long.parseLong(request.getParameter("order_id").toString());
			orderStatus = request.getParameter("order_status").toString();
			String buffer;
			OrderMst orderMst = this.getAdminService().get(OrderMst.class,orderId);
			
			if(null!=orderMst){
				orderMst.setOrder_status(orderStatus);
				orderMst.setUpdated_by(1L);
				orderMst.setUpdated_date(formatWithSlashWithTime.format(new Date()));
				flag = this.getAdminService().update(orderMst);
			}
			
			if (flag) {
				buffer = "Correct";
			} else {
				buffer = "Incorrect";
			}
			response.getWriter().println(buffer);
		}
	}
	
	/*@SuppressWarnings("static-access")
	@RequestMapping(value = "/enc")
	public void checkEnc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//Long orderId = 10L;
		String id = request.getParameter("id");
		EncryptionUtil encryptionUtil = new EncryptionUtil();
		System.out.println(encryptionUtil.encode(id));
		String encdOrder = encryptionUtil.encode(id);
		System.out.println(encryptionUtil.decode(encdOrder));
		
	}*/
	
}
