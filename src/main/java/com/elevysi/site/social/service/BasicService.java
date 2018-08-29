package com.elevysi.site.social.service;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Locale;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.elevysi.site.commons.dto.ProfileDTO;
import com.elevysi.site.commons.pojo.ActiveUser;
import com.elevysi.site.social.entity.Profile;

public class BasicService {

	protected final static int DEFAULT_NO_COMMENTS = 50;
	private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
	private static final Pattern WHITESPACE = Pattern.compile("[\\s]");
	
	
	/**
     * Returns a new object which specifies the the wanted result page.
     * @param pageIndex The index of the wanted result page
     * @return
     */
    protected Pageable constructPageSpecification(int pageIndex, int limit,  String sortField, String sortDirection) {
    	Pageable pageSpecification = new PageRequest(pageIndex, limit, sortByField(sortField, sortDirection));
        return pageSpecification;
    }
 
 
    /**
     * Returns a Sort object which sorts persons in ascending order by using the last name.
     * @return
     */
    private Sort sortByField(String sortField, String sortDirection) {
    	
    	if(sortDirection.equalsIgnoreCase("desc")){
    		return new Sort(Sort.Direction.DESC, sortField);
    	}else return new Sort(Sort.Direction.ASC, sortField);
        
    }
    
    public ProfileDTO getActiveProfile(){
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	boolean isAuthenticated =  this.isAuthed();
    	
    	if(auth != null && isAuthenticated){
			ActiveUser activeUser = (ActiveUser)auth.getPrincipal();
			ProfileDTO actingProfile = activeUser.getActiveProfile();
			if(actingProfile != null){
				return actingProfile;
			}
		}
    	
    	return null;
    }
    
    public boolean isAuthed(){
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			return true;
		}
    	
    	return false;
    }
    
}
