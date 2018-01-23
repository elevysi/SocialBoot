package com.elevysi.site.social.test.service;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.elevysi.site.social.dao.UserDAO;
import com.elevysi.site.social.entity.User;
import com.elevysi.site.social.service.UserService;

public class UserServiceTest {
	
	private UserDAO userDAO = mock(UserDAO.class);
	private UserService userService = new UserService(userDAO);
	private User user;
	
	@Before
	public void init(){
		this.user = new User();
		user.setFirst_name("John");
		user.setLast_name("Doe");
		user.setEmail("johnny@elevysi.com");
		user.setUsername("johnnie");
		user.setPassword("passHere");
	}
	
	@Test
	public void testSaveUser(){
		User savedUser = new User();
		savedUser.setFirst_name("John");
		savedUser.setLast_name("Doe");
		savedUser.setEmail("johnny@elevysi.com");
		savedUser.setUsername("johnnie");
		savedUser.setPassword("passHere");
		when(this.userDAO.save(this.user)).thenReturn(savedUser);
		User serviceSavedUser = userService.saveUser(this.user);
		
		assertEquals(user.getUsername(), serviceSavedUser.getUsername());
		assertEquals(user.getFirst_name(), serviceSavedUser.getFirst_name());
		assertEquals(user.getLast_name(), serviceSavedUser.getLast_name());
		assertEquals(user.getPassword(), serviceSavedUser.getPassword());
		assertEquals(user.getEmail(), serviceSavedUser.getEmail());
	}

}
