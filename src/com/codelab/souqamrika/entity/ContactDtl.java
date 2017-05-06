package com.codelab.souqamrika.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "contact_dtl")
public class ContactDtl implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 904060956213260278L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long contact_id;
	private String name;
	private String email;
	private String subject;
	private String message;
	private int status;
	
	public Long getContact_id() {
		return contact_id;
	}
	public void setContact_id(Long contact_id) {
		this.contact_id = contact_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	
	
	

}
