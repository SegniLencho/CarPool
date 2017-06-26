package com.dataaccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.User;

public class DataAcess implements dataaccessfacade {

	@Override
	public int login(String username, String password) {
		ResultSet rs = null;
		java.sql.Connection connection = null;
		Statement statement = null;

		String query = "SELECT * FROM users WHERE username= '" + username + "' AND password= '" + password + "'  ";
		try {
			connection = JDBCMySQLConnection.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery(query);

			if (rs.next()) {
				int userId = rs.getInt("userId");
				return userId;
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

		return -1;
	}

	private static void updateQuery(String query) {

		java.sql.Connection connection = null;
		Statement statement = null;

		try {
			connection = JDBCMySQLConnection.getConnection();
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

	public static void addPost(int userId, String postComment, int postType) {
		String query = "INSERT INTO posts (userid,post,posttype)VALUES('" + userId + "','" + postComment + "','"
				+ postType + "')";
		updateQuery(query);
	}

	public static User getUserData(int userid) {
		ResultSet rs = null;
		java.sql.Connection connection = null;
		Statement statement = null;
		// int userId=0;
		User user = new User();
		String query = "SELECT * FROM users WHERE userid= '" + userid + "'  ";

		try {
			connection = JDBCMySQLConnection.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery(query);

			while (rs.next()) {
				user.setUserId(rs.getInt("userid"));
				user.setBirthDate(rs.getInt("birthyear"));
				user.setGender(rs.getString("gender"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setState(rs.getString("state"));
				user.setCity(rs.getString("city"));
				user.setStreet(rs.getString("street"));
				user.setZipcode(rs.getInt("zipcode"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				user.setDateCreated(rs.getTimestamp("datecreated"));
				user.setDateUpdated(rs.getTimestamp("dateupdated"));

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
		return user;
	}

	public static int countPost() {
		ResultSet rs = null;
		java.sql.Connection connection = null;
		Statement statement = null;
		int count = 0;

		String query = "SELECT COUNT(*) FROM posts";

		try {
			connection = JDBCMySQLConnection.getConnection();
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

	public static void updateProfile(int userid, String firstName, String lastName, String gender, int birthDate,
			String email, String city, String state, String street, int zipcode, String password, String username) {
		// int userid= getUserData(username,password).getUserId();
		System.out.println(userid);

		String query = "UPDATE  users SET firstname = '" + firstName + "'," + "gender = '" + gender + "'," + "state = '"
				+ state + "'," + "city ='" + city + "'," + "street ='" + street + "'," + "zipcode = '" + zipcode + "',"
				+ "birthyear = '" + birthDate + "'," + "email = '" + email + "'," + "password='" + password + "',"
				+ "username ='" + username + "'," + "lastname = '" + lastName + "'WHERE userid = '" + userid + "'";

		updateQuery(query);
	}

	public static User getUserData(String username) {
		ResultSet rs = null;
		java.sql.Connection connection = null;
		Statement statement = null;
		// int userId=0;
		User user = new User();
		String query = "SELECT * FROM users WHERE username= '" + username + "'  ";

		try {
			connection = JDBCMySQLConnection.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery(query);

			while (rs.next()) {
				user.setUserId(rs.getInt("userid"));
				user.setBirthDate(rs.getInt("birthyear"));
				user.setGender(rs.getString("gender"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setState(rs.getString("state"));
				user.setCity(rs.getString("city"));
				user.setStreet(rs.getString("street"));
				user.setZipcode(rs.getInt("zipcode"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				user.setDateCreated(rs.getTimestamp("datecreated"));
				user.setDateUpdated(rs.getTimestamp("dateupdated"));

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
		return user;
	}
}