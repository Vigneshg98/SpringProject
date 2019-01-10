package com.quiz.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quiz.model.Question;
import com.quiz.model.Quiz;

@Repository
public class QuizDaoImpl implements QuizDao {
	@Autowired
	SessionFactory sf;
	
	@Override
	public void createQuiz(Quiz obquiz) {
		Session session = sf.getCurrentSession();
		session.save(obquiz);
	}
	
	@Override
	public List<Quiz> getDetails() {
		Session session=sf.getCurrentSession();
		Query query=session.createQuery("from Quiz");
		List<Quiz> ob = query.list();
		return ob;
	}
	
	@Override
	public List<Quiz> getPartDetails(String id) {
		Session session=sf.getCurrentSession();
		Query query=session.createQuery("from Quiz q where q.quizName ='"+id+"'" );
		List<Quiz> ob = query.list();
		return ob;
	}
}
