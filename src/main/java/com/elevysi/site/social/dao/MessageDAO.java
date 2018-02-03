package com.elevysi.site.social.dao;

import java.util.List;

import javax.persistence.metamodel.SingularAttribute;

import com.elevysi.site.social.entity.Conversation;
import com.elevysi.site.social.entity.Message;
import com.elevysi.site.social.pojo.OffsetPage;
import com.elevysi.site.social.pojo.Page;
import com.elevysi.site.social.pojo.Page.SortDirection;


public interface MessageDAO {
	
//	public List<Message> searchByTerm(String term);
//	public List<Message> getMessages(Page page);
//	public long getCount();
//	public OffsetPage buildOffsetPage(int pageIndex, int size,  SingularAttribute sortField, SortDirection sortDirection);
//	public void deleteMessage(int id);
//	public List<Message> getConversationMessages(Conversation conversation, Page page);
	
	public Message getMessage(Long id);
	public Message save(Message message);

}
