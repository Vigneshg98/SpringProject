package com.quiz.service;

import java.util.List;

import com.quiz.model.UserRegister;

public interface UserService {
	void insertUser(UserRegister ur);
	List<UserRegister> checkUser();
}
