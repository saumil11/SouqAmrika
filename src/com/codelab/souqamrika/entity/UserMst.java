package com.codelab.souqamrika.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user_mst")
public class UserMst{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long user_id;
	private int user_type;
	private long user_role_id;
	private String user_fname;
	private String user_lname;
	private String user_email;
	private String user_photo;
	private long user_parent_id;
	private long user_dept_id;
	private String user_name;
	private String user_password;
	private int status;
	private String user_recovery_token;
	private long created_by;
	private String created_date;
	private String modified_date;
	private String last_login_date;
	
	@Transient
	private String user_RoleName;
	@Transient
	private String fullName;
	@Transient
	private String userDeptName;
	@Transient
	List<String> parentUserIdList;
	
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public long getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(long user_role_id) {
		this.user_role_id = user_role_id;
	}
	public String getUser_fname() {
		return user_fname;
	}
	public void setUser_fname(String user_fname) {
		this.user_fname = user_fname;
	}
	public String getUser_lname() {
		return user_lname;
	}
	public void setUser_lname(String user_lname) {
		this.user_lname = user_lname;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	public long getUser_parent_id() {
		return user_parent_id;
	}
	public void setUser_parent_id(long user_parent_id) {
		this.user_parent_id = user_parent_id;
	}
	public long getUser_dept_id() {
		return user_dept_id;
	}
	public void setUser_dept_id(long user_dept_id) {
		this.user_dept_id = user_dept_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUser_recovery_token() {
		return user_recovery_token;
	}
	public void setUser_recovery_token(String user_recovery_token) {
		this.user_recovery_token = user_recovery_token;
	}
	public long getCreated_by() {
		return created_by;
	}
	public void setCreated_by(long created_by) {
		this.created_by = created_by;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getModified_date() {
		return modified_date;
	}
	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	public String getUser_RoleName() {
		return user_RoleName;
	}
	public void setUser_RoleName(String user_RoleName) {
		this.user_RoleName = user_RoleName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserDeptName() {
		return userDeptName;
	}
	public void setUserDeptName(String userDeptName) {
		this.userDeptName = userDeptName;
	}
	public List<String> getParentUserIdList() {
		return parentUserIdList;
	}
	public void setParentUserIdList(List<String> parentUserIdList) {
		this.parentUserIdList = parentUserIdList;
	}
	
	
}