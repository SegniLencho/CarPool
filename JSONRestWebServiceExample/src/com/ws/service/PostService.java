package com.ws.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.ws.model.Comment;
import com.ws.model.Post;

@Path("/PostService")
public class PostService {
	DAO dataacess = new DAO();

	@GET
	@Path("/userpost")
	@Produces(MediaType.APPLICATION_JSON)
	public String getUserPosts(@QueryParam("userId") String uId) {
		Gson gson = new Gson();
		List<Post> listPost = new ArrayList<>();
		listPost = dataacess.getUserPosts(uId);
		return gson.toJson(listPost);
	}

	@GET
	@Path("/posts")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAskingPosts(@QueryParam("type") int type) {
		Gson gson = new Gson();
		List<Post> listPost = new ArrayList<>();
		listPost = dataacess.getRidePosts(type);
		return gson.toJson(listPost);
	}
	
	@GET
	@Path("/count")
	@Produces(MediaType.APPLICATION_JSON)
	public String getAllCount() {
		Gson gson = new Gson();
		int count;
		count = DAO.countPost();
		return gson.toJson(count);
	}
	
	@GET
	@Path("/loadmore")
	@Produces(MediaType.APPLICATION_JSON)
	public String loadMore(@QueryParam("userId") int userId, @QueryParam("index") int index) {
		Gson gson = new Gson();
		List<Post> listPost = new ArrayList<>();
		listPost = dataacess.loadMore(userId,index);
		return gson.toJson(listPost);
	}
	
	
	@GET
	@Path("/moreoffer")
	@Produces(MediaType.APPLICATION_JSON)
	public String moreGiving(@QueryParam("type") int userId, @QueryParam("index") int index) {
		Gson gson = new Gson();
		List<Post> listPost = new ArrayList<>();
		listPost = dataacess.loadMore(userId,index);
		return gson.toJson(listPost);
	}
	
	@GET
	@Path("/comments")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Comment> getComments(@QueryParam("postId") int postId) {
		List<Comment> listPost = new ArrayList<>();
		System.out.println(postId);
		listPost = DAO.getComments(postId);
		return listPost;
	}
}
