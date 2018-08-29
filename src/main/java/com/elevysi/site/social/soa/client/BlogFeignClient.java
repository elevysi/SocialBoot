package com.elevysi.site.social.soa.client;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.elevysi.site.commons.dto.PublicationDTO;

@FeignClient(name="blogservice")
public interface BlogFeignClient {
	
	@RequestMapping(method= RequestMethod.GET, value="/api/publications/profile/{profileID}")
	List<PublicationDTO> findProfilePublications(@PathVariable("profileID") Integer profileID, 
			@RequestParam(value="page", defaultValue="1", required=false)int pageIndex);

}
