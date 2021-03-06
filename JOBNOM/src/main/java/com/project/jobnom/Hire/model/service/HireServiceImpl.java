package com.project.jobnom.Hire.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobnom.Hire.model.dao.HireDao;
import com.project.jobnom.Hire.model.vo.Interestedrcruitment;
import com.project.jobnom.Hire.model.vo.Recruitment;
import com.project.jobnom.Hire.model.vo.Support;
import com.project.jobnom.enterprise.model.vo.Category2;
import com.project.jobnom.enterprise.model.vo.Enterprise;
import com.project.jobnom.member.model.vo.Member;
@Service
public class HireServiceImpl implements HireService {

	@Autowired
	private HireDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReview(Map paramMap ) {
		return dao.insertReview(session, paramMap);
	}

	@Override
	public List<Map> HireHomeRecruitmentList(int cPage, int numPerpage) {
		return dao.HireHomeRecruitmentList(session, cPage, numPerpage);
		
		
	}

	@Override
	public int selectCount() {
		return dao.selectCount(session);
	}

	
	@Override
	public List<Map> reviewStar() {
		return dao.reviewStar(session);
	}

	@Override
	public List<Map>  selectRecruitmentList(String rec_no) {
		return dao.selectRecruitmentList(session, rec_no);
	}

	@Override 
	public List<Map> selectReviewList(String ent_no) {
		return dao.selectReviewList(session, ent_no);
	}

	@Override
	public List<Recruitment> RecruitmentList() {
		return dao.RecruitmentList(session);
	}
	@Override
	public List<Map> MemberList(String memNo) {
		return dao.MemberList(session,memNo);
	}

	@Override
	public  int insertMemberApply(Map paramMap) {
		return dao.insertMemberApply(session, paramMap);
	}

	@Override
	public int recFavorites(Map paramMap) {
		return dao.recFavorites(session, paramMap);
	}

	@Override
	public int notFavorites(Map paramMap) {
		return dao.notFavorites(session,paramMap);
	}

	@Override
	public List<Support> HireMyHire(String memNo,int cPage, int numPerpage) {
		return dao.HireMyHire(session, memNo,cPage, numPerpage);
	}

	@Override
	public int selectSuppertCount(String memNo) {
		return dao.selectSuppertCount(session, memNo);
	}

	@Override
	public List<Interestedrcruitment> HireFavorites(String memNo, int cPage, int numPerpage) {
		return dao.HireFavorites(session,memNo,cPage,numPerpage);
	}

	@Override
	public int selectInterestedrcruitmentCount(String memNo) {
		return dao.selectInterestedrcruitmentCount(session, memNo);
	}

	@Override
	public List<Enterprise> selectOneRecruitment(String key) {
		return dao.selectOneRecruitment(session, key);
	}

	@Override
	public List<Recruitment> recSerch(String rec_no) {
		return dao.recSerch(session, rec_no);
	}

	@Override
	public List<Map> selectMemberApply(Map paramMap) {
		return dao.selectMemberApply(session, paramMap);
	}

	@Override
	public List<Map> MemberFitList(String memNo) {
		return dao.MemberFitList(session, memNo);
	}

	@Override
	public List<Enterprise> reviewSearch2(String key) {
		return dao.reviewSearch2(session, key);
	}

	@Override
	public Enterprise reviewSearch3(String key) {
		return dao.reviewSearch3(session,key);
	}

	@Override
	public List<Map> mypageView() {
		return dao.mypageView(session);
	}

	@Override
	public List<Recruitment> swiper(String rec_no) {
		return dao.swiper(session, rec_no);
	}

	@Override
	public List<Member> membercate2(String rec_category) {
		return dao.membercate2(session, rec_category);
	}

	@Override
	public List<Map> mypageReview(String memNo, int cPage, int numPerpage) {
		return dao.mypageReview(session, memNo, cPage, numPerpage);
	}

	@Override
	public int selectReviewCount(String memNo) {
		return dao.selectReviewCount(session, memNo);
	}

	@Override
	public List<Recruitment> recList() {
		return dao.recList(session);
	}

	@Override
	public List<Member> categoryAll(String memNo) {
		return dao.categoryAll(session,memNo);
	}

	@Override
	public List<Map> deleteReview(String reviewNo) {
		return dao.deleteReview(session, reviewNo);
	}

	
	
	
	
	
	
	
	
	

	
	
}
