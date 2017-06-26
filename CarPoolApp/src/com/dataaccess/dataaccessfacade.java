package com.dataaccess;


public interface dataaccessfacade {
	public int login(String username, String password);

	public static void registerUser(String fname, String lname, String gender, int bdate, String email, String city,
			String state, String street, int zipcode) {
	};
}