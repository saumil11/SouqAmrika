package com.codelab.souqamrika.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "customer_mst")
public class CustomerMst implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6754982610116157029L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long customer_id;
	private String customer_email;
	private String customer_mobileNo;
	private String customer_fname;
	private String customer_lname;
	private String customer_uname;
	private String customer_pass;
	private String customer_photo;
	private String customer_address;
	private String customer_city;
	private String customer_state;
	private String customer_postalcode;
	private Long created_by;
	private String created_date;
	private Long updated_by;
	private String updated_date;
	private String last_login_date;
	private String recovery_token;
	private int status;
	
	public Long getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Long customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_mobileNo() {
		return customer_mobileNo;
	}
	public void setCustomer_mobileNo(String customer_mobileNo) {
		this.customer_mobileNo = customer_mobileNo;
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
	public String getCustomer_uname() {
		return customer_uname;
	}
	public void setCustomer_uname(String customer_uname) {
		this.customer_uname = customer_uname;
	}
	public String getCustomer_pass() {
		return customer_pass;
	}
	public void setCustomer_pass(String customer_pass) {
		this.customer_pass = customer_pass;
	}
	public String getCustomer_photo() {
		return customer_photo;
	}
	public void setCustomer_photo(String customer_photo) {
		this.customer_photo = customer_photo;
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
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	public String getRecovery_token() {
		return recovery_token;
	}
	public void setRecovery_token(String recovery_token) {
		this.recovery_token = recovery_token;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_city() {
		return customer_city;
	}
	public void setCustomer_city(String customer_city) {
		this.customer_city = customer_city;
	}
	public String getCustomer_state() {
		return customer_state;
	}
	public void setCustomer_state(String customer_state) {
		this.customer_state = customer_state;
	}
	public String getCustomer_postalcode() {
		return customer_postalcode;
	}
	public void setCustomer_postalcode(String customer_postalcode) {
		this.customer_postalcode = customer_postalcode;
	}
	
	

}
