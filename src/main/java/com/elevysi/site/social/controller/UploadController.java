package com.elevysi.site.social.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.elevysi.site.commons.dto.ProfileDTO;
import com.elevysi.site.commons.dto.UploadDTO;
import com.elevysi.site.commons.pojo.ReturnValue;
import com.elevysi.site.social.entity.Profile;
import com.elevysi.site.social.entity.Upload;
import com.elevysi.site.social.service.ProfileService;
import com.elevysi.site.social.service.UploadService;



@Controller
@RequestMapping("/ui/uploads")
public class UploadController extends AbstractController{
	
	@Autowired
	private UploadService uploadService;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(
			Model model, 
			@RequestParam("key") String key, 
			HttpServletResponse response, 
			@RequestParam(value="inline", required=false) Boolean inline) throws Exception {
		
		Upload upload = uploadService.findByKeyIdentification(key);
		
		if(upload != null){
					
				String contentType = upload.getFilemine();
				
				String filename = upload.getFilename();
				
		        // Stream the image
		        BufferedInputStream in = null;
		        try
		        {
		        	String uploadPath = upload.getPath();
		        	String finalPath = upload.getPath();
		        	if(uploadPath != null){
		        		/**
		        		 * Check which env this is
		        		 */
		        		if(uploadPath.contains(this.oppositeDS)){
		        			finalPath = uploadPath.replace(this.oppositeDS, this.ds);
		        			
		        		}
		        	}
		        	File downloadFile = new File(this.avatarUploadPath+finalPath);
		        	if(downloadFile.exists() && downloadFile.isFile()){
		        		
			            in = new BufferedInputStream(new FileInputStream(downloadFile));
			
			            response.setContentType(contentType);
			            if(inline == null){
			            	response.setHeader("Content-Disposition",  " inline; filename=" + filename);
			            	
			            	/**
			            	 * Force download put attachment in header instead
			            	 */
			            	
			            	//response.setHeader("Content-Disposition",  " attachment; filename=" + filename);
			            }
			            
			            response.setContentLength(upload.getFilesize());
			            
			            response.setStatus(HttpServletResponse.SC_OK);
			            IOUtils.copy(in, response.getOutputStream());
			            response.flushBuffer();
		        	}
		            
		        }
		        catch(Exception e)
		        {
//		           e.printStackTrace();
		           return;
		        }
		        finally
		        {
		            try
		            {
		            	if(in!= null) in.close();
		            }
		            catch(Exception ee)
		            {
		                ee.printStackTrace();
		            }
		        }
		}
	}
	
	
	@RequestMapping(value="/profile", method= RequestMethod.GET)
	public String avatar(
			Model model,
			@RequestParam(defaultValue="profilePicture", required = false, value="type")String type
	){
		
		ProfileDTO profileDTO = uploadService.getActiveProfile();
		Profile profile = profileService.findByID(profileDTO.getId());
		
		Set<Upload> avatars = new HashSet<Upload>(uploadService.findByLinkIDAndLinkTable(profile.getId(), "profilePicture"));
		Set<Upload> covers = new HashSet<Upload>(uploadService.findByLinkIDAndLinkTable(profile.getId(), "coverUpload"));

		
		profile.setProfilePicture(avatars);
		profile.setCoverUploads(covers);
		
		model.addAttribute("actingProfile", profile);
		model.addAttribute("profile", profile);
		model.addAttribute("type", type);
		
		return "profilePicUpload";
	}
	
	@RequestMapping(value="/profile", method= RequestMethod.POST)
	public @ResponseBody ReturnValue upload(
			MultipartHttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(defaultValue="profilePicture", required = false, value="type")String type
	) throws Exception{
	    
		ReturnValue returnValue = new ReturnValue();
		returnValue.setCode(0);
		returnValue.setMessage("Failed to Upload the file.");
		
		UploadDTO uploadDTO = null;
		
	    //1. Build an Iterator
		Iterator<String> itr = request.getFileNames();
		MultipartFile mpf = null;
		
		//2. get each file
		while(itr.hasNext()){
			//2.1 Get Next Multipart File
			mpf = request.getFile(itr.next());
			
			//2.3 Create new Upload
			
			/**
			 * Check if Profile has a profile Picture Already
			 */
			
			ProfileDTO requestedProfile = uploadService.getActiveProfile();
			Profile profile = modelMapper.map(requestedProfile, Profile.class);
			
			Set<Upload> avatars = new HashSet<Upload>(uploadService.findByLinkIDAndLinkTable(profile.getId(), "profilePicture"));
			Set<Upload> covers = new HashSet<Upload>(uploadService.findByLinkIDAndLinkTable(profile.getId(), "coverUpload"));

			
			profile.setProfilePicture(avatars);
			profile.setCoverUploads(covers);
			
			String fileName = mpf.getOriginalFilename();
			
			
			if(type.equals("profilePicture")){
				if(profile.getProfilePicture().iterator().hasNext()){
					uploadDTO = requestedProfile.getProfilePicture().iterator().next();
				}
			}else{
				if(profile.getCoverUploads().iterator().hasNext()){
					uploadDTO = requestedProfile.getCoverUploads().iterator().next();
				}
			}
			
			Date now = new Date();
			
			if(uploadDTO == null){
				uploadDTO = new UploadDTO();
				uploadDTO.setCreated(now);
			}
			
			Upload upload = modelMapper.map(uploadDTO, Upload.class);
			
			
			upload.setFilename(fileName);
			upload.setFilesize((int)mpf.getSize());
			upload.setFilemine(mpf.getContentType());
//			upload.setOwningProfilePicture(profile);
			upload.setLinkTable(type);
			upload.setProfileID(profile.getId());
			
			String uploadKey = this.generateUUID();
			upload.setKeyIdentification(uploadKey);
			upload.setModified(now);
			
			upload.setAltText("profilePicture");
			
			Long timeofUpload  = System.currentTimeMillis();
			
			try{
				
				
				String avatarDirPath = this.avatarUploadPath+"profiles"+this.ds+requestedProfile.getId()+this.ds+"avatar"+this.ds+timeofUpload+this.ds;
				File avatarDir = new File(avatarDirPath);
				if (!avatarDir.exists()) {
					if (avatarDir.mkdirs()) {
						
						String saveRelativePath = "profiles"+this.ds+requestedProfile.getId()+this.ds+"avatar"+this.ds+timeofUpload+this.ds+fileName;
						upload.setPath(saveRelativePath);
						uploadService.saveImage(mpf, avatarDirPath+fileName);
					} else {
						
					}
				}
				
//				upload.setOwningProfilePicture(profile);
				upload.setLinkTable("profilePicture");
				
				if(upload.getId() == null) uploadService.save(upload);
				else uploadService.saveEdited(upload); 
				
				returnValue.setCode(1);
				returnValue.setMessage("The file was successfully uploaded.");
				returnValue.setExtra("");
				
				
				/**
				 * Reload the Profile User to display data
				 */
//				profileServoce.reloadCurrentProfile();
				
			}catch(Exception e){
				throw e;
			}			
			
			
		}
		
		return returnValue;
	}

}
