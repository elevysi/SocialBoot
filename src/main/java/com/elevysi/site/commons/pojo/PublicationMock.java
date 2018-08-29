package com.elevysi.site.commons.pojo;

//import com.elevysi.site.blog.entity.Album;
//import com.elevysi.site.blog.entity.Play;
//import com.elevysi.site.blog.entity.Post;
//import com.elevysi.site.blog.entity.Publication;

public class PublicationMock {
	
	public static enum ChildType{
		POST,
		PLAY,
		ALBUM
	}
	
	private Integer id;
	private ChildType childType;
	private String displayField;
	private String extra;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public ChildType getChildType() {
		return childType;
	}
	public void setChildType(ChildType childType) {
		this.childType = childType;
	}
	public String getDisplayField() {
		return displayField;
	}
	public void setDisplayField(String displayField) {
		this.displayField = displayField;
	}
	public String getExtra() {
		return extra;
	}
	public void setExtra(String extra) {
		this.extra = extra;
	}
	
//	public PublicationMock createMockFromPublication(Publication publication){
//		this.setId(publication.getId());
//		
//		Post post = publication.getPost();
//		if(post != null){
//			this.setChildType(ChildType.POST);
//			this.setDisplayField(post.getTitle());
//			this.setExtra(post.getContent());
//		}
//		Play play = publication.getPlay();
//		if(play != null){
//			this.setChildType(ChildType.PLAY);
//			this.setDisplayField(play.getTitle());
//			this.setExtra(play.getDescription());
//		}
//		Album album = publication.getAlbum();
//		if(album != null){
//			this.setChildType(ChildType.ALBUM);
//			this.setDisplayField(album.getName());
//			this.setExtra(album.getDescription());
//		}
//		
//		return this;
//		
//		
//	}

}
