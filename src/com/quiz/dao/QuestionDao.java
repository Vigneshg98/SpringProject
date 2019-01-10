package com.quiz.dao;

import java.util.List;

import com.quiz.model.Question;

public interface QuestionDao {
	void insertQuestion(Question obq);
	List<Question> getQuestions();
	String getQuesId(List<String> selectedQ);
	List<Question> getDSQuestions();
	List<Question> getCQuestions();
}
