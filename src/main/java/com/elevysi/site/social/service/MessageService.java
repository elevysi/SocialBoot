package com.elevysi.site.social.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.metamodel.SingularAttribute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.elevysi.site.social.dao.MessageDAO;
import com.elevysi.site.social.entity.Message;


@Service
public class MessageService extends AbstractService{

	
	
	@Autowired
	private MessageDAO messageDAO;
	
	public Message saveMessage(Message message){
		Date now = new Date();
		message.setCreated(now);
		message.setModified(now);
		return messageDAO.save(message);
	}

	public Message updateMessage(Message savedMessage) {
		Date now = new Date();
		savedMessage.setModified(now);
		return messageDAO.save(savedMessage);
	}
	
	public Message getMessageById(Long id) {
		return messageDAO.getMessage(id);
	}
	
//	public List<Message> getPaginatedConversationMsgs(Conversation conversation, Integer pageNumber, Integer limit, String sortField, String sortDirection) {
//		
//		List<Message> conversationMsgs = new ArrayList<Message>();
//		
//		Page<Message> requestedPage = messageRepository.findConversationMessages(conversation.getId(), constructPageSpecification(pageNumber -1, limit, sortField, sortDirection));
//		return requestedPage.getContent();
////		conversationMsgs.add(findOne(1));
////		return conversationMsgs;
//	}
	
//	public List<Message> findByConversation(Conversation conversation, Integer pageNumber, Integer limit, String sortField, String sortDirection){
//		return messageRepository.findByConversation(conversation, constructPageSpecification(pageNumber -1, limit, sortField, sortDirection)).getContent();
//	}
//	
//	public Message findOne(Integer id){
//		return messageRepository.findOne(id);
//	}
//	
//	public OffsetPage buildOffsetPage(int pageIndex, int size,  SingularAttribute sortField, SortDirection sortDirection){
//		return messageDAO.buildOffsetPage(pageIndex, size, sortField, sortDirection);
//	}
//	
//	public List<Message> getConversationMessages(Conversation conversation, com.elevysi.site.pojo.Page page){
//		return messageDAO.getConversationMessages(conversation, page);
//	}
	
}
