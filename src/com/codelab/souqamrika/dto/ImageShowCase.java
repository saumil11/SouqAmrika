package com.codelab.souqamrika.dto;

import java.io.Serializable;

public class ImageShowCase implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5860938444014274773L;

	private String smallImage;
	private String largeImage;
	private String thumbnailImage;
	
	public String getSmallImage() {
		return smallImage;
	}
	public void setSmallImage(String smallImage) {
		this.smallImage = smallImage;
	}
	public String getLargeImage() {
		return largeImage;
	}
	public void setLargeImage(String largeImage) {
		this.largeImage = largeImage;
	}
	public String getThumbnailImage() {
		return thumbnailImage;
	}
	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	
	
	
}
