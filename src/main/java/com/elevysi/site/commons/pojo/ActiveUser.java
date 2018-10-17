package com.elevysi.site.commons.pojo;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.userdetails.User;

import com.elevysi.site.commons.dto.ProfileDTO;

public class ActiveUser extends User{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8778094825710419801L;
	private List<ProfileDTO> profiles;
	
	private ProfileDTO userProfile;
	
	private String first_name;
	
	private ProfileDTO activeProfile;
	
	

	public ProfileDTO getActiveProfile() {
		return activeProfile;
	}

	public void setActiveProfile(ProfileDTO activeProfile) {
		this.activeProfile = activeProfile;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public ProfileDTO getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(ProfileDTO userProfile) {
		this.userProfile = userProfile;
	}

	public ActiveUser(String username, String password, boolean enabled,
	         boolean accountNonExpired, boolean credentialsNonExpired,
	         boolean accountNonLocked,
	         Collection authorities,
	         String first_name,
	         ProfileDTO userProfile,
	         ProfileDTO activeProfile,
	         List<ProfileDTO> profiles
			) {

	             super(username, password, enabled, accountNonExpired,
	                credentialsNonExpired, accountNonLocked, authorities);
	             
	             this.userProfile = userProfile;
	             this.activeProfile = activeProfile;
	             this.profiles = profiles;
	             this.first_name = first_name;
     }
	
	
	public List<ProfileDTO> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<ProfileDTO> profiles) {
		this.profiles = profiles;
	}

}
