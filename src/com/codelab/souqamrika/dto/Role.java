package com.codelab.souqamrika.dto;

import java.util.Set;

import org.springframework.security.core.GrantedAuthority;

public class Role implements GrantedAuthority {

	private static final long serialVersionUID = 1L;
    private String name;
 
    private Set<String> privileges;
    
    private Set<String> modules;
    
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
	
	@Override
	public String getAuthority() {
		return this.name;
	}

	public Set<String> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(Set<String> privileges) {
		this.privileges = privileges;
	}

	public Set<String> getModules() {
		return modules;
	}

	public void setModules(Set<String> modules) {
		this.modules = modules;
	}

	

}
