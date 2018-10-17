package com.elevysi.site.social.config.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@EnableResourceServer
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {
	
	//Only APIs calls are considered as resource server i.e. needing token
	@Override
    public void configure(HttpSecurity http) throws Exception{
        http
        .requestMatchers().antMatchers("/api/**")
        .and()
        .authorizeRequests()
        .antMatchers("/api/public/**").permitAll()
        .antMatchers(HttpMethod.DELETE, "/api/delete/**").hasRole("ADMIN")
        .anyRequest().authenticated();
    }

}
