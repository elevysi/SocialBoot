package com.elevysi.site.social.exception;

public class DomainObjectNotFoundException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long domainObjectID;
	
	

	public DomainObjectNotFoundException(long objectID){
		this.setDomainObjectID(objectID);
	}



	public long getDomainObjectID() {
		return domainObjectID;
	}



	public void setDomainObjectID(long domainObjectID) {
		this.domainObjectID = domainObjectID;
	}
	
}