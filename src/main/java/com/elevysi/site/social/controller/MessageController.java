package com.elevysi.site.social.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.elevysi.site.social.entity.Message;
import com.elevysi.site.social.exception.DomainObjectNotFoundException;
import com.elevysi.site.social.pojo.Article;
import com.elevysi.site.social.service.MessageService;
import com.elevysi.site.social.soa.client.ShopFeignClient;

@Controller
@RequestMapping("/api/")
public class MessageController {
	
	
	private MessageService messageService;
	private ShopFeignClient shopFeignClient;
	
	@Autowired
	public MessageController(MessageService messageService, ShopFeignClient shopFeignClient){
		this.messageService = messageService;
		this.shopFeignClient = shopFeignClient;
	}
	
//	
	@RequestMapping(value="/message/{id}", method=RequestMethod.GET)
	public @ResponseBody Message getMessage(@PathVariable("id")Long id){
		Message message = messageService.getMessageById(id);
		if(message == null) throw new DomainObjectNotFoundException(id);
		return message;
	}
	
	//Example Call through SOA
	@RequestMapping(value="/article/{id}", method=RequestMethod.GET)
	public @ResponseBody Article getArticle(@PathVariable("id")String id){
		Article article = shopFeignClient.getArticle(id);
		return article;
	}
	
}
