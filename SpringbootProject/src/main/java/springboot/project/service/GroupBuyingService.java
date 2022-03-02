package springboot.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.GroupBuyingDao;

@Service
public class GroupBuyingService {
	
	@Autowired
	GroupBuyingDao dao;

}
