package com.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.dao.SettingsDao;
import com.quiz.model.Settings;

@Service
public class SettingsServiceImpl implements SettingsService {
	@Autowired
	SettingsDao settingsDao;
	
	@Override
	@Transactional
	public void applySettings(Settings obz) {
		settingsDao.applySettings(obz);
	}

	@Override
	@Transactional
	public List<Settings> outOf(String str) {
		return settingsDao.outOf(str);
	}
	
}
