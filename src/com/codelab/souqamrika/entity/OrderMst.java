package com.codelab.souqamrika.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
	private Long created_by;
	private String created_date;
	private Long updated_by;
	private String updated_date;
	private int status;
	
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
	
	

}
