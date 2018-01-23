package com.elevysi.site.social.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="messages")
public class Message implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -123426912495655199L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "created", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created;
	
	@Column(name = "modified", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modified;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sender", referencedColumnName = "id")
	private Profile profile;
	
//	@ManyToMany(fetch = FetchType.EAGER)
//    @JoinTable(name="message_recipients",
//        joinColumns = {@JoinColumn(name="message_id", referencedColumnName="id")},
//        inverseJoinColumns = {@JoinColumn(name="profile_id", referencedColumnName="id")}
//    )
//	private Set<Profile> messageRecipeints = new HashSet<Profile>();
	
	private String message;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="conversation_id", referencedColumnName="id")
	private Conversation conversation;

	public Conversation getConversation() {
		return conversation;
	}

	public void setConversation(Conversation conversation) {
		this.conversation = conversation;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public boolean equals(Object object){
		if(object == this) return true;
		if(object == null || !(object instanceof Message)) return false;
		final Message message = (Message)object;
		if(id != null && message.getId()!= null) return id.equals(message.getId());
		
		return false;
	}

	public void setConversation(Conversation conversation, boolean add) {
		this.conversation = conversation;
		if(conversation != null && add){
			conversation.addMessage(this, false);
		}
		
	}

}
