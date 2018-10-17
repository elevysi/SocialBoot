package com.elevysi.site.social.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "profile_types")
public class ProfileType extends AbstractEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2640271872718545941L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	
//	@OneToMany(mappedBy ="profileType", fetch=FetchType.LAZY)
//	private Set <Profile> profiles = new HashSet<Profile>();

//	public Set<Profile> getProfiles() {
//		return profiles;
//	}
//	public void setProfiles(Set<Profile> profiles) {
//		this.profiles = profiles;
//	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
