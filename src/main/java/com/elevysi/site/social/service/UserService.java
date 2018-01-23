package com.elevysi.site.social.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.elevysi.site.social.dao.UserDAO;
import com.elevysi.site.social.entity.User;

@Service
public class UserService extends AbstractService{
	
	private UserDAO userDAO;
	
	@Autowired
	public UserService(UserDAO userDAO){
		this.userDAO = userDAO;
	}
	
	public User saveUser(User user){
		return userDAO.save(user);
	}

}
