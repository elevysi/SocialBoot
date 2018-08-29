package com.elevysi.site.social.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.elevysi.site.commons.dto.PublicationDTO;
import com.elevysi.site.commons.pojo.OffsetPage;
import com.elevysi.site.commons.pojo.Page.SortDirection;
import com.elevysi.site.commons.pojo.ReturnValue;
import com.elevysi.site.commons.pojo.SessionMessage;
import com.elevysi.site.social.entity.Profile;
import com.elevysi.site.social.entity.Profile_;
import com.elevysi.site.social.entity.Upload;
import com.elevysi.site.social.service.ProfileService;
import com.elevysi.site.social.service.UploadService;

@Controller
@RequestMapping("/ui/profile")
public class ProfileController extends AbstractController{
	
	@Autowired
	ProfileService profileService;
	
	@Autowired
	private UploadService uploadService;
	
	@RequestMapping({"/{username}"})
	public String view(
			@PathVariable("username") String username, 
			@ModelAttribute("sessionMessage") SessionMessage sessionMessage, 
			Model model, 
			final RedirectAttributes redirectAttributes, 
			@RequestParam(defaultValue="1", required = false, value="page")Integer pageNumber
	){
		
		Profile profile = profileService.findByUsername(username);
		
		
		if(profile != null){
			
			Set<Upload> avatars = new HashSet<Upload>(uploadService.findByLinkIDAndLinkTable(profile.getId(), "profilePicture"));
			Set<Upload> covers = new HashSet<Upload>(uploadService.findByLinkIDAndLinkTable(profile.getId(), "coverUpload"));

			
			profile.setProfilePicture(avatars);
			profile.setCoverUploads(covers);
			
			List<PublicationDTO> publications = profileService.findProfilePublications(profile.getId(), pageNumber);
			
			model.addAttribute("userProfile", profile);
			model.addAttribute("publications", publications);
			model.addAttribute("sessionMessage", sessionMessage);
			model.addAttribute("pageTitle", profile.getName());
			model.addAttribute("pageDescription", profile.getDescription());
			model.addAttribute("nextpageIndex", pageNumber+1);
			
			
			return "profileView";
			
		}else{
			SessionMessage notFoundMsg = new SessionMessage("The specified profile was not found.");
			notFoundMsg.setDangerClass();
			redirectAttributes.addFlashAttribute("sessionMessage", notFoundMsg);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "settings", method= RequestMethod.GET)
	public @ResponseBody ReturnValue doSavePostComment(){
		
		ReturnValue returnValue = new ReturnValue();
		returnValue.setCode(0);
		returnValue.setMessage("Failed to save the comment");

		return returnValue;
		
	}
	

}
