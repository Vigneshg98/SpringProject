package com.quiz.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quiz.model.Student;

@Repository
public class StudentDaoImpl implements StudentDao {
	
	@Autowired
	SessionFactory sf;
	
	@Override
	public void evaluate(Student stu) {
		Session session = sf.getCurrentSession();
		String ans = stu.getAnswer();
		session.saveOrUpdate(stu);
	}
	
	@Override
	public List<Student> getData() {
		Session session=sf.getCurrentSession();
		Query query=session.createQuery("from Student");
		List<Student> ob = query.list();
		return ob;
	}
}
