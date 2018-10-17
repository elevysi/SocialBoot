package com.elevysi.site.social.entity;

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.FilterDef;


@Entity
@Table(name = "profiles")
@FilterDef(name="userProfileType", defaultCondition="profile_type_id = 1")
public class Profile extends AbstractEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3429508204763909425L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	private String title;
	
	@Column(name="profile_type_id", nullable = false, insertable = false, updatable = false)
	private Integer profile_type_id;
	
	@Column(name = "created", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created;
	
	@Column(name = "modified", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modified;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "profile_type_id", referencedColumnName = "id")
	private ProfileType profileType;
	
	@OneToMany(cascade = CascadeType.MERGE, mappedBy = "owningProfilePicture", fetch=FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	@org.hibernate.annotations.Filter(name="itemTableIs", condition="link_table=:link_tableValue and display=:displayValue")
	private Set<Upload> profilePicture = new HashSet<Upload>();
	
	
	@OneToMany(cascade = CascadeType.MERGE, mappedBy = "owningCoverUpload", fetch=FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	@org.hibernate.annotations.Filter(name="itemTableIs", condition="link_table=:link_tableValue and display=:displayValue")
	private Set<Upload> coverUploads = new HashSet<Upload>();

	@Column(name = "user_id")
	private long userID;
	
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
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public Integer getProfile_type_id() {
		return profile_type_id;
	}
	
	public void setProfile_type_id(Integer profile_type_id) {
		this.profile_type_id = profile_type_id;
	}
	
	public long getUserID() {
		return userID;
	}


	public void setUserID(long userID) {
		this.userID = userID;
	}

	private String description;
	
	
	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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
	
	public ProfileType getProfileType() {
		return profileType;
	}

	public void setProfileType(ProfileType profileType) {
		this.profileType = profileType;
	}

	public Set<Upload> getProfilePicture() {
		return profilePicture;
	}


	public void setProfilePicture(Set<Upload> profilePicture) {
		this.profilePicture = profilePicture;
	}

	public Set<Upload> getCoverUploads() {
		return coverUploads;
	}

	public void setCoverUploads(Set<Upload> coverUploads) {
		this.coverUploads = coverUploads;
	}

	public Set<Profile> getFriends() {
		return friends;
	}

	public void setFriends(Set<Profile> friends) {
		this.friends = friends;
	}

	public Set<Profile> getReverse_friends() {
		return reverse_friends;
	}

	public void setReverse_friends(Set<Profile> reverse_friends) {
		this.reverse_friends = reverse_friends;
	}
	
	
}