package com.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.dao.StudentDao;
import com.quiz.model.Student;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDao studentDao;
	
	@Override
	@Transactional
	public void evaluate(Student stu) {
		studentDao.evaluate(stu);
	}
	
	@Override
	@Transactional
	public List<Student> getData() {
		return studentDao.getData();
	}
}
