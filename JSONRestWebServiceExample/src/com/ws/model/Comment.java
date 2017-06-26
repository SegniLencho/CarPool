package com.ws.model;

import java.sql.Date;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class Comment {
	private int commentId;
	private String comment;
	private Date dateCreated;
	private Date dateUpdated;

	private User user;
	private Post post;

	public Comment() {
	}

	public Comment(int commentId, String comment, Date dateCreated, Date dateUpdated, User user, Post post) {
		this.commentId = commentId;
		this.comment = comment;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
		this.user = user;
		this.post = post;
	}

	public Comment(int commentId, String comment, Date createdDate, Date dateUpdated) {
		this.commentId = commentId;
		this.comment = comment;
		this.dateCreated = createdDate;
		this.dateUpdated = dateUpdated;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", comment=" + comment + ", dateCreated=" + dateCreated
				+ ", dateUpdated=" + dateUpdated + ", user=" + user + ", post=" + post + "]";
	}

}
