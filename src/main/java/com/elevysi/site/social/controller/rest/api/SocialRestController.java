package com.elevysi.site.social.controller.rest.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.elevysi.site.commons.dto.PublicationDTO;
import com.elevysi.site.commons.pojo.OffsetPage;
import com.elevysi.site.commons.pojo.Page.SortDirection;
import com.elevysi.site.social.controller.AbstractController;
import com.elevysi.site.social.entity.Profile;
import com.elevysi.site.social.entity.Profile_;
import com.elevysi.site.social.service.ProfileService;

@Controller
@RequestMapping(value="/restApi/")
public class SocialRestController extends AbstractController{
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping(value="/profilePublications/{profileID}")
	public String findProfilePublications
	(
			Model model,
			@PathVariable("profileID")Integer profileID,
			@RequestParam(value="page", defaultValue="1", required=false)int pageIndex
	){
		List<PublicationDTO> publications = profileService.findProfilePublications(profileID, pageIndex);
		model.addAttribute("publications", publications);
		model.addAttribute("nextpageIndex", pageIndex+1);
		
		return "profilePublications";
	}
	
	
	@RequestMapping(value="/profile/{username}/profileBucketNetworkAjax/{networkType}/")
	public String profileBucketNetworkAjax(
			Model model,
			@PathVariable("username") String username,
			@PathVariable("networkType") int networkType,
			@RequestParam(value="page", defaultValue="1", required=false)int pageIndex
	){
		
		OffsetPage page = profileService.buildOffsetPage(pageIndex, DEFAULT_NO_ITEMS, Profile_.created, SortDirection.DESC);
		List<Profile> friends = new ArrayList<Profile>();
		Profile profile = profileService.findByUsername(username);
		
		if(profile != null){
			
		
			switch(networkType){
				case 1: //all
					friends = profileService.findProfileConnections(profile);
				break;
				case 2: //I added them
					friends = profileService.findFollowing(profile);
				break;
				case 3: //They added me
					friends = profileService.findFollowers(profile);
				break;
				case 4: //Mutual
					friends = profileService.findMutualBucket(profile);
				break;
			}
		}
		
		model.addAttribute("profiles", friends);
		
		double totalRecords = page.getTotalRecords();
		int totalPages = (int)Math.ceil(totalRecords / DEFAULT_NO_ITEMS);
		model.addAttribute("page", page);
		model.addAttribute("totalPages", totalPages);
		
		return "indexprofilesajax";
	}

}
