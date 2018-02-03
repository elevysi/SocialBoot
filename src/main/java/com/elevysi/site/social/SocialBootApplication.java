package com.elevysi.site.social;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;

@SpringBootApplication
@RefreshScope
public class SocialBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SocialBootApplication.class, args);
	}
}
