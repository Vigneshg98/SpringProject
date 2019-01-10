package com.quiz.dao;

import java.util.List;

import com.quiz.model.Question;
import com.quiz.model.Quiz;

public interface QuizDao {
	void createQuiz(Quiz obquiz);
	List<Quiz> getDetails();
	List<Quiz> getPartDetails(String id);
}
