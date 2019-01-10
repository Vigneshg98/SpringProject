package com.quiz.model;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "settingsDB")
public class Settings {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int zId;
	
	@Column(name = "Quiz_Name")
	private String zName;
	
	@Column(name = "Begin_Date")
	private Date zBegin;

	@Column(name = "End_Date")
	private Date zEnd;
	
	@Column(name = "Duration")
	private int zDuration;
	
	@Column(name = "Total_Marks")
	private int zMarks;
	
	public Settings() {
		super();
	}

	public int getzId() {
		return zId;
	}

	public void setzId(int zId) {
		this.zId = zId;
	}

	public String getzName() {
		return zName;
	}

	public void setzName(String zName) {
		this.zName = zName;
	}

	public Date getzBegin() {
		return zBegin;
	}

	public void setzBegin(Date zBegin) {
		this.zBegin = zBegin;
	}

	public Date getzEnd() {
		return zEnd;
	}

	public void setzEnd(Date zEnd) {
		this.zEnd = zEnd;
	}

	public int getzDuration() {
		return zDuration;
	}

	public void setzDuration(int zDuration) {
		this.zDuration = zDuration;
	}

	public int getzMarks() {
		return zMarks;
	}

	public void setzMarks(int zMarks) {
		this.zMarks = zMarks;
	}

		
}
