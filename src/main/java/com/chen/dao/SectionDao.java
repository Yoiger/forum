package com.chen.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chen.entity.Section;

public interface SectionDao extends JpaRepository<Section, Integer>{
	
}
