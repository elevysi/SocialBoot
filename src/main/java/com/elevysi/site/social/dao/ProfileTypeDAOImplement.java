package com.elevysi.site.social.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.elevysi.site.social.entity.ProfileType;

@Repository
@Transactional
public class ProfileTypeDAOImplement extends AbstractDAOImpl<ProfileType, Integer> implements ProfileTypeDAO{

}
