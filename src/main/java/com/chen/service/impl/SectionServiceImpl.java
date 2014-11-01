package com.chen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.SectionDao;
import com.chen.entity.Section;
import com.chen.service.SectionService;

@Service
public class SectionServiceImpl implements SectionService {
	
	@Autowired
	private SectionDao	sectionDao;

	public List<Section> findSection() {
		// TODO Auto-generated method stub
		return sectionDao.findAll();
	}
}
