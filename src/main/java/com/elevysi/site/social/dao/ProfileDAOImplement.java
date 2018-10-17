package com.elevysi.site.social.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.SetJoin;
import javax.persistence.metamodel.SingularAttribute;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.elevysi.site.commons.pojo.Page;
import com.elevysi.site.commons.pojo.OffsetPage;
import com.elevysi.site.commons.pojo.Page.SortDirection;
import com.elevysi.site.social.entity.Profile;
import com.elevysi.site.social.entity.Profile_;

@Repository
@Transactional
public class ProfileDAOImplement extends AbstractDAOImpl<Profile, Integer> implements ProfileDAO{
	
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Profile findByID(Integer id){
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Profile> criteria = cb.createQuery(Profile.class);
		Root<Profile> queryRoot = criteria.from(Profile.class);
		Predicate condition = cb.equal(queryRoot.get(Profile_.id), id);
		criteria.where(condition);
		TypedQuery<Profile> query = em.createQuery(criteria);
		
		List<Profile> result = query.getResultList();
		if(result.size() > 0){
			Profile profile = result.get(0);
			Hibernate.initialize(profile.getProfilePicture());
			Hibernate.initialize(profile.getCoverUploads());
			Hibernate.initialize(profile.getProfileType());
			
			return profile;
		}
		
		return null;
	}
	
	public Profile findProfileByUserID(long userID){
		
//		org.hibernate.Filter filter = em.unwrap(Session.class).enableFilter("itemTableIs");
//		filter.setParameter("link_tableValue", "profilePicture");
//		filter.setParameter("displayValue", 1);
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Profile> criteria = cb.createQuery(Profile.class);
		Root<Profile> queryRoot = criteria.from(Profile.class);
		Predicate condition = cb.equal(queryRoot.get(Profile_.userID), userID);
		criteria.where(condition);
		TypedQuery<Profile> query = em.createQuery(criteria);
		
		List<Profile> result = query.getResultList();
		if(result.size() > 0){
			Profile profile = result.get(0);
			Hibernate.initialize(profile.getProfilePicture());
			Hibernate.initialize(profile.getCoverUploads());
			Hibernate.initialize(profile.getProfileType());
			
			return profile;
		}
		
		return null;
		
	}
	
	
	public Profile findByUsername(String username){
		
//		org.hibernate.Filter filter = em.unwrap(Session.class).enableFilter("itemTableIs");
//		filter.setParameter("link_tableValue", "profilePicture");
//		filter.setParameter("displayValue", 1);
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Profile> criteria = cb.createQuery(Profile.class);
		Root<Profile> queryRoot = criteria.from(Profile.class);
		Predicate condition = cb.equal(queryRoot.get(Profile_.name), username);
		criteria.where(condition);
		TypedQuery<Profile> query = em.createQuery(criteria);
		
		List<Profile> result = query.getResultList();
		if(result.size() > 0){
			Profile profile = result.get(0);
			Hibernate.initialize(profile.getProfilePicture());
			Hibernate.initialize(profile.getCoverUploads());
			Hibernate.initialize(profile.getProfileType());
			
			return profile;
		}
		
		return null;
	}
	
	public OffsetPage buildOffsetPage(int pageIndex, int size,  SingularAttribute sortField, SortDirection sortDirection){
		return new OffsetPage(pageIndex, size, getCount(), sortField, sortDirection, Profile_.created, Profile_.modified, Profile_.id);
	}
	
	public List<Profile> getProfiles(Page page){
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Profile> criteria = cb.createQuery(Profile.class);
		Root<Profile> profileRoot = criteria.from(Profile.class);
		criteria.select(profileRoot);
		
		TypedQuery<Profile> query = page.createQuery(em, criteria, profileRoot);
		List<Profile> profiles =  query.getResultList();
		
		for(Profile profile : profiles){
			Hibernate.initialize(profile.getProfilePicture());
			Hibernate.initialize(profile.getCoverUploads());
			Hibernate.initialize(profile.getProfileType());
		}
		
		return profiles;
		
	}
	
	public List<Profile> findFollowing(Integer id){
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Profile> criteria = cb.createQuery(Profile.class);
		Root<Profile> queryRoot = criteria.from(Profile.class);
		criteria.where(cb.equal(queryRoot.get(Profile_.id), id));
		
		SetJoin<Profile, Profile> following = queryRoot.join(Profile_.friends);
		
		CriteriaQuery<Profile> cq = criteria.select(following);
        TypedQuery<Profile> query = em.createQuery(cq);
        List<Profile> profiles = query.getResultList();
        for(Profile p : profiles){
        	Hibernate.initialize(p.getProfilePicture());
        }
        
        return profiles;
	}
	
	public List<Profile> findFollowers(Integer id){
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Profile> criteria = cb.createQuery(Profile.class);
		Root<Profile> queryRoot = criteria.from(Profile.class);
		criteria.where(cb.equal(queryRoot.get(Profile_.id), id));
		
		SetJoin<Profile, Profile> following = queryRoot.join(Profile_.reverse_friends);
		
		CriteriaQuery<Profile> cq = criteria.select(following);
        TypedQuery<Profile> query = em.createQuery(cq);
        List<Profile> profiles = query.getResultList();
        for(Profile p : profiles){
        	Hibernate.initialize(p.getProfilePicture());
        }
        
        return profiles;
	}
}
