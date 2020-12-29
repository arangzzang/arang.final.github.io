package com.project.jobnom.Hire.model.service;

import java.util.List;
import java.util.Map;

import com.project.jobnom.Hire.model.vo.Interestedrcruitment;
import com.project.jobnom.Hire.model.vo.Recruitment;
import com.project.jobnom.Hire.model.vo.Review;
import com.project.jobnom.member.model.vo.Member;
import com.project.jobnom.Hire.model.vo.Support;
import com.project.jobnom.enterprise.model.vo.Enterprise;

public interface HireService {

	int insertReview(Map paramMap);
	
	List<Map>HireHomeRecruitmentList(int cPage, int numPerpage);

	int selectCount();
	
	List<Map> MemberList(String memNo);
	
	
	List<Recruitment> RecruitmentList();
	

	List<Map> reviewStar();
	
	List<Map>  selectRecruitmentList(Map paramMap);
	
	List<Map> selectReviewList(String ent_no);
	
	//리뷰화면전환
	Member selectMember(int memNo);

	int insertMemberApply(Map paramMap);
	
	int recFavorites(Map paramMap);
	
	int notFavorites(Map paramMap);
	
	List<Support> HireMyHire(String memNo,int cPage, int numPerpage);

	int selectSuppertCount();
	
	int selectInterestedrcruitmentCount();
	
	List<Interestedrcruitment> HireFavorites(String memNo,int cPage, int numPerpage);

	List<Map> selectOneRecruitment (String key);


	List<Recruitment> recSerch(String rec_no);
	


}
