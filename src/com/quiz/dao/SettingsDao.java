package com.quiz.dao;

import java.util.List;

import com.quiz.model.Settings;

public interface SettingsDao {
	void applySettings(Settings obz);
	List<Settings> outOf(String str);
}
