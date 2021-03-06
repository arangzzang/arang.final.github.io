<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path }/resources/css/mypage/followingEnt.css"/>
        <div class="with">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="a">
			    <div class="container row withcon">
			        <div class="col-md-3 col-sm-3 withleft">
			            <ul class="nav nav-pills flex-column sidebar" id="sidebar">
			                <h3 class="sidebar-title">관심정보</h3>
			                <li class="nav-item sidebarmenubar">
			                    <button type="button" class="sidebtn followingBtn">팔로잉기업</button>
			                </li>
			                <li class="nav-item sidebarmenubar">
			                    <button type="button" class="sidebtn saveHireBtn">저장된채용</button>
			                </li>
			            </ul>
			        </div>
			        <div class="col-md-8 col-sm-8 maincon withright" id="maincon">
			            <div class="maininfo-parent one">
			                <h2>팔로잉 기업</h2>
			                <span>${count }개의 관심기업이 있습니다.</span>
			                <!-- 팔로잉한 기업이 있을 때 -->
			                <c:if test="${!empty list }">
				                <c:forEach items="${list }" var="list">
					                <div class="following_container row">
					                    <a href="#" class="col-sm-2 col-md-2"><img src="" alt=""></a>
					                    <dl class="col-sm-5 col-md-5">
					                        <dt class="ent_name">${list.entName }<i class="fa fa-heart"></i></dt>
					                        <dd>${list.entCategory1 } | 주소</dd>
					                        <dd><a href="">${reviewCount.get(list.entNo)}기업리뷰</a>|<a href="">[count]면접후기</a></dd>
					                    </dl>
					                    <dl class="col-sm-5 col-md-5">
					                        <dt>총 만족도</dt>
					                        <dd>별평균 들어가야함.[count]</dd>
	<!-- 				                        <dd>[연봉 해두되고 안해두되고]</dd> -->
					                    </dl>
					                </div>
				                </c:forEach>
			                </c:if>
			                <c:forEach   items="${reviewCount}" var="rc">
	                           <div><c:out value="${rc}"/></div>
	                        </c:forEach>
<%--                          <c:out value="${reviewCount}"/> --%>
			                <!-- 팔로잉한 기업이 없을 때 -->
			                <c:if test="${empty list }">
			                    <article class="following_null">
			                        <span class="following_icon"><i class="fa fa-heart"></i></span>
			                        <p><strong>팔로잉한 기업이 없습니다.</strong><br><br>
			                            관심있는 기업을 등록하셔서 기업들의 최신정보를 받아보세요.
			                        </p>
			                    </article>
			                </c:if>
			            </div>
			        </div>
			    </div>
		    </div>
	    </div>
    
    <script>
        //followingBtn,saveHireBtn
        //팔로잉한 기업 화면 전환
        $(".followingBtn").click(e=>{
            $.ajax({
	            url:"${path}/member/followingEnt",
	            type:"get",
	            data:{memNo:<c:out value='${mem.memNo}'/>},
	            success:data=>{
	            	$(".with-parent").html("");
	                $(".with-parent").html(data);
	            }
	        });
        })
        //저장된 채용 화면전환페이지
        $(".saveHireBtn").click(e=>{
            $.ajax({
                url:"${path}/member/saveHire",
                type:"get",
                data:{memNo:<c:out value='${mem.memNo}'/>},
	            success:data=>{
	            	$(".a").html("");
	                $(".a").html(data);
	            }
            });
        });
    </script>