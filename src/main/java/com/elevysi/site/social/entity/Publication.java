package com.elevysi.site.social.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="publications")
public class Publication {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "profile_id", referencedColumnName = "id")
	private Profile profile;
	
	@Column(name="created", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created;
	
	@Column(name="modified", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modified;
	
	@Column(name="public_publication", columnDefinition="INT(1)")
	private Boolean publicPublication;
	
	@Column(name="featured", columnDefinition="INT(1)")
	private Boolean featured;
	
	@Column(name="friendly_url")
	private String friendlyUrl;
	

	public String getFriendlyUrl() {
		return friendlyUrl;
	}

	public void setFriendlyUrl(String friendlyUrl) {
		this.friendlyUrl = friendlyUrl;
	}

	public Boolean getFeatured() {
		return featured;
	}

	public void setFeatured(Boolean featured) {
		this.featured = featured;
	}

	public Boolean getPublicPublication() {
		return publicPublication;
	}

	public void setPublicPublication(Boolean publicPublication) {
		this.publicPublication = publicPublication;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}
	
	public Publication(Profile profile, Date created, Date modified, Boolean publicPublication){
		this.profile = profile;
		this.created  = created;
		this.modified = modified;
		this.publicPublication = publicPublication;
	}
	
	public Publication(){
		
	}
	
}
