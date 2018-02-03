package com.elevysi.site.social.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.elevysi.site.social.entity.Conversation;
import com.elevysi.site.social.entity.Message;
import com.elevysi.site.social.entity.Message_;
import com.elevysi.site.social.pojo.OffsetPage;
import com.elevysi.site.social.pojo.Page;
import com.elevysi.site.social.pojo.Page.SortDirection;

@Repository
@Transactional
public class MessageDAOImplement implements MessageDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	public List<Message> searchByTerm(String term){
		return null;
	}
	public List<Message> getMessages(Page page){
		return null;
	}
	
//	public long getCount(){
//		CriteriaBuilder builder = em.getCriteriaBuilder();
//		CriteriaQuery<Long> cq = builder.createQuery(Long.class);
//		cq.select(builder.count(cq.from(Message.class)));
//		
//		return em.createQuery(cq).getSingleResult();
//	}
	
	public Message save(Message message){
		em.persist(message);
		em.flush();
		return message;
	}
	
	public Message getMessage(Long id){
		
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<Message> criteria = builder.createQuery(Message.class);
		Root<Message> fromMessage = criteria.from(Message.class);
		criteria.select(fromMessage);
		Predicate condition = builder.equal(fromMessage.get(Message_.id), id);
		criteria.where(condition);
		TypedQuery<Message> query = em.createQuery(criteria);
		Message message = query.getSingleResult();
		
//		Hibernate.initialize(message.getProfile());
		
		return message;
	}
//	
//	public void deleteMessage(int id){
//		
//		CriteriaBuilder builder = em.getCriteriaBuilder();
//		CriteriaQuery<Message> criteria = builder.createQuery(Message.class);
//		Root<Message> fromMessage = criteria.from(Message.class);
//		criteria.select(fromMessage);
//		Predicate condition = builder.equal(fromMessage.get(Message_.id), id);
//		criteria.where(condition);
//		TypedQuery<Message> query = em.createQuery(criteria);
//		Message message = query.getSingleResult();
//		
//		em.merge(message);
//		em.remove(message);
//	}
//	
//	public List<Message> getConversationMessages(Conversation conversation, Page page){
//		
//		CriteriaBuilder builder = em.getCriteriaBuilder();
//		CriteriaQuery<Message> criteria = builder.createQuery(Message.class);
//		Root<Message> fromMessage = criteria.from(Message.class);
//		criteria.select(fromMessage);
//		
//		Predicate condition = builder.equal(fromMessage.get(Message_.conversation), conversation);
//	
//		criteria.where(condition);
//		TypedQuery<Message> query = page.createQuery(em, criteria, fromMessage);
//		List<Message> messages = query.getResultList();
//		
//		for(Message message : messages){
//			Hibernate.initialize(message.getProfile());
//			Hibernate.initialize(message.getProfile().getProfilePicture());
//		}
//		
//		return messages;
//	}
//	
//	public OffsetPage buildOffsetPage(int pageIndex, int size,  SingularAttribute sortField, SortDirection sortDirection){
//		return new OffsetPage(pageIndex, size, getCount(), sortField, sortDirection, Message_.created, Message_.modified, Message_.id);
//	}
	
	

}
