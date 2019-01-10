package com.quiz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "questionDB")
public class Question {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int qId;
	
	@Column(name = "question")
	private String qQuestion;
	
	@Column(name = "option1")
	private String qOption1;
	
	@Column(name = "option2")
	private String qOption2;
	
	@Column(name = "option3")
	private String qOption3;
	
	@Column(name = "option4")
	private String qOption4;
	
	@Column(name = "correct")
	private String qCorrect;
	
	@Column(name = "syllabus")
	private String syllabus;
 	
	public Question() {
	}
	
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	
	public String getqQuestion() {
		return qQuestion;
	}
	public void setqQuestion(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public String getqOption1() {
		return qOption1;
	}
	public void setqOption1(String qOption1) {
		this.qOption1 = qOption1;
	}
	public String getqOption2() {
		return qOption2;
	}
	public void setqOption2(String qOption2) {
		this.qOption2 = qOption2;
	}
	public String getqOption3() {
		return qOption3;
	}
	public void setqOption3(String qOption3) {
		this.qOption3 = qOption3;
	}
	public String getqOption4() {
		return qOption4;
	}
	public void setqOption4(String qOption4) {
		this.qOption4 = qOption4;
	}
	public String getqCorrect() {
		return qCorrect;
	}
	public void setqCorrect(String qCorrect) {
		this.qCorrect = qCorrect;
	}

	public String getSyllabus() {
		return syllabus;
	}

	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	
	
}
