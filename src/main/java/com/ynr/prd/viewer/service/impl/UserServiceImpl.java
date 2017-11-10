package com.ynr.prd.viewer.service.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ynr.prd.viewer.model.Role;
import com.ynr.prd.viewer.model.User;
import com.ynr.prd.viewer.repository.RoleRepository;
import com.ynr.prd.viewer.repository.UserRepository;
import com.ynr.prd.viewer.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public void saveUser(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setActive(1);
		// Role table has to be created first and then findbyrole has been passed to get
		// the id's of it..Argument has been passed as requested_user in app at the time
		// of registration.Once user logged in user have provision
		// to create the user that has been sent as Argument APP_USER.
		Role userRole = roleRepository.findByRole("ADMIN");
		userRole.setDescription("Role has been created via App !!!");
		userRole.setCreatedBy("Admin");
		userRole.setCreatedDate(new Date(System.currentTimeMillis()));
		userRole.setActive(1);
		user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
		userRepository.save(user);
	}

	@Override
	public List<User> findAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public void delete(Integer id) {
		long userId = id;
		userRepository.delete(userId);
	}

}