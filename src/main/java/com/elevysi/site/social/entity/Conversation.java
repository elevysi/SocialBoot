package com.elevysi.site.social.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="conversations")
public class Conversation extends AbstractEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2509126188737481640L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="created", columnDefinition="DAETTIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created;
	
	@Column(name="modified", columnDefinition="DAETTIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modified;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "conversation", fetch=FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	private Set<Message> conversationMessages = new HashSet<Message>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "conversation", fetch=FetchType.EAGER)
	@BatchSize(size=5)
	private Set<Correspondent> correspondents = new HashSet<Correspondent>();

	private String uuid;
	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
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

	public Set<Message> getConversationMessages() {
		return conversationMessages;
	}

	public void setConversationMessages(Set<Message> conversationMessages) {
		this.conversationMessages = conversationMessages;
	}

	public Set<Correspondent> getCorrespondents() {
		return correspondents;
	}

	public void setCorrespondents(Set<Correspondent> correspondents) {
		this.correspondents = correspondents;
	}
	
	@Override
	public boolean equals(Object object){
		if(object == this) return true;
		if(object == null || !(object instanceof Conversation)) return false;
		
		final Conversation conversation = (Conversation)object;
		if(id != null && conversation.getId() != null){
			return id.equals(conversation.getId());
					
		}
		return false;
	}
	
	@Override
	public int hashCode() {
//	    return id.hashCode();
	    return id != null ? id.hashCode() : 0; //https://stackoverflow.com/questions/21535029/what-must-be-hashcode-of-null-objects-in-java
	}
	
	public void addCorrespondent(Correspondent correspondent){
		addCorrespondent(correspondent, true);
	}
	
	public void addCorrespondent(Correspondent correspondent, boolean set){
		if(correspondent != null){
			if(this.getCorrespondents().contains(correspondent)){
				this.getCorrespondents().remove(correspondent);
				this.getCorrespondents().add(correspondent);
			}else{
				getCorrespondents().add(correspondent);
			}
			
			if(set){
				correspondent.setConversation(this, false);
			}
		}
	}
	
	public void removeCorrespondent(Correspondent correspondent){
		getCorrespondents().remove(correspondent);
		correspondent.setConversation(null);
	}
	
	public void addMessage(Message message){
		addMessage(message, true);
	}
	
	public void addMessage(Message message, boolean set){
		if(message != null){
			if(this.getConversationMessages().contains(message)){
				this.getConversationMessages().remove(message);
				this.getConversationMessages().add(message);
			}else{
				getConversationMessages().add(message);
			}
			
			if(set){
				message.setConversation(this, false);
			}
		}
	}
	
	public String generateUUID(){
		 UUID uniqueKey = UUID.randomUUID();   
		 return uniqueKey.toString();
		 
	}
	
	public boolean isConversationContainsProfile(Profile profile){
		
		if (this != null && profile != null){
			if(this.correspondents != null){
				for(Correspondent correspondent : this.correspondents){
					if(correspondent.getOwningCorrespondentProfile().equals(profile)) return true;
				}
			}
		}		
		return false;
	}
	
	

}
