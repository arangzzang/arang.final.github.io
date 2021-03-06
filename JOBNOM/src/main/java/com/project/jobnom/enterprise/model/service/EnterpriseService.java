package com.project.jobnom.enterprise.model.service;

import java.util.List;
import java.util.Map;

import com.project.jobnom.Hire.model.vo.Recruitment;
import com.project.jobnom.Hire.model.vo.Review;
import com.project.jobnom.common.model.vo.Login;
import com.project.jobnom.enterprise.model.vo.Applicant;
import com.project.jobnom.enterprise.model.vo.ApplyAd;
import com.project.jobnom.enterprise.model.vo.Banner;
import com.project.jobnom.enterprise.model.vo.Category2;
import com.project.jobnom.enterprise.model.vo.Enterprise;
import com.project.jobnom.enterprise.model.vo.Mammoth;
import com.project.jobnom.enterprise.model.vo.MemberDataC2;
import com.project.jobnom.enterprise.model.vo.PayData;
import com.project.jobnom.enterprise.model.vo.Score;
import com.project.jobnom.enterprise.model.vo.Support;
import com.project.jobnom.enterprise.model.vo.Worker;
import com.project.jobnom.resume.model.vo.Resume;

public interface EnterpriseService {
	// 기업 회원가입입력
	int enrollEnter(Enterprise ent);

	int insertApplyAd(ApplyAd ad);

	Enterprise findOneEnterprise(Login log);

	List<Support> selectSupport(int cPage, int numPerpage, Recruitment rec);

	int selectCount();

	int updateEnterprise(Enterprise ent);

	int entMembership(Login log);

	int insertBanner(Banner ban);

	List<Recruitment> selectRecruitment(int memNo, int cPage, int numPerpage);

	int selectRecruitmentCount(Enterprise ent);

	Resume selectResume(int memNo);

	int quit(Enterprise ent);

	List<Review> selectReviewList(int entNo, int cPage, int numPerpage);

	int selectReviewcount(int entNo);

	List<Recruitment> selectJoblist(Map param);

	int selectJobCount(int entNo);

	List<Category2> getC2();

	Enterprise findEmailEnterprise(Login log);

	// 카카오페이 결제
	Enterprise selectEnterprise(int entNo);

	List<MemberDataC2> memDataC2();

	List<MemberDataC2> entDataC2();

	List<PayData> payData();

	// 기업 버튼 클릭시 화면 -ys-
	List<Map> companyList();

	List<Map> companyList2();

	List<Map> companyList3();

	List<Map> companyList4();

	List<Map> companyList5();

	List<Map> companyList6();

	// 기업 검색결과 기업명 클릭시
	List<Map> companyInfo(int entNo);

	ApplyAd findAdByNo(String recNo);

	int updateApplyAd(ApplyAd ad);

	List<Worker> workerList();

	Mammoth getMammoth(int resno);
	
	List<Applicant> getApplicant(int recno, int cPage, int numPerpage);

	int selectSupportCount(int recno);
	
	List<Score> scoreList(int entNo);
	//기업 팔로잉
	int followEnt(Map param1);
	//기업 언팔로잉
	int unfollowEnt(Map param1);
	//기업 팔로잉 리스트
	List<Map> selectEntFollow();
}
