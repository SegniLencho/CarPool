package com.ws.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ws.model.Comment;
import com.ws.model.Like;
import com.ws.model.Post;
import com.ws.model.User;

public class DAO {
	public synchronized List<Post> getUserPosts(String userId) {
		String postquery = "SELECT * FROM posts WHERE userId= '" + userId + "' ORDER BY dateupdated DESC LIMIT 5";
		return getPosts(postquery);
	}

	public synchronized List<Post> getRidePosts(int type) {
		String postquery = "SELECT * FROM posts WHERE posttype= '" + type + "' ORDER BY dateupdated DESC LIMIT 5";
		System.out.println(postquery);
		return getPosts(postquery);
	}

	public synchronized List<Post> loadMore(int type, int index) {
		
		index = index+2;
		if(countPost()>=index){
			String postquery = "SELECT * FROM posts WHERE postType= '" + type + "' ORDER BY dateupdated DESC LIMIT "+index+",2";
			System.out.println(postquery);
			return getPosts(postquery);
		}
		return null;
	}
	
  public synchronized List<Post> loadUserMore(int userId, int index) {
		
		index = index+2;
		if(countPost()>=index){
			String postquery = "SELECT * FROM posts WHERE userId= '" + userId + "' ORDER BY dateupdated DESC LIMIT "+index+",2";
			System.out.println(postquery);
			return getPosts(postquery);
		}
		return null;
	}

	public synchronized List<Post> getPosts(String query) {
		ResultSet postresult = null;

		Connection connection = null;
		Statement poststatement = null;

		List<Post> result = new ArrayList<>();
		String postquery = query;
		System.out.println(postquery);
		try {
			connection = MySQLConnection.getConnection();
			poststatement = connection.createStatement();

			postresult = poststatement.executeQuery(postquery);
			if (postresult != null) {
				User user = null;
				List<Comment> comments = new ArrayList<>();
				List<Like> likes = new ArrayList<>();
				while (postresult.next()) {
					int userId = postresult.getInt("userId");
					int postId = postresult.getInt("postid");
					String postText = postresult.getString("post");
					int postType = postresult.getInt("postType");
					Date dateCreated = postresult.getDate("datecreated");
					Date dateUpdated = postresult.getDate("dateupdated");
					Post post = new Post(postId, postText, postType, dateCreated, dateUpdated);

					user = getUser(userId);
					comments = getComments(postId);
					likes = getLikes(postId);
					
					post.setComment(comments);
					post.setLike(likes);
					post.setUser(user);
					
					
					result.add(post);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public boolean login(String username, String password) {
		ResultSet rs = null;
		java.sql.Connection connection = null;
		Statement statement = null;

		String query = "SELECT * FROM account WHERE username= '" + username + "' AND password= '" + password + "'  ";
		try {
			connection = MySQLConnection.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery(query);

			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return false;
	}

	private static void updateQuery(String query) {

		java.sql.Connection connection = null;
		Statement statement = null;

		try {
			connection = MySQLConnection.getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void registerUser(String firstName, String lastName, String gender, int birthDate, String email,
			String city, String state, String street, int zipcode, String password, String username) {
		String query = "INSERT INTO users (firstname,lastname,gender,birthyear,"
				+ "state,city,street,zipcode,password,username," + "email)" + "values('" + firstName + "','" + lastName
				+ "','" + gender + "','" + birthDate + "','" + state + "','" + city + "','" + street + "','" + zipcode
				+ "','" + password + "','" + username + "','" + email + "')";

		updateQuery(query);
	}

	public static User getUser(int userId) {
		ResultSet userresult = null;
		Connection connection = null;
		Statement userstatement = null;
		User user = null;
		try {
			connection = MySQLConnection.getConnection();
			userstatement = connection.createStatement();
			String userquery = "SELECT * FROM users WHERE userId= '" + userId + "'";
			userresult = userstatement.executeQuery(userquery);
			while (userresult.next()) {
				int id = userresult.getInt("userId");
				String fname = userresult.getString("firstName");
				String lname = userresult.getString("lastName");
				String email = userresult.getString("email");
				user = new User(id, fname, lname, email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return user;
	}

	public static List<Comment> getComments(int postId) {
		List<Comment> comments = new ArrayList<>();
		ResultSet commenntresult = null;
		Connection connection = null;
		Statement commentstatement = null;
		try {
			connection = MySQLConnection.getConnection();
			commentstatement = connection.createStatement();

			String commentquery = "SELECT * FROM comments WHERE postId= '" + postId + "'";
			commenntresult = commentstatement.executeQuery(commentquery);

			while (commenntresult.next()) {
				User user = null;
				int commentId = commenntresult.getInt("commentid");
				int userId = commenntresult.getInt("userId");
				String comment = commenntresult.getString("comment");
				Date createdDate = commenntresult.getDate("datecreated");
				Date createdUpdate = commenntresult.getDate("dateupdated");
				Comment c = new Comment(commentId, comment, createdDate, createdUpdate);
				
				user = getUser(userId);
				c.setUser(user);
				
				comments.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return comments;
	}

	public static List<Like> getLikes(int postId) {
		List<Like> likes = new ArrayList<>();
		ResultSet likeresult = null;
		Connection connection = null;
		Statement likestatement = null;
		try {
			connection = MySQLConnection.getConnection();
			likestatement = connection.createStatement();

			String likequery = "SELECT * FROM likes WHERE postId= '" + postId + "'";
			System.out.println(likequery);
			likeresult = likestatement.executeQuery(likequery);

			while (likeresult.next()) {
				User user = null;
				int likeId = likeresult.getInt("likeId");
				int userId = likeresult.getInt("userId");
				
				Date createdDate = likeresult.getDate("datecreated");
				Date updatedDate = likeresult.getDate("dateupdated");
				Like l = new Like(likeId,createdDate, updatedDate);
				
				user = getUser(userId);
				l.setUser(user);
				
				likes.add(l);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return likes;
	}
	
	public static int countPost() {
		ResultSet rs = null;
		java.sql.Connection connection = null;
		Statement statement = null;
		int count = 0;

		String query = "SELECT COUNT(*) FROM posts";

		try {
			connection = MySQLConnection.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery(query);

			while (rs.next()) {
				// int c= rs.getInt(1);
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return count;
	}
}
