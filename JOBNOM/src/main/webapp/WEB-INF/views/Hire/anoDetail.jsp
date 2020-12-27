<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*,com.project.jobnom.Hire.model.vo.Review" %>
<link rel="stylesheet" href="../resources/css/Hire/announcementPage.css">
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- <%
List<Review> r=(List)request.getAttribute("r");
%> --%>
<section id="content" style="margin-top: -158px; height: 1100px; ">

<div class="annoDetailAll" >
                  
                    <div class="annoDetailTitle">
                        <div class="annoDetailNum">
                            <div class="annoDetailLogeFlax">
                                <div class="annoDetailLoge"></div>
                            </div>
                            <div class="annoDetailTitleFlax">            
                                <div id="annoDetailTitle1">${r[0].REC_TITLE }</div>
                                
                                 <a href="#">
                                    <div class="annoDetailTitleFont" >${r[0].ENT_NAME }</div>
                                </a>
							
                            </div>
                        </div>
                     
                      <button class="apply" onclick="location.href='${path }/Hire/apply.do?memNo=${commonLogin.memNo}&recNo=${r[0].REC_NO}&entName=${r[0].ENT_NAME }'" >지원하기</a>
                       </button>
                       <c:choose>
                       <c:when test="${r[0].OPEN_CHECK ==1  && commonLogin !=null && commonLogin.memNo ==  r[0].MEM_NO }">
	                        <button id="favoritesBox" onclick="fn_toggle();">
	                            <img id="announcementFavorites2" src="${path }/resources/image/Hire/pngwing2.png" />
	                        </button>
                       </c:when>
                       <c:otherwise>
                        <button id="favoritesBox" onclick="fn_toggle();">
                            <img id="announcementFavorites2" src="${path }/resources/image/Hire/pngwing.png" />
                        </button>
                     </c:otherwise>
                       
                      </c:choose>
                    </div>

                    <div class="detailedReviewInterview">
                       <a href="#">
                         <button value="${r[0].REC_NO }" class="annoDetailListBoxs" >
                            <input type="hidden" value="${r[0].REC_NO }" class="annoDetailListBox">상세
                         </button>
                        </a>
                        <a href="#">
                        <button value="${r[0].ENT_NO }" class="clickReviewTotalBoxs" >
	                       <input type="hidden" value="${r[0].ENT_NO }" class="clickReviewTotalBox">리뷰
                        </button>
                        </a>
                        <a href="#">
                         <button value="${r[0].ENT_NO }" class="interviewBoxs" >
                            <div class="interviewBox">면접</div>
                         </button>
                        </a>  
                    </div> 
  
                    

                    
        </div> 
        
<div class="annoDetailAllHeight">
      


<div class="annoDetailInfoWidth">
                        <div class="annoDetailInfoLeft">
                            <div class="annoDetailInfo">
                                <div class="annoDetailInfoAll">
                                    <div class="annoDetailInfoLogo"></div>
                                    <div class="logoRight">마감일</div>
                                   <div><fmt:formatDate  value="${r[0].REC_ENDDATE}" pattern="yy.MM.dd" /></div>
                                </div>

                                

                                <div class="annoDetailInfoAll">
                                    <div class="annoDetailInfoLogo"></div>
                                    <div class="logoRight">경력</div>
                                    <div>${r[0].REC_CAREER} 년</div>
                                </div>
                                <div class="annoDetailInfoAll">
                                    <div class="annoDetailInfoLogo"></div>
                                    <div class="logoRight">고용형태</div>
                                     <div>${r[0].REC_TYPE}</div>
                                </div>
                                <div class="annoDetailInfoAll">
                                    <div class="annoDetailInfoLogo"></div>
                                    <div class="logoRight">연봉</div>
                                      <div>${r[0].REC_SALARY} 만원</div>
                                </div>
                               

                            </div>

                            <div class="tttt" >
                                <div>
                                    <div class="InformationList">[주요업무]</div>
                                    <div class="mainTask">${r[0].REC_INFO}
                                    </div>
                                </div>

                   
                                <div>
                                    <div class="InformationList">[자격요건]</div>
                                    <div class="qualificationRequirements">
                                       ${r[0].REC_QUALIFICATION}</div>
                                </div>

                                <div>
                                    <div class="InformationList">[우대사항]</div>
                                    <div class="preferentialTreatment">
 										${r[0].REC_PREFER}
                                        </div>
                                </div>

                                <div>
                                    <div class="InformationList">[채용절차]</div>
                                    <div class="recruitmentProcedure">${r[0].REC_ORDER}
                                        * 서류전형 → 1차 (기술 면접) → 2차 (경영진 면접) → 처우협의 → 입사<br>
                                        - 면접관의 판단에 따라 전화면접(기술)이 추가될 수 있습니다.<br>
                                        - 전형별 결과는 5일 이내에 안내드립니다.<br>
                                        - 지원서류는 PDF 또는 Word 파일로 제출 부탁드립니다.<br>
                                    </div>
                                </div>

                                <div>
                                    <div class="InformationList">[복리후생]</div>
                                    <div class="welfareBenefits">${r[0].REC_WELFARE}
                                    </div>
                                </div>

                                <div>
                                    <div class="InformationList">[기타]</div>
                                    <div class="otherThan">
                                        - 근무형태 : 정규직 (수습기간 3개월 후 정규직 전환 면접)<br>
                                        - 근무시간 : 주5일 (월~금)<br>
                                        - 근무제도 : 자율출퇴근제도, 재택근무제도<br>
                                        - 마이리얼트립 근무제도에 대한 팀원 인터뷰 : http://naver.me/5OFbzfeP<br>
                                        - 근무지 : 서울시 서초구 강남대로 327 대륭서초타워 18층 마이리얼트립<br>
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                         <div class="annoDetailInfoRight" >
                            <div style="font-size: 20px; font:bolder">문의처</div>
                            <div class="Inquiries">
                                <div class="managerName">담당자</div>
                                <div class="managerName2">${r[0].REP_PHONE}</div>
                            </div>
                            <div class="InquiriesInfo">
                                <div class="Inquiries">
                                    <div class="InquiriesHomePage">홈페이지</div>
                                    <div class="InquiriesHomePage2"><a href="https://search.naver.com">www.naver.com</a></div>
                                </div>
                                <div class="Inquiries">
                                    <div class="InquiriesPhone">연락처</div>
                                    <div class="InquiriesPhone2">${r[0].REP_PHONE}</div>
                                </div>
                                <div class="Inquiries">
                                    <div class="InquiriesEmail">이메일</div>
                                    <div class="InquiriesEmail2"></div>
                                </div>

                            </div>
                            <div class="InquiriesAddress">회사위치</div>
                            <div>서울 강남구 역삼동 123-345 8층 jobnomOffice </div>

                           	 <!-- 카카오맵 -->
                            <div id="map" style="width:300px;height:300px; border:solid"></div>
	 						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a20465f19ee15158806da31ed0ea9984"></script>
                            <script>
                                var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                                    var options = { //지도를 생성할 때 필요한 기본 옵션
                                        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
                                        level: 3 //지도의 레벨(확대, 축소 정도)
                                    };

                                    var map = new daum.maps.Map(container, options);

                                        function setCenter(lat, lng) {

                                            map.setCenter(new daum.maps.LatLng(lat, lng));

                                        }



                           </script> 
                        </div>
                        
                        </div>
                        </div>
                        <div class="test1"></div>
                        
  
                <!-- </span> -->



          
            
</section>


  		 
             
             <!-- 리뷰 클릭시 전환되는 에이작스 -->
              <script>
                
                    $(".clickReviewTotalBoxs").click((e) => {
                    var formData = $(e.target).val();
                    $.ajax({
                         
                         url : "${path}/Hire/reviewAVG.do", 
                         type : 'POST', 
                          dataType :'html',
                         data : {ent_no:formData},
                         success :function(data){
                           $(".test1").html(data);
                        }
               })
                    });
                
                </script> 
                
                	<script>

              $(document).ready(function () {

             $(".clickReviewTotalBoxs").click(function () {
              $(".annoDetailAllHeight").css("display", "none");
              

             });
             });
             </script>  
             
             <script>
                /*  data:{ent_no:'${a.ent_no}'}, */
                
                    $(".annoDetailListBoxs").click((e) => {
                    var formData = $(e.target).val();
                    $.ajax({
                         
                         url : "${path}/Hire/anoDetail.do", 
                         type : 'POST', 
                          dataType :'html',
                         data : {ent_no:formData},
                         success :function(data){
                           $(".test").html(data);
                        }
               })
                    });
                
                </script> 
     
     
     <script>
    $(function () {



        var scrollOffset = $('.annoDetailTitle').offset();

        $(window).scroll(function () {
            if ($(document).scrollTop() > scrollOffset.top) {
                $('.annoDetailTitle').addClass('scroll-fixed');
                $('.annoDetailTitle').css('margin-top', '158px');
                $('.annoDetailTitle').css('z-index', '5');
              
          /*       $('.detailedReviewInterview').css('display','none')l */
            }
            else {
                $('.annoDetailTitle').removeClass('scroll-fixed');
                $('.annoDetailTitle').css('margin-top', '0px');
            }
        });
    });


</script>

<script>
    $(function () {



        var scrollOffset = $('.annoCategory').offset();

        $(window).scroll(function () {
            if ($(document).scrollTop() > scrollOffset.top) {
            	
                $('.annoCategory').addClass('scroll-fixed');
                $('.annoCategory').css('margin-top', '158px');
                $('.annoCategory').css('z-index', '4');
               
            
            }
            else {
                $('.annoCategory').removeClass('scroll-fixed');
                $('.annoCategory').css('margin-top', '0px');
            }
        });
    });

    


</script> 

		<script>
		$(".apply").click(function(){
		    alert("지원완료");
		});
		</script>
		
		<script>

    var cnt = 1;
    function fn_toggle() {
    	
        var announcementFavorites2 = document.getElementById("announcementFavorites2");
        if(${r[0].OPEN_CHECK==1})
         {
        	announcementFavorites2.src="${path }/resources/image/Hire/pngwing.png";
        	location.href="${path }/Hire/notFavorites.do?memNo=${commonLogin.memNo}&recNo=${r[0].REC_NO}&openCheck=${r[0].OPEN_CHECK}";
        	alert("즐겨찾기 빼기 완료");
        }else
        {
            announcementFavorites2.src="${path }/resources/image/Hire/pngwing2.png";
           	location.href="${path }/Hire/favorites.do?memNo=${commonLogin.memNo}&recNo=${r[0].REC_NO}";
        	alert("즐겨찾기 완료");
        }
        cnt++

    };
		  
</script>


