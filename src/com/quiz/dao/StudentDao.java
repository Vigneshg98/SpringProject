package com.quiz.dao;

import java.util.List;

import com.quiz.model.Student;

public interface StudentDao {
	void evaluate(Student stu);
	List<Student> getData();
}
