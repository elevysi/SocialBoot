package com.elevysi.site.social.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.metamodel.SingularAttribute;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.elevysi.site.commons.pojo.OffsetPage;
import com.elevysi.site.commons.pojo.Page;
import com.elevysi.site.commons.pojo.Page.SortDirection;
import com.elevysi.site.commons.dto.ProfileDTO;
import com.elevysi.site.commons.dto.ProfileTypeDTO;
import com.elevysi.site.commons.dto.PublicationDTO;
import com.elevysi.site.commons.dto.UploadDTO;
import com.elevysi.site.social.dao.ProfileDAO;
import com.elevysi.site.social.entity.Profile;
import com.elevysi.site.social.entity.ProfileType;
import com.elevysi.site.social.soa.client.BlogFeignClient;

import static java.lang.Math.toIntExact;


@Service
public class ProfileService extends AbstractServiceImpl<Profile, Integer>{
		
	private ProfileDAO profileDAO;
	private ModelMapper modelMapper;
	private static final int PAGE_SIZE = 20;
	
	private BlogFeignClient blogFeignClient;

	@Autowired
	public ProfileService(ProfileDAO profileDAO, BlogFeignClient blogFeignClient, ModelMapper modelMapper){
		this.profileDAO = profileDAO;
		this.modelMapper = modelMapper;
		this.blogFeignClient = blogFeignClient;
	}
	
	
	public ProfileDTO findProfileByUserID(long userID){
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
		
		Profile profile = profileDAO.findProfileByUserID(userID);
		ProfileDTO profileDTO = modelMapper.map(profile, ProfileDTO.class);
		
		return profileDTO;
	}
	
	
	public Profile findByID(Integer profileID){
		return profileDAO.findByID(profileID);
	}
	
	public Profile findByUsername(String username){
		return profileDAO.findByUsername(username);
	}
	
	public ProfileDTO findProfileByID(long profileID){
		
		Profile profile = findByID(toIntExact(profileID));
		ProfileDTO profileDTO = modelMapper.map(profile, ProfileDTO.class);
		
		ProfileType profileType = profile.getProfileType();
		ProfileTypeDTO profileTypeDTO = modelMapper.map(profileType, ProfileTypeDTO.class);
		
		java.lang.reflect.Type targetListType = new TypeToken<Set<UploadDTO>>() {}.getType();
		Set<UploadDTO> profilePicturesDTO = modelMapper.map(profile.getProfilePicture(), targetListType);
		
		profileDTO.setProfilePicture(profilePicturesDTO);
		profileDTO.setProfileType(profileTypeDTO);
		
		return profileDTO;
	}
	
	public List<PublicationDTO> findProfilePublications(Integer profileID, int pageNumber){
		return blogFeignClient.findProfilePublications(profileID, pageNumber);
	}
	
	public OffsetPage buildOffsetPage(int pageIndex, int size,  SingularAttribute sortField, SortDirection sortDirection){
		return profileDAO.buildOffsetPage(pageIndex, size, sortField, sortDirection);
	}
	
	public List<Profile> getProfiles(Page page){
		return profileDAO.getProfiles(page);
	}
	
	//I added them --> Following
	public List<Profile> findFollowing(Profile profile){
		return profileDAO.findFollowing(profile.getId());
	}
	
	//They added me --> Followers
	public List<Profile> findFollowers(Profile profile){
		return profileDAO.findFollowers(profile.getId());
	}
	
	//All --> Netword
	public List<Profile> findProfileConnections(Profile profile) {
		List<Profile> following =  profileDAO.findFollowing(profile.getId());
		List<Profile> followed = profileDAO.findFollowers(profile.getId());
		followed.addAll(following);
		return followed;
	}
	
	//Mutual
	public List<Profile> findMutualBucket(Profile profile){
		
		List<Profile> following =  profileDAO.findFollowing(profile.getId());
		List<Profile> followed = profileDAO.findFollowers(profile.getId());
		followed.retainAll(following);
		
		return followed;
	}
}
