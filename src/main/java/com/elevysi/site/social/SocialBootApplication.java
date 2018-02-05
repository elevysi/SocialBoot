package com.elevysi.site.social;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
@RefreshScope
public class SocialBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SocialBootApplication.class, args);
	}
}
