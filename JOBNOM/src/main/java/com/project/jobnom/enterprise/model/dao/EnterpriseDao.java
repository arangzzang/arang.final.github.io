package com.project.jobnom.enterprise.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.jobnom.enterprise.model.vo.Enterprise;

public interface EnterpriseDao {

	int enrollEnter(Enterprise ent, SqlSession session);
}
