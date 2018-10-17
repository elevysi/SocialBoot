package com.elevysi.site.social.soa.client;


import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.elevysi.site.commons.dto.UserDTO;


@FeignClient(name="authservice")
public interface AuthFeignClient {
	
	
	@RequestMapping(method= RequestMethod.POST, value="/oauth/token")
	Object getToken(
			@RequestParam(value="grant_type", required=false)String grant_type,
			@RequestParam(value="scope", required=false)String scope,
			@RequestParam(value="username", required=false)String username,
			@RequestParam(value="password", required=false)String password
	);
	
	@RequestMapping(method= RequestMethod.GET, value="/api/user/{username}")
	UserDTO getUserByUsername(@PathVariable("username") String username);
}
