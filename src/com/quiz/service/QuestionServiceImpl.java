package com.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.dao.QuestionDao;
import com.quiz.model.Question;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao questionDao;
	
	@Override
	@Transactional
	public void insertQuestion(Question obq) {
		questionDao.insertQuestion(obq);
	}
	
	@Override
	@Transactional
	public List<Question> getQuestions() {
		return questionDao.getQuestions();
	}

	@Override
	@Transactional
	public String getQuesId(List<String> selectedQ) {
		return questionDao.getQuesId(selectedQ);
	}

	@Override
	@Transactional
	public List<Question> getCQuestions() {
		return questionDao.getCQuestions();
	}
	
	@Override
	@Transactional
	public List<Question> getDSQuestions() {
		return questionDao.getDSQuestions();
	}
}