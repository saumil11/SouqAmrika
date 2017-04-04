package com.codelab.souqamrika.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.codelab.souqamrika.constants.SouqAmrikaConstants;
import com.codelab.souqamrika.dto.PaginationBO;
import com.codelab.souqamrika.entity.CustomerMst;
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
	
	@RequestMapping(value="/allCustomers")
	public ModelAndView loadAllCustomers() throws Exception{
		return new ModelAndView("allCustomers");
	}
	
	@RequestMapping(value="/getAllCustomers")
	public @ResponseBody String getAllCustomers(HttpServletRequest request) throws Exception{
		PaginationBO pagebo = this.setPagination(request, "CustomerMst", "customer_fname", "status");
		
		List<CustomerMst> lst =this.getCommonService().getListWithPagination(pagebo);
		String grid = this.getAllCustomerGrid(pagebo, lst);
		return grid;
	}
	
	public String getAllCustomerGrid(PaginationBO pagebo, List<CustomerMst> lst) throws Exception{
		JSONObject jsondata = new JSONObject();
		JSONArray rows = new JSONArray();
		if(null!=pagebo){
			jsondata.put("page", pagebo.getPage());
			jsondata.put("total", pagebo.getTotal_pages());
			jsondata.put("records", pagebo.getRecords());
		}
		if (!lst.isEmpty()) {
			for (CustomerMst customer : lst) {
				StringBuilder actionStr = new StringBuilder("<a title='Edit row' style='font-size: 15px; padding-right: 10px;' id='jEditButton_"+customer.getCustomer_id()+"' onclick='editForm("+customer.getCustomer_id()+");'><span class='fa fa-pencil'></span></a>");
				actionStr.append("<a title='Delete row' style='font-size: 15px;' id='jDeleteButton_"+customer.getCustomer_id()+"' onclick='deleteRow("+customer.getCustomer_id()+");'><span class='fa fa-trash'></span></a>");
				JSONArray listdata = new JSONArray();
				JSONObject row = new JSONObject();
				
				listdata.put("<a onclick='userDetails("+customer.getCustomer_id()+");'>"+customer.getCustomer_fname()+" "+customer.getCustomer_lname()+"</a>");
				listdata.put(customer.getCustomer_email());
				if(customer.getStatus() == SouqAmrikaConstants.ACTIVE_STATUS){
					listdata.put(SouqAmrikaConstants.ACTIVE_STATUS_STR);
				}
				else{
					listdata.put(SouqAmrikaConstants.INACTIVE_STATUS_STR);
				}
				listdata.put(actionStr.toString());
				
				row.put("id",customer.getCustomer_id());
				row.put("cell", listdata);
				rows.put(row);
				jsondata.put("rows", rows);
			}
		}
		return jsondata.toString();
	}
	
	@RequestMapping(value = "/deleteCustomer")
	public void deleteCustomer(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		long custID =0;
		if (null != request.getParameter("customer_id")) {
			custID = Long.parseLong(request.getParameter("customer_id").toString());
			String buffer;
			boolean flag = this.getAdminService().deleteCustomer(custID);
			if (flag) {
				buffer = "Correct";
			} else {
				buffer = "Incorrect";
			}
			response.getWriter().println(buffer);
		}
	}
	
	/*----End : Customer Management----*/
	
}
