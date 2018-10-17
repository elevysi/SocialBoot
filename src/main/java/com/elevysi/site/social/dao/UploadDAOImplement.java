package com.elevysi.site.social.dao;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.elevysi.site.social.entity.Upload;
import com.elevysi.site.social.entity.Upload_;

@Repository
@Transactional
public class UploadDAOImplement extends AbstractDAOImpl<Upload, Integer> implements UploadDAO{
	
	@PersistenceContext
	EntityManager em;
	
	public Upload findByKeyIdentification(String key){
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Upload> criteria = cb.createQuery(Upload.class);
		Root<Upload> uploadRoot = criteria.from(Upload.class);
		criteria.select(uploadRoot);
		Predicate condition = cb.equal(uploadRoot.get(Upload_.keyIdentification), key);
		criteria.where(condition);
		TypedQuery<Upload> query = em.createQuery(criteria);
		List<Upload> uploads = query.getResultList();
		if(uploads.size() >= 1){
			return uploads.get(0);
		}
		
		return null;
	}
	
	public List<Upload> findByLinkTableOpposite(String linkTable){
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Upload> criteria = cb.createQuery(Upload.class);
		Root<Upload> uploadRoot = criteria.from(Upload.class);
		criteria.select(uploadRoot);
		Predicate condition = cb.notEqual(uploadRoot.get(Upload_.linkTable), linkTable);
		criteria.where(condition);
		TypedQuery<Upload> query = em.createQuery(criteria);
		return query.getResultList();
	}
	
	public List<Upload> findByLinkIDAndLinkTable(Integer linkID, String linkTable){
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Upload> criteria = cb.createQuery(Upload.class);
		Root<Upload> uploadRoot = criteria.from(Upload.class);
		criteria.select(uploadRoot);
		
		List<Predicate> predicates = new ArrayList<Predicate>();
		
		predicates.add(cb.notEqual(uploadRoot.get(Upload_.linkId), linkID));
		predicates.add(cb.notEqual(uploadRoot.get(Upload_.linkTable), linkTable));
		
		criteria.where(cb.and(predicates.toArray(new Predicate[predicates.size()])));
		
		TypedQuery<Upload> query = em.createQuery(criteria);
		return query.getResultList();
	}

}
