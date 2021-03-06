<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="../resources/css/Hire/announcementPage.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value=" "/>
</jsp:include>

            
              <div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">로그인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <input type="text" class="userId" placeholder="이메일주소" name=""><br>
                            <input type="password" class="userPw" placeholder="비밀번호(8자리 이상)"><br>
                            <input type="submit" value="이메일 확인" class="loginsubmit">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Understood</button>
                    </div>
                </div>
            </div>
        </div>
<section id="content" style="margin-top: -158px;  padding-top: 160px; ">
<form id="" action="${path }/Hire/annCarrer.do" method="post" onsubmit="return fn_carrer();">
 <div class="annoCategory">
            <div class="dropdown">
                <input class="dropbtn" type="button" value="직종"> 
                <div class="dropdown-contentAll">
                    <div class="dropdown-content">
                            <div>
                                <div class="contentDetailAll">
                                    <div class="contentDetail"
                                        style="overflow:scroll; width:250px; height:300px; padding:10px;  ">
                                        <div class="contentDetailAllBtn"><a href="#" id="contentBank">금융/제무</a></div>
                                        <div class="contentDetailAllBtn"><a href="#" id="contentIT">IT/인터넷/소프트웨어</a></div>
                                        <div class="contentDetailAllBtn"><a href="#" id="contentStudy">교육</a></div>
                                        <div class="contentDetailAllBtn"><a href="#" id="contentMarket">마켓팅/시장조사</a></div>
                                        <div class="contentDetailAllBtn"><a href="#" id="contentMedicine">의약</a></div>
                                        <div class="contentDetailAllBtn"><a href="#" id="contentService">서비스/고객지원</a></div>
                                    </div>


                                    <div id="contentDetailfinance">
                                        <div class="check_wrap" >
                                            <input type="checkbox" id="bankClerk" name="anoNum" value="1">
                                            <label for="bankClerk" class="checkboxContentDetail" id="">
                                            <span class="checkboxContentSpan"></span>은행관련</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="tax" name="anoNum" value="2">
                                            <label for="tax" class="checkboxContentDetail"
                                                id=""><span class="checkboxContentSpan"></span>세무/법무</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="accounting" name="anoNum" value="3">
                                            <label for="accounting" class="checkboxContentDetail"
                                                id=""><span class="checkboxContentSpan"></span>경리/출납/수납</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="invest" name="anoNum" value="4">
                                            <label for="invest" class="checkboxContentDetail"
                                                id=""><span class="checkboxContentSpan"></span>증거 투자 분석</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="insurance" name="anoNum" value="5">
                                            <label for="insurance" class="checkboxContentDetail"
                                                id=""><span class="checkboxContentSpan"></span>보험계리사/손해사정인</label>
                                        </div>

                                    </div>
                                    <!-- 인터넷 -->
                                    <div id="contentDetailIT"
                                        style="overflow:scroll; width:300px; height:300px; padding:10px; display: none; ">
                                        <div class="check_wrap">
                                            <input type="checkbox" id="QA" name="anoNum" value="6">
                                            <label for="QA" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>웹계발</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="projectManager" name="anoNum" value="7">
                                            <label for="projectManager" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>시스템엔지니어</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="webDevelopment" name="anoNum" value="8">
                                            <label for="webDevelopment" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>웹퍼블리셔</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="DBA" name="anoNum" value="9">
                                            <label for="DBA" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>기획</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="engineer" name="anoNum" value="10">
                                            <label for="engineer" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>네트워크/보안/운영</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="webPublisher" name="anoNum" value="11">
                                            <label for="webPublisher" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>데이터분석</label>
                                        </div>
                                       

                                    </div>

                                    <!-- 교육 -->
                                    <div id="contentDetailStudy"
                                        style="overflow:scroll; width:300px; height:300px; padding:10px; display: none; ">
                                        <div class="check_wrap">
                                            <input type="checkbox" id="educationPlanning" name="anoNum" value="12">
                                            <label for="educationPlanning" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>교육기획</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="kindergarden" name="anoNum" value="13">
                                            <label for="kindergarden" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>전문강사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="specialTeacher" name="anoNum" value="14">
                                            <label for="specialTeacher" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>초중고/특수학교 교사</label>
                                             </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="entranceExamination" name="anoNum" value="15">
                                            <label for="entranceExamination" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>대학교수</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="universityProfessor" name="anoNum" value="16">
                                            <label for="universityProfessor" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>교직원</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="professionalInstructor" name="anoNum" value="17">
                                            <label for="professionalInstructor" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>입시/보습/학원강사</label>
                                        </div>
                                  

                                    </div>
                                    <!-- 마켓팅  -->
                                    <div id="contentDetailMarket"
                                        style="overflow:scroll; width:300px; height:300px; padding:10px; display: none; ">
                                        <div class="check_wrap">
                                            <input type="checkbox" id="strategyMarketing" name="anoNum" value="18">
                                            <label for="strategyMarketing" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>마켓팅</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="onlineMarketing" name="anoNum" value="19">
                                            <label for="onlineMarketing" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>브랜드 마켓팅</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="CRM" name="anoNum" value="20">
                                            <label for="CRM" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>시장조사/분석</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="BrandMarketing" name="anoNum" value="21">
                                            <label for="BrandMarketing" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>상품개발/기획/MD</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="MD" name="anoNum" value="22">
                                            <label for="MD" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>온라인 마켓팅</label>
                                        </div>
                                      
                                       

                                    </div>
                                    <!-- 의약 -->
                                    <div id="contentDetailMedicine"
                                        style="overflow:scroll; width:300px; height:300px; padding:10px; display: none; ">
                                        <div class="check_wrap">
                                            <input type="checkbox" id="doctore" name="anoNum" value="23">
                                            <label for="doctore" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>의사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="orientalMedicine" name="anoNum" value="24">
                                            <label for="orientalMedicine" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>한의사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="Dentist" name="anoNum" value="25">
                                            <label for="Dentist" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>치과의사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="veterinarian" name="anoNum" value="26">
                                            <label for="veterinarian" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>약사/한약사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="Chemist" name="anoNum" value="27">
                                            <label for="Chemist" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>간호사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="nurse" name="anoNum" value="28">
                                            <label for="nurse" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>간호조무사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="medicalRecorder" name="anoNum" value="29">
                                            <label for="medicalRecorder" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>물리치료사</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="physicalTherapist" name="anoNum" value="30">
                                            <label for="physicalTherapist" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>수의사</label>
                                        </div>
                                      


                                    </div>
                                    <!-- 서비스 -->
                                    <div id="contentDetailService"
                                        style="overflow:scroll; width:300px; height:300px; padding:10px; display: none; ">
                                        <div class="check_wrap">
                                            <input type="checkbox" id="customerSupport" name="anoNum" value="31">
                                            <label for="contentDetailService" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>고객지원/cs</label>
                                        </div>
                                        
                                        <div class="check_wrap">
                                            <input type="checkbox" id="Travel" name="anoNum" value="32">
                                            <label for="Travel" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>호텔/숙박 관련</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="beauty" name="anoNum" value="33">
                                            <label for="beauty" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>가이드</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="Catering" name="anoNum" value="34">
                                            <label for="Catering" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>외식업/식음료</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="Guard" name="anoNum" value="35">
                                            <label for="Guard" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>기타서비스</label>
                                        </div>
                                        <div class="check_wrap">
                                            <input type="checkbox" id="otherServices" name="anoNum" value="36">
                                            <label for="otherServices" class="checkboxContentDetail" id=""><span
                                                    class="checkboxContentSpan"></span>경영</label>
                                        </div>
                                        

                                    </div>


                                    <script>

                                        $(document).ready(function () {

                                            $("#contentBank").click(function () {

                                                $("#contentDetailfinance").show();
                                                $("#contentDetailfinance").css("z-index", "99");
                                                $("#contentDetailIT").css("display", "none");
                                                $("#contentDetailStudy").css("display", "none");
                                                $("#contentDetailMarket").css("display", "none");
                                                $("#contentDetailMedicine").css("display", "none");
                                                $("#contentDetailService").css("display", "none");
                                               
                                                

                                            });
                                        });


                                    </script>
                                    <!-- it -->
                                    <script>

                                        $(document).ready(function () {

                                            $("#contentIT").click(function () {

                                                $("#contentDetailfinance").css("display", "none");
                                                $("#contentDetailIT").show();
                                                $("#contentDetailStudy").css("display", "none");
                                                $("#contentDetailMarket").css("display", "none");
                                                $("#contentDetailMedicine").css("display", "none");
                                                $("#contentDetailService").css("display", "none");
                                            });
                                        });
                                    </script>
                                    <!-- 교육 -->
                                    <script>

                                        $(document).ready(function () {

                                            $("#contentStudy").click(function () {

                                     
                                                $("#contentDetailfinance").css("display", "none");
                                                $("#contentDetailIT").css("display", "none");
                                                $("#contentDetailStudy").show();
                                                $("#contentDetailMarket").css("display", "none");
                                                $("#contentDetailMedicine").css("display", "none");
                                                $("#contentDetailService").css("display", "none");
                                            });
                                        });
                                    </script>

                                    <!-- 마켓팅 -->
                                    <script>

                                        $(document).ready(function () {

                                            $("#contentMarket").click(function () {

                                                
                                                $("#contentDetailfinance").css("display", "none");
                                                $("#contentDetailIT").css("display", "none");
                                                $("#contentDetailStudy").css("display", "none");
                                                $("#contentDetailMarket").show();
                                                $("#contentDetailMedicine").css("display", "none");
                                                $("#contentDetailService").css("display", "none");
                                            });
                                        });
                                    </script>

                                    <!-- 의약 -->
                                    <script>

                                        $(document).ready(function () {

                                            $("#contentMedicine").click(function () {

                                               
                                                $("#contentDetailfinance").css("display", "none");
                                                $("#contentDetailIT").css("display", "none");
                                                $("#contentDetailStudy").css("display", "none");
                                                $("#contentDetailMarket").css("display", "none");
                                                $("#contentDetailMedicine").show();
                                                $("#contentDetailService").css("display", "none");
                                            });
                                        });
                                    </script>

                                    <!-- 서비스 -->
                                    <script>

                                        $(document).ready(function () {

                                            $("#contentService").click(function () {

                                               
                                                $("#contentDetailfinance").css("display", "none");
                                                $("#contentDetailIT").css("display", "none");
                                                $("#contentDetailStudy").css("display", "none");
                                                $("#contentDetailMarket").css("display", "none");
                                                $("#contentDetailMedicine").css("display", "none");
                                                $("#contentDetailService").show();
                                            });
                                        });
                                    </script>



                                </div>
                                	<div style="border-top: solid gray; "></div>
                                <div class="contentButton">
                                     <input class="contentButtonApply3" type="submit" value="적용" onclick="fn_return();">
                                   <!--  <button class="contentButtonApply3" onclick="">적용</button> -->
                                </div>
                            </div>
                            
                        
                    </div>
                </div>

            </div>

            <div class="dropdown">
                <input type="button" value="경력" class="dropbtn">
                
                <div class="dropdown-contentCareer">
                    <input id="rangeStyle" type="range" min="0" max="10" step="1" value="" name="carNum" />
                    <div id="Year"></div>
                    	<div style="border-top: solid gray; "></div>
                    <div class="contentButton">
                     
                      
                        <input class="contentButtonApply3" type="submit" value="적용" onclick="fn_return();">
                    </div>
                </div>
               
            </div>
           
            <script>
                let rangeStyle = document.getElementById('rangeStyle'),
                Year = document.getElementById('Year');
                Year.innerHTML = rangeStyle.value+"년차";

                rangeStyle.addEventListener('input', function () {
                    Year.innerHTML = rangeStyle.value+"년차";
                });

            </script>

            <div class="dropdown">
                <input type="button" value= "고용형태" class="dropbtn">
                <form action="">
                    <div class="dropdown-contentShape">
                        <div class="check_wrap">
                            <input type="checkbox" id="partTimeJob" name="employType" value="일용직">
                            <label for="partTimeJob" class="checkboxContentShape"><span
                                    class="checkboxShapeSpan"></span>일용직</label>
                        </div>
                        <div class="check_wrap">
                            <input type="checkbox" id="Intern" name="employType" value="인턴">
                            <label for="Intern" class="checkboxContentShape"><span
                                    class="checkboxShapeSpan"></span>인턴</label>
                        </div>
                        <div class="check_wrap">
                            <input type="checkbox" id="contractWorker" name="employType" value="계약직">
                            <label for="contractWorker" class="checkboxContentShape"><span
                                    class="checkboxShapeSpan"></span>계약직</label>
                        </div>
                        <div class="check_wrap">
                            <input type="checkbox" id="fullTime" name="employType" value="정규직">
                            <label for="fullTime" class="checkboxContentShape"><span
                                    class="checkboxShapeSpan"></span>정규직</label>
                        </div>
                        <div class="check_wrap">
                            <input type="checkbox" id="freelancer" name="employType" value="프리랜서">
                            <label for="freelancer" class="checkboxContentShape"><span
                                    class="checkboxShapeSpan"></span>프리랜서</label>
                        </div>
							<div style="border-top: solid gray; "></div>
                        <div class="contentButton">
        
                        <input class="contentButtonApply3" type="submit" value="적용" onclick="fn_return();">
                        </div>
                    </div>
                </form>
            </div>
        </div>




 </form>



	<c:if test="${null == anolist[0].rec_no }">
		<div style="text-align: center; font-size: 30px; color: green; ">
			<div>죄송합니다</div>
			<div>해당하는 공고가 존재하지않습니다.</div>
			<a href="${path }/Hire/HireHome.do?memNo=${commonLogin.memNo}">
			<img alt="" src="${path }/resources/image/Hire/test.png"
				style="border-radius: 12px; width: 800px; height: 500px;">
			</a>
		</div>
		
	</c:if> 
	<c:if test="${null != anolist[0].rec_no }">
        <div class="annoAll">
            <div id="annoListAll">
             

         
             
                <div id="annoList">
                  <c:forEach items="${anolist }" var="a">
                 
                  
                    <div class="annoListNum">
                        <div class="annoListLogeFlax">
                            <div class="annoListLoge2">
                            <c:choose>
		                        	<c:when test="${empty a.ent_logo }">
		                				<img src="${path }/resources/image/Hire/logo.png" style="width: 50px; height: 50px; ">
		                        	</c:when>
		                        	<c:otherwise>
		                        		<img src="${path }/resources/enterprise/logo/${a.ent_no }/${a.ent_logo}" style="width: 40px; height: 40px; ">
		                        	</c:otherwise>
		                        
		                        </c:choose>
                            
                            </div>
                        </div>
                      
                        <a href="#">
                       
                            <div class="annoListTitleFlax">
                            <button name="aaaa" value="${a.rec_no }"  class="annoListTitleBoxs" >${a.rec_title }<br>
                            <c:out value="${a.ent_name }"/>
                             <div>평점 : <c:out value="${a.avg }"/></div>
                             </button>
                            <button type="button" name="dddd" value="${commonLogin.memNo}" style="display: none;"></button>
                            <%-- <input type="hidden" value="${a.rec_no }"><c:out value="${a.rec_title }"/><br>
                            <input type="hidden" value="${a.rec_no }"><c:out value="${a.ent_name }"/><br> --%>
                            </div>
                        </a>
                        
                    </div>

                      
                   </c:forEach>
                </div>
                
                    <div id="pageBar">${pageBar }</div>
            </div>


            <div class="annoDetail" style=" border-radius:12px; background:#f6f7f4; height: 900px; width: 900px;">
            
            <div class="annoDetailFlax" style="display: flex; width: 100%; height: 100px" >
	            <div class="annoEntTitle">
	            	기업정보 한눈에 보기
	            </div>
	           
            </div>
           
          <div class="swiper-container">
         
    <div class="swiper-wrapper">
    	<c:forEach  items="${anolist }" var="a">
      <div class="swiper-slide" style="display: flex;">
      <c:choose>
	<c:when test="${empty a.ent_logo }">
	<img src="${path }/resources/image/Hire/logo.png" style="width: 250px; height: 250px; " onclick="location.href='${path }/enterprise/com_info.do?entNo=${a.ent_no }'">
	</c:when>
	<c:otherwise>
	<img src="${path }/resources/enterprise/logo/${a.ent_no }/${a.ent_logo}" style="width: 250px; height:250px; " onclick="location.href='${path }/enterprise/com_info.do?entNo=${a.ent_no }'">
	</c:otherwise>	                        
	</c:choose>	
      </div>
         </c:forEach>
     
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>
  <div style="width:800px;  margin: 0 auto; padding-top: 30px;">
  <button style="border:none; ">
    <img src="${path }/resources/image/Hire/ent.png" style="width: 800px; height: 300px; " onclick="location.href='${path }/Hire/HireHome.do?memNo=${commonLogin.memNo }'">
  </button>
  </div>
         	
         
            
        </div>
                <div class="test" style=" overflow: auto;  "></div>
                <div class="test3" style="overflow: auto; " ></div> 
        </div>
        </c:if>
       
        
        
        
        
        
        
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script>

    // Disable form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Get the forms we want to add validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();


</script>



 
<script>
    $(function () {



        var scrollOffset = $('.annoDetailTitle').offset();

        $(window).scroll(function () {
            if ($(document).scrollTop() > scrollOffset.top) {
                $('.annoDetailTitle').addClass('scroll-fixed');
                $('.annoDetailTitle').css('margin-top', '100px');
                $('.annoDetailTitle').css('z-index', '5');
                $('.annoDetailTitle').css('height', '90px');
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
                $('.annoCategory').css('z-index', '10');
                $('.annoCategory').css('height', '80px');
            }
            else {
                $('.annoCategory').removeClass('scroll-fixed');
                $('.annoCategory').css('margin-top', '0px');
            }
        });
    });

    


</script> 
<script>
     $(function () {
    $('contentDetailAllBtn').click(function(){
        $('contentDetailAllBtn').css("style","none")
    });
});
</script>

              <script>
                    let avg1 = parseFloat($('.scoreReview_satisfactionAVG').text());
                    let total1 = avg1*20
                    $('.yellowbgSatisfaction').css('width',total1+'%');
                    
                    let avg2 = parseFloat($('.scoreReview_welfareAVG').text());
                    let total2 = avg2*20
                    $('.yellowbgWelfare').css('width',total2+'%');
                    
                    let avg3 = parseFloat($('.scoreReview_promotionAVG').text());
                    let total3 = avg3*20
                    $('.yellowbgPromotion').css('width',total3+'%');
                    
                    let avg4 = parseFloat($('.scoreReview_executiveAVG').text());
                    let total4 = avg4*20
                    $('.yellowbgExecutive').css('width',total4+'%');
              </script>
               
               

            </div>
                            
         </div>
       
           
         <!--     <script>

              $(document).ready(function () {

             $(".annoDetailListBox").click(function () {
             $(".clickReview").css("display", "none");
             $(".annoDetailInfoLeft").show();
             });
             });
             </script> -->
       <script>
       $(document).ready(function () {

           $(".annoListTitleBox").click(function () {
            $(".annoDetailInfoWidth").css("display", "none");
            $(".annoDetailAllHeight").css("display", "none");
            $(".test3").css("display", "none");

           });
           });
             </script>
            
                
                <script>
                /*  data:{ent_no:'${a.ent_no}'}, */
                
                    $(".annoListTitleFlax").click(e => {
                    var formData = $(e.target).val();
                    var formData2 = $(e.target).next().val();
                    //var formData2 = ("button[name=dddd]").val();
                    $.ajax({
                         
                         url : "${path}/Hire/anoDetail.do", // 요기에
                         type : 'POST', 
                          dataType :'html',
                         data : {rec_no:formData,memNo:formData2},
                         success :function(data){
                           $(".test").html(data);
                           $(".test").css("height","1000px");
                           $(".annoDetail").css("display","none");
                       
                           
                         
                         }
               })
                    });
                
                </script> 
        
    
      		<script>
           
                    $(".clickReviewTotalBoxs").click((e) => {
                    var formData = $(e.target).val();
                    $.ajax({
                         
                         url : "${path}/Hire/reviewAVG.do", 
                         type : 'POST', 
                          dataType :'html',
                         data : {ent_no:formData},
                         success :function(data){
                           $(".test3").html(data);
                        }
               })
                    });
                
                </script> 
                <script>
                $(".annoDetailListBoxs").click(function () {
                    $(".annoDetailAll").css("display", "none");
                    $(".test3").css("display", "none");
              })
                </script>
                
            <script>
       
               $(".annoListTitleBox").click(function () {
                   $(".annoDetailAll").css("display", "none");
                   
             })
              
        
             </script> 
             	<script>
 
              $(document).ready(function () {

             $(".clickReviewTotalBoxs").click(function () {
              $(".annoDetailAllHeight").css("display", "none");
              $(".test3").css("height", "800px");

             });
             });
             </script> 
             

<script>

   
    function fn_toggle() {
    	
        var announcementFavorites = document.getElementById("announcementFavorites");
        if(${anolist[0].open_check==1 && commonLogin.memNo == anolist[0].mem_no })
         {
        	announcementFavorites.src="${path }/resources/image/Hire/pngwing.png";
        	location.href="${path }/Hire/notFavorites.do?memNo=${commonLogin.memNo}&recNo=${anolist[0].rec_no}&openCheck=${anolist[0].open_check}&anoNum=${anolist[0].rec_category}";
        	alert("즐겨찾기 빼기 완료");
        }else
        {
            announcementFavorites.src="${path }/resources/image/Hire/pngwing2.png";
           	location.href="${path }/Hire/favorites.do?memNo=${commonLogin.memNo}&recNo=${anolist[0].rec_no}&anoNum=${anolist[0].rec_category}";
        	alert("즐겨찾기 완료");
        }
        

    };
		  
</script>

<script>
		$(".apply").click(function(){
			if(${commonLogin.memNo == null}){
      			alert("로그인 회원만 이용가능합니다");	
      			 return false; 
			}else{
				alert("지원완료");
			}
		    
		});
		</script>
		
		 <script>
                        function fn_apply(){
                        	if($('input[name=memNo]').val()===""){
                      			alert("로그인 회원만 이용가능합니다");	
                      			 return false; 
                			}else{
                				alert("지원완료");
                			}
                        	
                        }
                        </script>
                        
                        <script>
                         function(){
                        if ($("input[name=anoNum]:checkbox" ).is( ":checked")){
									alert("dd");
								    
								}
                        };
                        </script>
                        
      <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      pagination: {
        el: '.swiper-pagination',
      },
    });
  </script>
                        