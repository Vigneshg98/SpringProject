package com.quiz.service;

import java.util.List;

import com.quiz.model.Student;

public interface StudentService {
	void evaluate(Student stu);
	List<Student> getData();
}
