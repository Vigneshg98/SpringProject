package com.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.dao.UserDao;
import com.quiz.model.UserRegister;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	
	@Override
	@Transactional
	public void insertUser(UserRegister ur) {
		userDao.insertUser(ur);
	}

	@Override
	@Transactional
	public List<UserRegister> checkUser() {
		return userDao.checkUser();
	}
	
}
