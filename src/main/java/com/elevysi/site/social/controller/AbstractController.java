package com.elevysi.site.social.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;

public class AbstractController {
	
	@Value("${upload.path}")
	protected String avatarUploadPath;
	
	@Value("${separator.ds}")
	protected String ds;
	
	@Value("${separator.oppositeDS}")
	protected String oppositeDS;
	
	protected static int DEFAULT_NO_ITEMS = 20;
	
	public String generateUUID(){
		 UUID uniqueKey = UUID.randomUUID();   
		 return uniqueKey.toString();
	}

}
