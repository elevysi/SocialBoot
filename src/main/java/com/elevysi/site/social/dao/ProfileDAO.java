package com.elevysi.site.social.dao;

import java.util.List;

import javax.persistence.metamodel.SingularAttribute;

import com.elevysi.site.commons.pojo.OffsetPage;
import com.elevysi.site.commons.pojo.Page;
import com.elevysi.site.commons.pojo.Page.SortDirection;
import com.elevysi.site.social.entity.Profile;

public interface ProfileDAO extends AbstractDAO<Profile, Integer>{
	public Profile findByID(Integer id);
	public Profile findProfileByUserID(long userID);
	public Profile findByUsername(String username);
	public OffsetPage buildOffsetPage(int pageIndex, int size,  SingularAttribute sortField, SortDirection sortDirection);
	public List<Profile> getProfiles(Page page);
	public List<Profile> findFollowing(Integer id);
	public List<Profile> findFollowers(Integer id);
}
