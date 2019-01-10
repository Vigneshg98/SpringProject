package com.quiz.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quizdb")
public class Quiz {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int quizId;
	
	@Column(name="Quiz_Name")
	private String quizName;
	
	@Column(name="URL")
	private String url;
	
	@Column(name="Ques_Set")
	private String ques_Set;
	
	public String getQues_Set() {
		return ques_Set;
	}

	public void setQues_Set(String ques_Set) {
		this.ques_Set = ques_Set;
	}
	
	public int getQuizId() {
		return quizId;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}

	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
