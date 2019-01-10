package com.quiz.service;

import java.util.List;

import com.quiz.model.Settings;

public interface SettingsService {
	void applySettings(Settings obz);
	List<Settings> outOf(String str);
}
