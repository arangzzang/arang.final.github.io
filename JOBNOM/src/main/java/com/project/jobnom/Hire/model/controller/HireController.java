package com.project.jobnom.Hire.model.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.jobnom.Hire.model.service.HireService;
import com.project.jobnom.Hire.model.service.annoService;
import com.project.jobnom.Hire.model.vo.Interestedrcruitment;
import com.project.jobnom.Hire.model.vo.Recruitment;
import com.project.jobnom.Hire.model.vo.Support;
import com.project.jobnom.common.model.vo.Login;
import com.project.jobnom.common.pagebar.PageBarFactory;
import com.project.jobnom.enterprise.model.vo.Category2;
import com.project.jobnom.enterprise.model.vo.Enterprise;
import com.project.jobnom.member.model.service.MemberService;
import com.project.jobnom.member.model.vo.Member;


@Controller
@SessionAttributes("commonLogin")
public class HireController {
	
	@Autowired
	protected JavaMailSender mailSender;
	
	@Autowired
	private HireService service;
	
	@Autowired
	private MemberService mService;

	@Autowired
	private annoService service2;

	@RequestMapping("/Hire/HireHome.do")
	public ModelAndView HireHome(HttpSession session,ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, String memNo) {
		// 공고 리스트들 출력해주는곳

		List<Map> re = service.HireHomeRecruitmentList(cPage, numPerpage);
		mv.addObject("re", re);
		System.out.println("re 머냐" + re);
		
		//여긴회원정보만 보여주는곳
		System.out.println(memNo);
		List<Map> m = service.MemberList(memNo);
		mv.addObject("m", m);
		
		System.out.println("머지" + m);
		
		//회원맞춤 스와이프 추천 공고
		/*
		 * List<Map> fitM = service.MemberFitList(memNo);
		 * System.out.println("fitM"+fitM); mv.addObject("fitM", fitM);
		 */
		
		
		List<Recruitment>  rec = service.recList();
		
		
		List<Member>  categoryAll = service.categoryAll(memNo);
	
 
		// 페이징바
		int totalData = service.selectCount(); /* 이거페이지바 */
		System.out.println("페이지바" + totalData);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalData, cPage, numPerpage, memNo, "HireHome.do"));
		mv.addObject("totalData", totalData);
		mv.addObject("rec", rec);
		mv.addObject("categoryAll", categoryAll);
		
		

	
		
		mv.setViewName("Hire/HireHome");
		return mv;
	}

	@RequestMapping("/Hire/HireMyHire.do")
	public ModelAndView HireMyHire(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, String memNo) {
		System.out.println("허히");
		System.out.println("맴버번호" + memNo);
		List<Support> support = service.HireMyHire(memNo, cPage, numPerpage);

		mv.addObject("support", support);
		System.out.println(support);
		int totalDataSu = service.selectSuppertCount(memNo); // 이건 지원한 공고 갯수
		int totalDataIn = service.selectInterestedrcruitmentCount(memNo); // 이건 즐겨찾기 갯수
		mv.addObject("totalDataSu", totalDataSu);
		mv.addObject("totalDataIn", totalDataIn);
		mv.addObject("pageBar", PageBarFactory.getPageBar3(totalDataSu, cPage, numPerpage, memNo, "HireMyHire.do"));

		mv.setViewName("Hire/HireMyHire");
		return mv;

	}

	@RequestMapping("/Hire/HireFavorites.do")
	public ModelAndView HireFavorites(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, String memNo) {
		System.out.println("웅웅");
		System.out.println("웅웅" + memNo);
		List<Interestedrcruitment> i = service.HireFavorites(memNo, cPage, numPerpage);

		mv.addObject("i", i);
		System.out.println(i);
		int totalDataSu = service.selectSuppertCount(memNo); // 이건 지원한 공고 갯수
		int totalDataIn = service.selectInterestedrcruitmentCount(memNo); // 이건 즐겨찾기 갯수
		mv.addObject("totalDataSu", totalDataSu);
		mv.addObject("totalDataIn", totalDataIn);

		mv.addObject("pageBar", PageBarFactory.getPageBar4(totalDataIn, cPage, numPerpage, memNo, "HireFavorites.do"));
		mv.setViewName("Hire/HireFavorites");
		return mv;
	}

	@RequestMapping("/Hire/HireAnnouncement.do")
	public ModelAndView HireAnnouncement(ModelAndView mv) {
	
		 
		mv.setViewName("Hire/HireAnnouncement");
		return mv;

	
	}

	@RequestMapping("/Hire/insertReview2.do")
	public String insertReview2(HttpServletRequest request,Model m) throws Exception {
		
		
		
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String ent_no = request.getParameter("ent_no"); //기업번호
		paramMap.put("ent_no", ent_no);
		String review_title = request.getParameter("review_title"); //기업 타이틀
		paramMap.put("review_title", review_title);
		String mem_no = request.getParameter("mem_no"); //멤버번호
		paramMap.put("mem_no", mem_no);
		String review_contents = request.getParameter("review_contents"); //리뷰내용
		paramMap.put("review_contents", review_contents);
		String review_satisfaction = request.getParameter("review_satisfaction"); //사내만족도
		paramMap.put("review_satisfaction", review_satisfaction);
		String review_welfare = request.getParameter("review_welfare"); //복지 및 급여평점
		paramMap.put("review_welfare", review_welfare);
		String review_promotion = request.getParameter("review_promotion"); //승진 기회 및 가능성 평점
		paramMap.put("review_promotion", review_promotion);
		String review_executive = request.getParameter("review_executive"); //경영진 평점
		paramMap.put("review_executive", review_executive);
		System.out.println("값들은 무엇"+paramMap);
		int result = service.insertReview(paramMap);
		
		Member mem = mService.mypageView(Integer.parseInt(mem_no));
		
		m.addAttribute("mem",mem);
		
		return "member/mypage/mypageFirst";
		
		
	}

	@RequestMapping("/Hire/supportingCompany.do")
	public String supportingCompany() {

		return "Hire/supportingCompany";
	}

//공소 강세 페이지에서 상세 버튼
	@RequestMapping("/Hire/anoDetail.do")
	public ModelAndView anoDetail(String memNo, HttpSession session,ModelAndView mv, String rec_no,HttpServletRequest request) throws Exception {
		System.out.println("혹시");
		System.out.println("nn"+memNo);
		System.out.println("nn"+rec_no);
		

		
		List<Map> r = service.selectRecruitmentList(rec_no);
		System.out.println("서비스 가기전" + rec_no);
//		mv.addObject(service.selectRecruitmentList(rec_no));
		mv.addObject("r", r);
		System.out.println("로고"+r);
		
		//즐겨찾기 테이블에서 공고 번호랑 멤버번호 가져와서 jsp에서 현제 로그인된 번호랑 비교하기위한 로직
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String rec_no1 = request.getParameter("rec_no");
		paramMap.put("rec_no", rec_no1);
		String memNo1 = request.getParameter("memNo");
		paramMap.put("memNo", memNo1);
		List<Interestedrcruitment> in=service2.selectIn(paramMap);
		System.out.println("이것은"+in);
		mv.addObject("in", in);
		List<Member> m = service2.selectMemberEmail(memNo);
		mv.addObject("m", m);
		System.out.println("멤버이메일"+m);
		//지원하기 했을때 이미지원한공고면 alert 띄워주기위한 로직
		
		List<Support> sp = service2.selectSupportApply(paramMap);
		mv.addObject("sp", sp);
		System.out.println("중복지원확인용"+sp);
		System.out.println(paramMap);
		
		mv.setViewName("Hire/anoDetail");
		return mv;
	} 

	// 이건 리뷰클릭하면 나오는 에이작스
	@RequestMapping("/Hire/reviewAVG.do")
	public ModelAndView reviewAVG(String ent_no, ModelAndView mv) {
		System.out.println("리뷰용" + ent_no);
		List<Map> r = service.selectReviewList(ent_no);
		/* mv.addObject(service.selectReviewList(ent_no)); */
		mv.addObject("r", r);
		
		System.out.println("리뷰"+r);
		mv.setViewName("Hire/anoReview");
		return mv;
	}


	
	@RequestMapping("/Hire/apply.do")
	public ModelAndView memberApply(ModelAndView mv,HttpServletRequest request, ModelMap mo, HttpSession session,Model model, int memNo, int recNo, String entName,String eEmail,String mEmail)
			throws Exception {
	System.out.println("==========="+mEmail);

		Map<String, Object> paramMap = new HashMap<String, Object>();

		int memNo1 = Integer.parseInt(request.getParameter("memNo"));
		paramMap.put("memNo", memNo1);
		int recNo1 = Integer.parseInt(request.getParameter("recNo"));
		paramMap.put("recNo", recNo1);
		String entName1 = request.getParameter("entName");
		paramMap.put("entName", entName1);
	
		int result = service.insertMemberApply(paramMap); //지원하기 INSERT구문
		
		List<Map> applyM= service.selectMemberApply(paramMap);

		

		
	
		    
		    String setfrom = eEmail;         //인사담당자한테 발송되는 이메일
		    String tomail = mEmail;    // 받는 사람 이메일
		    String title = 
		    		"JOBNOM을 통한 이력서가 마이페이지에서 확인하세요 도착했습니다 ";      // 제목
		    String content = 
		    		"안녕하세요."
				    		+ "잡놉입니다"
		    				
				    		+ "이력서를 확인하고  <Strong>채용</Strong>을 검토바랍니다";   // 내용
		    String setfrom2 = "dlscjfry2010@naver.com";     //이건 지원한 회원한테 보내는 이메일    
		    String tomail2 = "inhajun1995@gmail.com";    // 받는 사람 이메일
		    String title2 = 
		    		"JOBNOM을 통한 이메일 지원 완료 ";      // 제목
		    String content2 = 
		    		"안녕하세요."
				    		+ "잡놉입니다."
				    		+ "지원한 공고는 마이페이지에서 조회가 가능하며 마이페이지에 저장된 이력서 기준"
				    		+ "담당자에게 이메일을 통한 이메일 발송을 완료 하였습니다."
				    		+ "JOBNOM은 개인정보처리방침에 의거 개인정보를 JOBNOM 이외에 사용을 하지 않습니다."
				    		+ "-기타 문의 사항 및 개선 사항은 잡놈고객관리팀으로 연락바랍니다-"
				    		+ "당신이 취업하는 그날까지 JOBNOM은 여러분을 응원합니다."
				    		+ "대한 민국의 밝은 내일을 위해! 고용노동부에서의 취업 프로그램등을"
				    		+ "확인하세요 'http://www.moel.go.kr/index.do'";
		    String htmlContent = "당신의 임시 비밀번호는 <Strong>" + "pw" + "</Strong> 입니다. 사이트에 접속해서 로그인 후 비밀번호를 변경하세요.<br>";
			/*
			 * String setHtmlMsg=""; StringBuffer msg = new StringBuffer();
			 * msg.append("<html>"); msg.append("<body>"); msg.
			 * append("<a href='https://mvnrepository.com'><img src='https://mvnrepository.com/assets/images/392dffac024b9632664e6f2c0cac6fe5-logo.png' /></a>"
			 * ); msg.append("<hr>"); msg.append("<h3>HTML 메일 테스트</h3>");
			 * msg.append("<p>가입을 축하드립니다.</p>"); msg.append("<p>HTML 메일 테스트</p>");
			 * msg.append("</body>"); msg.append("</html>");
			 * content.setHtmlMsg(msg.toString());
			 */
			/*
			 * MimeMessage message = mailSender.createMimeMessage(); try {
			 * message.setSubject("[안내] 임시 비밀번호 발신 <관리자가 보낸메일>", "euc-kr"); String
			 * htmlContent = "당신의 임시 비밀번호는 <Strong>" + pw +
			 * "</Strong> 입니다. 사이트에 접속해서 로그인 후 비밀번호를 변경하세요.<br>"; htmlContent +=
			 * "<a href='http://localhost:9999/index.choon' target='_blank'>홈으로 이동</a>";
			 * message.setText(htmlContent, "euc-kr", "html"); message.setFrom(new
			 * InternetAddress("")); message.addRecipient(RecipientType.TO, new
			 * InternetAddress(email)); mailSender.send(message); } catch
			 * (MessagingException e) { }
			 */
	
		    
		    //나중에 파일보내기할때
		    String filename = "C:\\git\\FinalProject\\JOBNOM\\src\\main\\webapp\\resources\\image\\Hire\\resume.docx";                   // 파일 경로.
		    String filename2 = "C:\\git\\FinalProject\\JOBNOM\\src\\main\\webapp\\resources\\image\\Hire\\resume.docx";                   // 파일 경로.

		    try {     
		    //인사담당자용
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		      
		     //회원용
		      MimeMessage message2 = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");
		  //인사담당자한테 보내짐
		      messageHelper.setFrom(setfrom);   // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);      // 받는사람 이메일
		      messageHelper.setSubject(title);  // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);   // 메일 내용
		  //회원한테 보내짐
		      messageHelper2.setFrom(setfrom2);   // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper2.setTo(tomail2);      // 받는사람 이메일
		      messageHelper2.setSubject(title2);  // 메일제목은 생략이 가능하다
		      messageHelper2.setText(content2);   // 메일 내용
		      
		      // 파일첨부  
		      FileSystemResource fsr = new FileSystemResource(filename);
		      messageHelper.addAttachment("resume.docx",fsr); 
		      
		   // 파일첨부  
		      FileSystemResource fsr2 = new FileSystemResource(filename2);
		      messageHelper2.addAttachment("resume.docx",fsr2); 
		      mailSender.send(message);  
		      mailSender.send(message2); 
		    } catch(Exception e){ 

		    }
		    mv.addObject("applyM",applyM);
		    mv.setViewName("Hire/support");
		    return mv;

			
	}


	

	@RequestMapping("Hire/notFavorites.do")
	public ModelAndView deleteMember(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, HttpServletRequest request, Model model, int memNo, int recNo, int openCheck,int anoNum)
			throws Exception {
		System.out.println("오지");
		Map<String, Object> paramMap = new HashMap<String, Object>();

		int memNo1 = Integer.parseInt(request.getParameter("memNo"));
		paramMap.put("memNo", memNo1);
		int recNo1 = Integer.parseInt(request.getParameter("recNo"));
		paramMap.put("recNo", recNo1);
		int openCheck1 = Integer.parseInt(request.getParameter("openCheck"));
		paramMap.put("openCheck", openCheck1);
		System.out.println("오잉오잉"+paramMap);

		int result = service.notFavorites(paramMap);
		System.out.println(result);
		
		
		List<Recruitment> anolist = service2.anoList2(anoNum,cPage, numPerpage);

		
		int totalData = service.selectCount(); /* 이거페이지바 */
	
		mv.addObject("pageBar", PageBarFactory.getPageBar2(totalData, cPage, numPerpage, "notFavorites.do"));
		
		mv.addObject("anolist", anolist);
		mv.setViewName("Hire/announcementPage");
		return mv;

	}
	//내즐겨찾기 페이지에서 즐겨찾기 뺴기
	@RequestMapping("Hire/notFavorites2.do")
	public ModelAndView deleteMember2(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, HttpServletRequest request, Model model, String memNo, int recNo, int openCheck)
			throws Exception {
		System.out.println("오지");
		Map<String, Object> paramMap = new HashMap<String, Object>();

		int memNo1 = Integer.parseInt(request.getParameter("memNo"));
		paramMap.put("memNo", memNo1);
		int recNo1 = Integer.parseInt(request.getParameter("recNo"));
		paramMap.put("recNo", recNo1);
		int openCheck1 = Integer.parseInt(request.getParameter("openCheck"));
		paramMap.put("openCheck", openCheck1);
		System.out.println("오잉오잉"+paramMap);

		int result = service.notFavorites(paramMap);
		System.out.println(result);
		
		
		
		List<Interestedrcruitment> i = service.HireFavorites(memNo, cPage, numPerpage);
		mv.addObject("i", i);
		System.out.println(i);
		int totalDataSu = service.selectSuppertCount(memNo); // 이건 지원한 공고 갯수
		int totalDataIn = service.selectInterestedrcruitmentCount(memNo); // 이건 즐겨찾기 갯수
		mv.addObject("totalDataSu", totalDataSu);
		mv.addObject("totalDataIn", totalDataIn);
		
		
		mv.addObject("pageBar", PageBarFactory.getPageBar4(totalDataIn, cPage, numPerpage,memNo, "HireFavorites.do"));
	
		mv.setViewName("Hire/HireFavorites");
		return mv;

	}
 
	// 즐겨찾기 스크립트
	@RequestMapping("/Hire/favorites.do")
	public ModelAndView memberFavorites(HttpSession session,ModelAndView mv, HttpServletRequest request, Model model, int memNo, int recNo,int anoNum,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage) throws Exception {
		
		
		
		
		System.out.println("나오렴");
		System.out.println("나오니?" + memNo);
		System.out.println("나오니?" + recNo);
		System.out.println("anoNum?" + anoNum);

		Map<String, Object> paramMap = new HashMap<String, Object>();

		int memNo1 = Integer.parseInt(request.getParameter("memNo"));
		paramMap.put("memNo", memNo1);
		int recNo1 = Integer.parseInt(request.getParameter("recNo"));
		paramMap.put("recNo", recNo1);

		System.out.println(paramMap);

		int result = service.recFavorites(paramMap);
		
		List<Recruitment> anolist = service2.anoList2(anoNum,cPage, numPerpage);
		System.out.println("anolist리스트" + anolist);

		int totalData = service2.selectCount(); /* 이거페이지바 */
		//System.out.println("공고페이지바" + totalData);
		mv.addObject("pageBar", PageBarFactory.getPageBar2(totalData, cPage, numPerpage, "favorites.do"));

		mv.addObject("anolist", anolist);
		mv.setViewName("Hire/announcementPage");
		return mv;
	}

	@RequestMapping("/Hire/reviewSearch.do")
	@ResponseBody
	public String streamAjax(ModelAndView mv,String key) throws Exception {

		System.out.println("되라");
		System.out.println(key);
		List<Enterprise> list = service.selectOneRecruitment(key);
		System.out.println("되라" + list);
		System.out.println(list);
		String csv="";
		for(int i=0;i<list.size();i++) {
			if(i!=0)  csv+=",";
			csv+=list.get(i).getEntName();
		
		}
		System.out.println(csv);

		return csv;
		
		/* return csv!=null?"true":"false"; */
	}

	@RequestMapping("/Hire/reviewSearch2.do")
	@ResponseBody
	public String streamAjax2(ModelAndView mv,String key) throws Exception {

		System.out.println("되라");
		System.out.println(key);
		List<Enterprise> list = service.reviewSearch2(key);
		System.out.println("되라" + list);
		System.out.println(list);
		String csv2="";
		for(int i=0;i<list.size();i++) {
			if(i!=0)  csv2+=",";
			csv2+=list.get(i).getEntNo();
		
		}
		System.out.println(csv2);

		return csv2;
	}
	
	@RequestMapping("/Hire/reviewSearch3.do")
	@ResponseBody
	public String streamAjax3(ModelAndView mv,String key) throws Exception {

		System.out.println("되라");
		Enterprise list = service.reviewSearch3(key);
		System.out.println("세번쨰" + list);
		

		return list!=null?"false":"true";
	}
	//스와이퍼 눌렀을때 정보 뜨게 하느느 에이작스 추천공고
	@RequestMapping("/Hire/swiper.do")
	public ModelAndView swiper( ModelAndView mv,String rec_no,String rec_category, HttpServletRequest request) throws Exception {
		System.out.println("혹시");
		System.out.println("??"+rec_no);
		System.out.println("??"+rec_category);
		List<Recruitment> r = service.swiper(rec_no);
		System.out.println("로고"+r);
		
		
		 List<Member> m = service.membercate2(rec_category);
		mv.addObject("fitM",r);
		mv.addObject("m",m);
		System.out.println("ss"+m);
		
	
		mv.setViewName("Hire/findingMeDetail");
		return mv;
	} 
	
	//마이페이지에서 리뷰삭제하는 곳
		@RequestMapping("/Hire/deleteReview.do")
		public String deleteReview( Model m,String reviewNo,String memNo, HttpServletRequest request,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage) throws IOException {
			System.out.println("??"+reviewNo);
			 List<Map> mem = service.mypageView();
			List<Map> review = service.deleteReview(reviewNo);
			System.out.println("로고"+review);
		
			m.addAttribute("r",review);
			 //리뷰갯수 카운트
			 int ReviewCount = service.selectReviewCount(memNo);
			 
			 m.addAttribute("ReviewCount",ReviewCount);
			 m.addAttribute("mem",mem);
			 m.addAttribute("review",review);
			 
			 m.addAttribute("pageBar", PageBarFactory.getPageBar8(ReviewCount, cPage, numPerpage, memNo, "insertReview.do"));
				
			

		 return "Hire/insertReview";
			
		} 
	
	

}
