package com.quiz.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quiz.model.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	SessionFactory sf;
	
	@Override
	public void insertQuestion(Question obq) {
		Session session = sf.getCurrentSession();
		session.save(obq);
	}
	
	@Override
	public List<Question> getQuestions(){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Question");
		List<Question> ob = query.list();
		return ob;
		
	}
	
	String qIdString = "#";
	@Override
	public String getQuesId(List<String> selectedQ) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Question");
		List<Question> ob = query.list();
		for(String t1: selectedQ) {
			qIdString = qIdString.concat(t1+"#");
		}
		return qIdString;
	}

	@Override
	public List<Question> getCQuestions() {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Question where syllabus = 'C'");
		List<Question> ob1 = query.list();
		return ob1;
	}
	
	@Override
	public List<Question> getDSQuestions() {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Question where syllabus = 'DS'");
		List<Question> ob2 = query.list();
		return ob2;
	}
}
