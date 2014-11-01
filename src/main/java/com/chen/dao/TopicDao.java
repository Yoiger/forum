package com.chen.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.chen.entity.Topic;

public interface TopicDao extends JpaRepository<Topic, Integer>{
	
	@Query("select t from Topic t where t.sectionid = ?")
	public List<Topic> findTopicBySectionid(int sectionid);
}
