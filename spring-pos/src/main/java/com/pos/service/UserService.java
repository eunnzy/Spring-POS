package com.pos.service;

import com.pos.dao.UserDao;
import com.pos.dto.User;

public class UserService {
	private UserDao userDao;
	
	public UserService(UserDao userDao) {
		this.userDao = userDao;
	}
	public void register(User user) {
		userDao.register(user);
	}
	
	public User login(String userId, String userPw) {
		return userDao.login(userId, userPw);
	}
	
	public int idCheck(String userId) {
		return userDao.idCheck(userId);
	}
	
	public int changePw(String userId, String userPw) {
		 return userDao.changePw(userId, userPw);
	}
}