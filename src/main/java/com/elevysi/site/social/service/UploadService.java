package com.elevysi.site.social.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.elevysi.site.social.dao.UploadDAO;
import com.elevysi.site.social.entity.Upload;

@Service
public class UploadService extends AbstractServiceImpl<Upload, Integer>{
	
	@Autowired
	private UploadDAO uploadDAO;
	
	public Upload findByKeyIdentification(String key){
		return uploadDAO.findByKeyIdentification(key);
	}
	
	public void saveImage(MultipartFile image, String path) throws RuntimeException, IOException {
		
		try{
			byte[] bytes = image.getBytes();
            BufferedOutputStream buffStream = 
                    new BufferedOutputStream(new FileOutputStream(new File((path))));
            buffStream.write(bytes);
            buffStream.close();
            
		}catch (IOException e){
			throw e;
		}
	}
	
	public List<Upload> findByLinkTableOpposite(String linkTable){
		return uploadDAO.findByLinkTableOpposite(linkTable);
	}
	
	public List<Upload> findByLinkIDAndLinkTable(Integer linkID, String linkTable){
		return uploadDAO.findByLinkIDAndLinkTable(linkID, linkTable);
	}

}
