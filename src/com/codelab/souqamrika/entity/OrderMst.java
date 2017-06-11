package com.codelab.souqamrika.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "order_mst")
public class OrderMst implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5838664548021136210L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long order_id;
	private Long product_url_id;
	private Long customer_id;
	private int order_quantity;
	private String order_dtl;
	private String payment_status;
	private String order_status;
	private Long created_by;
	private String created_date;
	private Long updated_by;
	private String updated_date;
	private int status;
	
	@Transient
	private String product_url;
	@Transient
	private String customer_fname;
	@Transient
	private String customer_lname;
	@Transient
	private String product_req_price;
	
	
	public Long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}
	public Long getProduct_url_id() {
		return product_url_id;
	}
	public void setProduct_url_id(Long product_url_id) {
		this.product_url_id = product_url_id;
	}
	public Long getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Long customer_id) {
		this.customer_id = customer_id;
	}
	public Long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(Long created_by) {
		this.created_by = created_by;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public Long getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(Long updated_by) {
		this.updated_by = updated_by;
	}
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	public String getCustomer_fname() {
		return customer_fname;
	}
	public void setCustomer_fname(String customer_fname) {
		this.customer_fname = customer_fname;
	}
	public String getCustomer_lname() {
		return customer_lname;
	}
	public void setCustomer_lname(String customer_lname) {
		this.customer_lname = customer_lname;
	}
	public String getProduct_req_price() {
		return product_req_price;
	}
	public void setProduct_req_price(String product_req_price) {
		this.product_req_price = product_req_price;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public String getOrder_dtl() {
		return order_dtl;
	}
	public void setOrder_dtl(String order_dtl) {
		this.order_dtl = order_dtl;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
	
	

}
