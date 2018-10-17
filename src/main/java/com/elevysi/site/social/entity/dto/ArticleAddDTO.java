package com.elevysi.site.social.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class ArticleAddDTO {
	
	
	private String name;
	private String description;
	private Double price;
	
	
	@JsonIgnore
	private Date created = new Date();
	
	@JsonIgnore
	private Date modified = new Date();


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getCreated() {
		return created;
	}

	public Date getModified() {
		return modified;
	}

}