package com.elevysi.site.social.soa.client;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.elevysi.site.social.entity.dto.ArticleAddDTO;

@FeignClient("shopservice")
public interface ShopFeignClient {
	
//	@RequestMapping(method= RequestMethod.GET, value="/api/article/{articleID}")
//	Article getArticle(@PathVariable("articleID") String articleID);
//	
//	@RequestMapping(method= RequestMethod.POST, value="/api/article")
//	Article doArticle(ArticleAddDTO articleAddDto);
}
