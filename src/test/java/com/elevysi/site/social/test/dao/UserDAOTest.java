package com.elevysi.site.social.test.dao;

import static org.junit.Assert.assertEquals;

import javax.transaction.Transactional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.elevysi.site.social.SocialBootApplication;
import com.elevysi.site.social.config.AppConfig;
import com.elevysi.site.social.dao.UserDAO;
import com.elevysi.site.social.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes={SocialBootApplication.class, AppConfig.class})
@Transactional
public class UserDAOTest {
	
	@Autowired
	private UserDAO userDAO;
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
		User savedUser = userDAO.save(this.user);
		assertEquals(user.getUsername(), savedUser.getUsername());
		assertEquals(user.getFirst_name(), savedUser.getFirst_name());
		assertEquals(user.getLast_name(), savedUser.getLast_name());
		assertEquals(user.getPassword(), savedUser.getPassword());
		assertEquals(user.getEmail(), savedUser.getEmail());
		
	}
}
