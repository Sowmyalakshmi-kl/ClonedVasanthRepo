package com.ynr.prd.viewer.service;

import java.util.List;

import com.ynr.prd.viewer.model.User;

public interface UserService {
	
	public User findUserByEmail(String email);

	public void saveUser(User user);

	public List<User> findAllUsers();

	public void delete(Integer id);
}
