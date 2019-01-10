package com.quiz.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.quiz.model.Settings;
import com.quiz.model.Student;

@Repository
public class SettingsDaoImpl implements SettingsDao {
	@Autowired
	SessionFactory sf;
	
	@Override
	public void applySettings(Settings obz) {
		Session session = sf.getCurrentSession();
		session.save(obz);
	}
	
	@Override
	public List<Settings> outOf(String str) {
		Session session = sf.getCurrentSession();
		Query query=session.createQuery("from Settings s where s.zName ='"+str+"'");
		List<Settings> ob = query.list();
		return ob;
	}
}
