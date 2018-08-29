package com.elevysi.site.social.controller.rest.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.elevysi.site.commons.dto.ProfileDTO;
import com.elevysi.site.social.entity.Profile;
import com.elevysi.site.social.service.ProfileService;


@RestController
@RequestMapping(value="/api/profile/", produces="application/json")
public class ProfileRestController {
	
	ProfileService profileService;
	
	@Autowired
	public ProfileRestController(ProfileService profileService){
		this.profileService = profileService;
	}
	

	@RequestMapping(value="/user/{userID}")
	public @ResponseBody ProfileDTO profile(@PathVariable("userID") String userID){
		return profileService.findProfileByUserID(Long.parseLong(userID));
	}
	
	@RequestMapping(value="/user/{userID}/{profileType}")
	public @ResponseBody ProfileDTO profileUser(@PathVariable("userID") String userID, @PathVariable("profileType") String profileType){
		return profileService.findProfileByUserID(Long.parseLong(userID));
	}
	
	@RequestMapping(value="/profile/{profileID}")
	public @ResponseBody ProfileDTO profileByID(@PathVariable("profileID") String profileID){
		return profileService.findProfileByID(Long.parseLong(profileID));
	}
	
}
