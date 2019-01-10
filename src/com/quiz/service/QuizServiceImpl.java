package com.quiz.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.dao.QuizDao;
import com.quiz.model.Quiz;

@Service
public class QuizServiceImpl implements QuizService {
	@Autowired
	QuizDao quizDao;
	
	@Override
	@Transactional
	public void createQuiz(Quiz obquiz) {
		quizDao.createQuiz(obquiz);
	}
	
	@Override
	@Transactional
	public List<Quiz> getDetails() {
		return quizDao.getDetails();
	}
	
	@Override
	@Transactional
	public List<Quiz> getPartDetails(String id) {
		return quizDao.getPartDetails(id);
	}
	
}
