package com.quiz.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quiz.model.Question;
import com.quiz.model.UserRegister;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sf;
	
	@Override
	public void insertUser(UserRegister ur) {
		Session session = sf.getCurrentSession();
		session.save(ur);
	}

	@Override
	public List<UserRegister> checkUser() {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from UserRegister");
		List<UserRegister> ob = query.list();
		return ob;
	}

}
