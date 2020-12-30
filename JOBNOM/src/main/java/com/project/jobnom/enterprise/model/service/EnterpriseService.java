package com.project.jobnom.enterprise.model.service;

import java.util.List;
import java.util.Map;

import com.project.jobnom.common.model.vo.Login;
import com.project.jobnom.enterprise.model.vo.ApplyAd;
import com.project.jobnom.enterprise.model.vo.Banner;
import com.project.jobnom.enterprise.model.vo.Enterprise;

public interface EnterpriseService {
	
	//기업 회원가입입력
	int enrollEnter(Enterprise ent);
	int insertApplyAd(ApplyAd ad);
	Enterprise findOneEnterprise(Login log);
	int updateEnterprise(Enterprise ent);
	int entMembership(Login log);
	int insertBanner(Banner ban);
	int quit(Enterprise ent);
	
	//기업 버튼 클릭시 화면 -ys-
	List<Map> companyList();
	List<Map> companyList2();
	List<Map> companyList3();
	List<Map> companyList4();
	List<Map> companyList5();
	List<Map> companyList6();
}
