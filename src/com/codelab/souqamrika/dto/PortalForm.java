package com.codelab.souqamrika.dto;

import java.io.Serializable;

public class PortalForm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3782432474122894109L;
	
	private PortalCustomDTO portalCustomDTO = new PortalCustomDTO();

	public PortalCustomDTO getPortalCustomDTO() {
		return portalCustomDTO;
	}

	public void setPortalCustomDTO(PortalCustomDTO portalCustomDTO) {
		this.portalCustomDTO = portalCustomDTO;
	}
	

}
