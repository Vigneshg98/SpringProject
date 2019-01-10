package com.quiz.dao;

import java.util.List;

import com.quiz.model.UserRegister;

public interface UserDao {
	void insertUser(UserRegister ur);
	List<UserRegister> checkUser();
}
