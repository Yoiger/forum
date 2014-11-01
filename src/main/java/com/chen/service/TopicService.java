package com.chen.service;

import java.util.List;

import com.chen.entity.Topic;

public interface TopicService {
	public List<Topic> findTopic(int sectionid);
}
