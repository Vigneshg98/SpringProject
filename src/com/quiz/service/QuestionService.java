package com.quiz.service;

import java.util.List;

import com.quiz.model.Question;

public interface QuestionService {
	void insertQuestion(Question obq);
	List<Question> getQuestions();
	String getQuesId(List<String> selectedQ);
	List<Question> getDSQuestions();
	List<Question> getCQuestions();
}

