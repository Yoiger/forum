package com.chen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.TopicDao;
import com.chen.entity.Topic;
import com.chen.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService{
	
	@Autowired
	private TopicDao topicDao;
	
	public List<Topic> findTopic(int sectionid) {
		// TODO Auto-generated method stub
		return topicDao.findTopicBySectionid(sectionid);
	}
	
}
