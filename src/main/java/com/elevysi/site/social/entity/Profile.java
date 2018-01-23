package com.elevysi.site.social.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.FilterJoinTable;
import org.hibernate.annotations.Where;
import org.hibernate.annotations.WhereJoinTable;

@Entity
@Table(name = "profiles")
@FilterDef(name="userProfileType", defaultCondition="profile_type_id = 1")
public class Profile implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3429508204763909425L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	private String title;
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	@Column(name="profile_type_id", nullable = false, insertable = false, updatable = false)
	private Integer profile_type_id;
	
	public Integer getProfile_type_id() {
		return profile_type_id;
	}


	public void setProfile_type_id(Integer profile_type_id) {
		this.profile_type_id = profile_type_id;
	}


	@Column(name = "created", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created;
	
	@Column(name = "modified", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modified;
	
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "profile", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	private Set<Publication> publications = new HashSet<Publication>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="profile_friends",
        joinColumns = {@JoinColumn(name="profile_id", referencedColumnName="id")},
        inverseJoinColumns = {@JoinColumn(name="friend_id", referencedColumnName="id")}
    )
	@Fetch(FetchMode.SUBSELECT)
	private Set<Profile> friends = new HashSet<Profile>();
	
	@ManyToMany(mappedBy = "friends")
	@Fetch(FetchMode.SUBSELECT)
    private Set<Profile> reverse_friends;
	
	@OneToMany(cascade = CascadeType.MERGE, mappedBy = "owningProfilePicture", fetch=FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	private Set<Avatar> profilePicture = new HashSet<Avatar>();
	
	
	public Set<Avatar> getProfilePicture() {
		return profilePicture;
	}


	public void setProfilePicture(Set<Avatar> profilePicture) {
		this.profilePicture = profilePicture;
	}


	@OneToMany(cascade = CascadeType.ALL, mappedBy = "uploadOwner", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	private Set<Avatar> uploads;
	
	
//	@OneToOne(mappedBy="owningCorrespondentProfile",fetch=FetchType.LAZY)
//	private Correspondent correspondent;
//	
//	public Correspondent getCorrespondant() {
//		return correspondent;
//	}
//
//
//	public void setCorrespondant(Correspondent correspondent) {
//		this.correspondent = correspondent;
//	}



	public Set<Avatar> getUploads() {
		return uploads;
	}


	public void setUploads(Set<Avatar> uploads) {
		this.uploads = uploads;
	}


	private String description;
	
	
	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="publication_id")
	private Publication publication;


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Set<Profile> getReverse_friends() {
		return reverse_friends;
	}


	public void setReverse_friends(Set<Profile> reverse_friends) {
		this.reverse_friends = reverse_friends;
	}


	@OneToMany(cascade = CascadeType.ALL, mappedBy = "profile")
	private Set<Message> sentMessages = new HashSet<Message>();
	
//	@ManyToMany(mappedBy = "messageRecipeints", fetch = FetchType.LAZY)
//	private Set<Message> recievedMessages = new HashSet<Message>();
	
		
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "profile_type_id", referencedColumnName = "id")
	private ProfileType profileType;
	
	




	public Set<Message> getSentMessages() {
		return sentMessages;
	}


	public void setSentMessages(Set<Message> sentMessages) {
		this.sentMessages = sentMessages;
	}


//	public Set<Message> getRecievedMessages() {
//		return recievedMessages;
//	}


//	public void setRecievedMessages(Set<Message> recievedMessages) {
//		this.recievedMessages = recievedMessages;
//	}


	public ProfileType getProfileType() {
		return profileType;
	}


	public void setProfileType(ProfileType profileType) {
		this.profileType = profileType;
	}


	public Set<Profile> getFriends() {
		return friends;
	}


	public void setFriends(Set<Profile> friends) {
		this.friends = friends;
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



	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public boolean equals(Object object) {
        if (object == this)
            return true;
        if ((object == null) || !(object instanceof Profile))
            return false;
 
        final Profile profile = (Profile)object;
 
        if (id != null && profile.getId() != null) {
            return id.equals(profile.getId());
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
	
	
	public void addFriend(Profile friend){
		if(friend != null){
			
			if(this.getFriends().contains(friend)){
				this.getFriends().remove(friend);
				this.getFriends().add(friend);
				
			}else{
				getFriends().add(friend);
			}
			
			
		}
	}
	
	public void removeFriend(Profile friend){
		getFriends().remove(friend);
	}


	public Publication getPublication() {
		return publication;
	}


	public void setPublication(Publication publication) {
		this.publication = publication;
	}
	
}