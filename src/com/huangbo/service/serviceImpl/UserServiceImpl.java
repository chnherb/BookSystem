package com.huangbo.service.serviceImpl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huangbo.common.CommonService;
import com.huangbo.entity.Manager;
import com.huangbo.service.UserServer;

@Service
public class UserServiceImpl implements UserServer{
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@Override
	public Manager getManager(String id) {
		Manager manager = (Manager)commonService.getClass(Manager.class, id);
		
		return manager;
	}
}
