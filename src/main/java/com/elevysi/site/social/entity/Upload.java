package com.elevysi.site.social.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.FilterDefs;
import org.hibernate.annotations.Where;

//Hibernate pp337 Filtering Data
@Entity
@Table(name = "uploads")
@FilterDefs({
	@FilterDef(name="uploadOwnerFilter", defaultCondition="link_table = 'profiles'"),
	@FilterDef(
				name="itemTableIs",
				parameters = {
					@org.hibernate.annotations.ParamDef(name="link_tableValue", type = "java.lang.String"),
					@org.hibernate.annotations.ParamDef(name="displayValue", type = "int")
				}
			)
})

public class Upload extends AbstractEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8860852816106784878L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	
	private String title;
	private String description;
	private String filename;
	private Integer filesize;
	private String filemine;
	private String path;
	private String file_identificator;
	private String pathOriginal;
	
	@Column(name = "created", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created;
	
	@Column(name = "modified", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modified;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name="link_id", referencedColumnName="id", nullable = false, insertable = false, updatable = false)
	})
	@Where(clause="link_table='profilePicture'")
	private Profile owningProfilePicture;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name="link_id", referencedColumnName="id", nullable = false, insertable = false, updatable = false)
	})
	@Where(clause="link_table='coverUpload'")
	private Profile owningCoverUpload;
	
	private String url;
	private String keyIdentification;
	private String uuid;
	
	@Column(columnDefinition="INT(1)")
	private boolean display;
	
	@Column(name="link_table")
	private String linkTable;
	
	@Column(name="link_id")
	private Integer linkId;
	
	@Column(name="profile_id")
	private Integer profileID;
	
	public Integer getProfileID() {
		return profileID;
	}

	public void setProfileID(Integer profileID) {
		this.profileID = profileID;
	}
	
	public String getPathOriginal() {
		return pathOriginal;
	}

	public void setPathOriginal(String pathOriginal) {
		this.pathOriginal = pathOriginal;
	}

	public String getLinkTable() {
		return linkTable;
	}

	public void setLinkTable(String linkTable) {
		this.linkTable = linkTable;
	}

	public Integer getLinkId() {
		return linkId;
	}

	public void setLinkId(Integer linkId) {
		this.linkId = linkId;
	}

	private String altText;
	

	public String getAltText() {
		return altText;
	}

	public void setAltText(String altText) {
		this.altText = altText;
	}


	public String getKeyIdentification() {
		return keyIdentification;
	}

	public void setKeyIdentification(String keyIdentification) {
		this.keyIdentification = keyIdentification;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	public boolean isDisplay() {
		return display;
	}

	public void setDisplay(boolean display) {
		this.display = display;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Profile getOwningProfilePicture() {
		return owningProfilePicture;
	}

	public void setOwningProfilePicture(Profile owningProfilePicture) {
		this.owningProfilePicture = owningProfilePicture;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Integer getFilesize() {
		return filesize;
	}

	public void setFilesize(Integer filesize) {
		this.filesize = filesize;
	}

	public String getFilemine() {
		return filemine;
	}

	public void setFilemine(String filemine) {
		this.filemine = filemine;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFile_identificator() {
		return file_identificator;
	}

	public void setFile_identificator(String file_identificator) {
		this.file_identificator = file_identificator;
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
	
	@Override
	public boolean equals(Object object) {
        if (object == this)
            return true;
        if ((object == null) || !(object instanceof Upload))
            return false;
 
        final Upload upload = (Upload)object;
 
        if (id != null && upload.getId() != null) {
            return id.equals(upload.getId());
        }
        return false;
    }
	
	/**
	 * https://www.mkyong.com/java/java-how-to-overrides-equals-and-hashcode/
	 * http://www.baeldung.com/java-hashcode
	 */
	@Override
	public int hashCode() {
//	    return id.hashCode();
	    return id != null ? id.hashCode() : 0; //https://stackoverflow.com/questions/21535029/what-must-be-hashcode-of-null-objects-in-java
	}

	public Profile getOwningCoverUpload() {
		return owningCoverUpload;
	}

	public void setOwningCoverUpload(Profile owningCoverUpload) {
		this.owningCoverUpload = owningCoverUpload;
	}
	

}
