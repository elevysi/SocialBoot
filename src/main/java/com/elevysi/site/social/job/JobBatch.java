package com.elevysi.site.social.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.elevysi.site.social.entity.Upload;
import com.elevysi.site.social.service.UploadService;

@Component
public class JobBatch {
	
	@Autowired
	private UploadService uploadService;

	
//	@Scheduled(fixedRate = 5000)
	public void removeUploads(){
		
		List<Upload> uploads = uploadService.findByLinkTableOpposite("profilePicture");
		
		for(Upload upload : uploads){
				uploadService.delete(upload.getId());
		}
	}
}
