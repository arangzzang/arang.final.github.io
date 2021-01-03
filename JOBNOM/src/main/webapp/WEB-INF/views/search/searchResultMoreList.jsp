<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var= "path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path }/resources/css/search/searchResultMoreList.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
 <!-- 기업 더보기 페이지 -->
<div class="contents_wrap">
    <div class="contents">
        <div class="mainContents">
            <div class="cont_wrap">
                <div class="filterWrap">
                    <!-- 필터 시작 -->
                    <div class="col1Wrap">
                            <select name="parent_industry_id" id="ent_catagory1">
                                <option name="entCate" value="ENT_CATEGORY1">1차산업군</option>
								<option name="entCate" >IT/인터넷</option>
								<option name="entCate" >금융/재무</option>
								<option name="entCate" >의약</option>
								<option name="entCate" >서비스/고객지원</option>
								<option name="entCate" >마케팅/시장조사</option>
								<option name="entCate" >교육</option>
							</select>
                    </div>
                    
                    <!-- 필터 끝 -->
                    <div class="result">
                        <span class="num"><c:out value="${list[1].COUNT }"/></span>
                       	 검색결과
                    </div>
                </div>
                <!--내용 들  -->
                <article class="listCompany">
                    <div class="section_wrap">
                        <div class="section_group">
                            <!-- for문  -->
                            <c:forEach items="${list}" var="list" varStatus="status">
                            <section class="company content_ty3">
                                <div class="ty3_wrap">
                                    <div class="content_wrap">
                                        <div class="content_col2_2">
                                            <a href="#" class="llogo">
                                            	<c:choose>
                                            		<c:when test="${empty list.ENT_LOGO }">
                                            			<img src="https://jpassets.jobplanet.co.kr/assets/default_logo_share-12e4cb8f87fe87d4c2316feb4cb33f42d7f7584f2548350d6a42e47688a00bd0.png">
                                            		</c:when>
                                            		<c:otherwise>
                                            			<img src="${path }/resources/enterprise/logo/${list.ENT_NO}/${list.ENT_LOGO }">
                                            		</c:otherwise>
                                            	</c:choose>
                                            </a>
                                        </div>
                                        <dl class="content_col2_3 cominfo">
                                            <dt class="us_titb_13">
                                                <a href="#" onclick="location.href = '${path }/enterprise/com_info.do?entNo=${list.ENT_NO}'">${list.ENT_NAME }</a>
                                                <c:choose>
                                                <c:when test="${not empty commonLogin && commonLogin.memNo ne  entFollow[status.index].MEM_NO && list.ENT_NO ne entFollow[status.index].ENT_NO  }">
                                                <button class="btn_heart1" onclick="location.href='${path }/search/entFollow.do?memNo=${commonLogin.memNo}&entNo=${list.ENT_NO}'">
                                                    <i class="far fa-heart"></i>
                                                </button>
                                                </c:when>
                                                <c:when test="${not empty commonLogin && commonLogin.memNo eq  entFollow[status.index].MEM_NO && list.ENT_NO eq entFollow[status.index].ENT_NO  }">
                                                <button class="btn_heart2" onclick="location.href='${path }/search/entUnFollow.do?memNo=${commonLogin.memNo}&entNo=${list.ENT_NO}'">
                                                    <i class="fas fa-heart"></i>
                                                </button>
                                                </c:when>
                                                <c:otherwise>
                                             	<button class="btn_heart1" onclick="javascript:btn_heart3()">
                                                    <i class="far fa-heart"></i>
                                                </button>
                                                </c:otherwise>
                                                </c:choose>
                                            </dt>
                                            <dd>
                                                <span class="us_txt_1">${list.ENT_CATEGORY1 }</span>
                                            </dd>
                                            <dd class="row_end">
                                                <a href="" class="us_txt_1">기업리뷰</a>
                                                <span class="vbar">|</span>
                                                <a href="" class="us_txt_1">면접정보</a>
                                            </dd>
                                        </dl>
                                        <dl class="content_col2_4">
                                            <dt>리뷰 평균평점</dt>
                                            <dd class="gf_row">
                                                <div class="us_star_m">
                                                    <div class="star_score">평점</div>
                                                </div>
                                                <span class="gfvalue">${list.AVG }</span>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </section>
                            
                            </c:forEach>
                            <!-- 반복 -->
                            
                        </div>
                    </div>
                </article>
                <!--ajax 태그  -->
                <div class="test"></div>
            </div>
                        <div id="pageBar">${pageBar }</div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

                            <script>
                            /*카테고리 별 ajax  */
                            	$('#ent_catagory1').change((e) =>{
                            		var formData = $(e.target).val();
                            		console.log(formData);
                            		
                            		$.ajax({
                            			
                            			url : "${path}/ajaxCateList",
                            			type : 'POST',
                            			data : {entCategory : formData},
                            			success : function(data) {
                            				 $(".listCompany").hide();
                            				 $(".result").hide();
                            				 $(".test").html(data);
										}
                            		})
                            	});
                            </script>
                            <script>
                            	/* <!-- 하트 눌렀을때 변환 스크립트 --> */
                                function btn_heart3(){ 
                            		alert('로그인 후 이용 가능 합니다.'); 
                            		
                            	}

                            	/* <!-- 하트 눌렀을때 변환 스크립트  끝--> */
                                
                              /*   <!--평균평점 별점 스크립트  --> */
						   	
								let avg = parseFloat($('.gfvalue').text());
								let total = avg*20
								
								$('.star_score').css('width',total+'%');
								<!--평균평점 별점 스크립트  -->
                            </script>