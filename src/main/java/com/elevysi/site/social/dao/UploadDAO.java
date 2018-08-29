package com.elevysi.site.social.dao;

import java.util.List;

import com.elevysi.site.social.entity.Upload;

public interface UploadDAO extends AbstractDAO<Upload, Integer>{
	public Upload findByKeyIdentification(String key);
	public List<Upload> findByLinkTableOpposite(String linkTable);
	public List<Upload> findByLinkIDAndLinkTable(Integer linkID, String linkTable);

}
