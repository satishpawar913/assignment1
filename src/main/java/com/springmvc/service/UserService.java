package com.springmvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.dao.UserDao;
import com.springmvc.model.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public int createUser(User user) {
		return this.userDao.saveUser(user);
	}

	public User showLogin(String em, String pwd) {
		return this.userDao.loginUser(em, pwd);
	}

	@Transactional
	public boolean isEmailAlreadyRegistered(String email) {
		return userDao.isEmailAlreadyRegistered(email);
	}

}
