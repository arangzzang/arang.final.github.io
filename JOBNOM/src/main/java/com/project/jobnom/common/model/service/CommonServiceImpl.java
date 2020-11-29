package com.project.jobnom.common.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobnom.common.model.dao.CommonDao;
import com.project.jobnom.common.model.vo.Login;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDao dao;
	@Autowired
	SqlSession session;
	
	@Override
	public Login commonLogin(Map login) {
		return dao.commonLogin(session, login);
	}

}
