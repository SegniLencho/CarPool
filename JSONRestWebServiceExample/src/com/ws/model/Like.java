package com.ws.model;

import java.sql.Date;
import java.time.LocalDate;

public class Like {
	private int likeId;
	private Post post;
	private User user;
	private Date dateCreated;
	private Date dateUpdated;

	public Like() {
	}

	public Like(int likeId, Post post, User user, Date dateCreated, Date dateUpdated) {
		this.likeId = likeId;
		this.post = post;
		this.user = user;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
	}

	public Like(int likeId, Date createdDate, Date updatedDate) {
		this.likeId = likeId;
		this.dateCreated = createdDate;
		this.dateUpdated = updatedDate;
	}

	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	@Override
	public String toString() {
		return "Like [likeId=" + likeId + ", post=" + post + ", user=" + user + ", dateCreated=" + dateCreated
				+ ", dateUpdated=" + dateUpdated + "]";
	}

}
