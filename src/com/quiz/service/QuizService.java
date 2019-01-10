package com.quiz.service;

import java.util.List;

import com.quiz.model.Quiz;

public interface QuizService {
	void createQuiz(Quiz obquiz);
	List<Quiz> getDetails(); 
	List<Quiz> getPartDetails(String id);
}
