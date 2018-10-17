package com.elevysi.site.social.controller.rest.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.elevysi.site.commons.dto.ProfileDTO;
import com.elevysi.site.social.service.ProfileService;

@RestController
@RequestMapping(value="/api/public/", produces="application/json")
public class PublicApiController {
	
	private ProfileService profileService;
	
	@Autowired
	public PublicApiController(ProfileService profileService){
		this.profileService = profileService;
	}

	@RequestMapping(value="/profile/{profileID}")
	public @ResponseBody ProfileDTO profileByIDPublic(@PathVariable("profileID") String profileID){
		return profileService.findProfileByID(Long.parseLong(profileID));
	}
}
