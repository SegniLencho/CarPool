package com.ws.model;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Post {
	private int postId;
	private String postText;
	private int postType;
	private Date dateCreated;
	private Date dateUpdated;

	private User user;// who posted it
	private List<Like> like; // can have many likes
	private List<Comment> comment; // can have many comments

	public Post() {
	}

	public Post(int postId, String postText, int postType, Date dateCreated, Date dateUpdated) {
		this.postId = postId;
		this.postText = postText;
		this.postType = postType;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public int getPostType() {
		return postType;
	}

	public void setPostType(int postType) {
		this.postType = postType;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Like> getLike() {
		return like;
	}

	public void setLike(List<Like> like) {
		this.like = like;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", postText=" + postText + ", postType=" + postType + ", dateCreated="
				+ dateCreated + ", dateUpdated=" + dateUpdated + ", user=" + user + ", like=" + like + ", comment="
				+ comment + "]";
	}
}