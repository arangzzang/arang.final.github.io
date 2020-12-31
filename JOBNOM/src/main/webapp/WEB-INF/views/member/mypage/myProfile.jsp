<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path }/resources/css/mypage/myProfile.css"/>

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" /> -->
<script src="${path}/resources/js/month/jquery-ui.js"></script>

<!-- year_picker -->
<script src="${path}/resources/js/year-select.js"></script>
<!-- month_picker -->
<link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${path }/resources/css/MonthPicker.css"/>
<script src="${path}/resources/js/month/MonthPicker.js"></script>



    <div class="with-parent">
		<div class="with" style="padding-bottom: 50px;">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="a">
			<form action="${path }/resume/insertResume" method="POST" onsubmit="return required();">
				<div class="profilebody">  
					<div class="container">
						<div class="row">
							<div class="col-md-5">
								<h2>
									<span>나의 이력서(필수)</span>
								</h2>
							</div>
						</div>
						<span class="col-md-12 span2">이름, 핸드폰 번호</span>
						<input type="hidden" value="이력서넘버">
						<input type="hidden" value="이메일">
						<div class="row">
							<div class="col-md-6">
								<input type="text" id="memName" class="input1" name="resName" placeholder="이름을 작성해주세요." required>
							</div>
							<div class="col-md-6">
								<input type="text" id="memTel" class="input1" name="resPhone" placeholder="번호를 작성해주세요." required>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<span class="span1">성별</span>
								<label for="memGender-M">남자</label>
								<input type="checkbox" class="gender" name="resGender" onclick="genderCheck(this);" aria-required="false" id="memGender-M" >
								<label for="memGender-F">여자</label>
								<input type="checkbox" class="gender" name="resGender" onclick="genderCheck(this);" aria-required="false" id="memGender-F" >
							</div>
							<div class="col-md-6 b">
								<span class="span1">출생연도</span>
								<select class="yrselectdesc" name="resBirth"></select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<span class="span2">현재(관심)직종</span>
								<div class="flex">
									<c:if test="${!empty cate }">
										<select class="input1 mem_category col-md-6" id="mem_category"  required>
											<option value="none">기타</option>
											<c:forEach var="cate1" items="${cate }" varStatus="Status">
				                           			<option value="${cate1.cateNo }" ${mem.cateNo==cate1.cateNo?"selected":"id='false'"} class="mem_opt1"><c:out value="${cate1.job }"/></option>
				                           </c:forEach>
										</select>
									</c:if>
									<select class="input1 mem_category2 col-md-6" name="category2" id="mem_category2" required>
										<option value="none">기타</option>
										<c:forEach var="cate3" items="${cate3 }" varStatus="Status">
												<option value="${cate3.cateNo2 }" ${mem.cateNo2==cate3.cateNo2?"selected":"id='false'" }><c:out value="${cate3.jobs2 }"/></option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="line">
									<label for="career" class="span2">경력</label>
									<select name="" id="career" name="resCar" class="input1" required>
										<option value="">선택해주세요</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10년이상</option>
									</select>
									<label for="skill" class="span2">업무 및 스킬</label>
									<input type="text" class="form-control inp" name="resContent" id="skill" placeholder="(예시) 영업기획, 디지털마케팅,UI디자인(업무와 관련된 자격증 및 기술명 포함)" required>
									
									<ul class="keyword">
										<li class="keys"><a class="values"></a></li>
									</ul>
							
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-md-12">
								<label for="commented" class="span2">자기소개</label><br>
								<textarea class="form-control inp bg_color" rows="5" id="commented" placeholder="경력,경험위추의 자기소개를 작성해주세요. 관심분야, 앞으로의 목표등의 내용도 좋습니다"></textarea>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="profilebody"> 
					<div class="container">
						<!-- 학력사항 -->
						<div class="edu_parent">
							<div class="row edu">
								<div class="col-12 col-md-12 nth">
									<span class="span2 pd">학력사항</span>
									<div id="element1">
										<div class="col-4 col-md-4" id="element2">
											<div class="dateElement">
												<input type="text" class="edu_term inp" name="eduTerm" id='edu_term' placeholder="년/월">&nbsp;~&nbsp;
												<input type="text" class="edu_termend inp" name="eduTermend" id='edu_termend' placeholder="년/월">
											</div>
											<label for="goal">졸업</label>
											<input type="checkbox" name="eduGoal" id="goal">
											<label for="end">중퇴</label>
											<input type="checkbox" name="eduEnd" id="end">
											<label for="ing">재학중</label>
											<input type="checkbox" name="eduIng" id="ing">
										</div>
										<div class="col-8 col-md-8">
											<div>
												<input type="text" name="eduName" class="col-md-12 inp" placeholder="학교명을 입력해주세요">
												<!-- 
												<div>
													<ul>
														<li><a href=""></a></li>
														<li><a href=""></a></li>
														<li><a href=""></a></li>
														<li><a href=""></a></li>
														<li><a href=""></a></li>
														<li><a href=""></a></li>
													</ul>
												</div>  
												-->
												<input type="text" name="eduMajor" class="col-md-12 inp" placeholder="전공 및 학위">
												<textarea name="eduContents"  cols="30" class="bg_color form-control col-md-12 inp" placeholder="학력사항 내용" rows="10"></textarea>
											</div>
											<button type="button" class="float junk"><i>휴지통아이콘</i></button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<button type="button" class="eduBtn">학력추가</button>
						</div>
						<!-- 활동 및 수상내역 -->
						<div class="awa_parent">
							<div class="row awa">
								<div class="col-12 col-md-12">
									<span class="span2" >활동 및 수상내역</span>
									<div id="element1">
										<div class="col-4 col-md-4">
											<div class="dateElement">
												<input type="text" class="awa_term inp" name='awaTerm' id='awa_term' placeholder="년/월">&nbsp;~&nbsp;
												<input type="text" class="awa_termend inp" name='awaTermend' id='awa_termend' placeholder="년/월">
											</div>
											<label for="prize">수상</label>
											<input type="checkbox" name='awaYn' id="prize">
										</div>
										<div class=" col-8 col-md-8">
											<div>
												<input type="text" class="col-md-12 inp" name='awaName' placeholder="활동 및 수상 명을 입력해주세요">
												<textarea name='awaContents' class="bg_color form-control col-md-12 inp" cols="30" rows="10" placeholder="활동 및 수상내역을 작성해주세요"></textarea>
											</div>
											<button class="float"><i>휴지통아이콘</i></button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<button type="button" class="awaBtn">활동/수상내역 추가</button>
						</div>
						<!-- 경력사항 -->
						<div class="car_parent">
							<div class="row car">
								<div class="col-12 col-md-12">
									<span class="span2" >경력 사항</span>
									<div id="element1">
										<div class="col-4 col-md-4">
											<div class="dateElement">
												<input type="text" class="car_term" name='carTerm' id='car_term' placeholder="년/월">&nbsp;~&nbsp;
												<input type="text" class="car_termend" name='carTermend' id='car_termend' placeholder="년/월">
											</div>
											<label for="Incumbent">재직중</label>
											<input type="checkbox" name='carAttend' id="Incumbent">
											<label for="Leaves">퇴사</label>
											<input type="checkbox" name='carAttend' id="Leaves">
										</div>
										<div class=" col-8 col-md-8">
											<input type="text" name="carName" class="col-md-12 inp" placeholder="기업명">
											<!-- <div>
												<ul>
													<li><a href=""></a></li>
													<li><a href=""></a></li>
													<li><a href=""></a></li>
													<li><a href=""></a></li>
													<li><a href=""></a></li>
													<li><a href=""></a></li>
												</ul> 
											</div> -->
											<div class="element1" style="display: flex;">
												<input type="text" class="col-md-6 inp" name="carDept" placeholder="부서">
												<input type="text" class="col-md-6 inp" name="carRank" placeholder="직책">
											</div>
											<input type="text" class="col-md-12 inp" name="carDuty"  placeholder="직무">
										<!-- <div>
											<ul>
												<li><a href=""></a></li>
												<li><a href=""></a></li>
												<li><a href=""></a></li>
												<li><a href=""></a></li>
												<li><a href=""></a></li>
												<li><a href=""></a></li>
											</ul> 
										</div> -->
											<textarea name="carContents" class="bg_color form-control col-md-12 inp" placeholder="업무경험을 적어주세요" cols="30" rows="10"></textarea>
											<button class="float"><i>휴지통아이콘</i></button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<button type="button" class="carBtn">경력 추가</button>
						</div>
						<!-- 자격증 및 기타 -->
						<div class="cer_parent">
							<div class="row cer">
								<div class="col-md-12">
									<div class="element1">
										<span class="span2" >자격증 및 기타</span>
										<div id="emt">
											<input type="text" class="col-md-12 inp" name="licName" placeholder="항목(자격증,언어,스킬 등 자유롭게 기재)">
											<textarea name="" class="bg_color form-control col-md-12 inp" name="licContents" placeholder="자세하게 입력해주세요" cols="30" rows="10"></textarea>
											<button class="float1"><i>휴지통아이콘</i></button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<button type="button"class="cerBtn">자격증 추가</button>
						</div>
						<!-- 포트폴리오 파일 -->
						<div class="pofol_parent">
							<div class="row pofol">
									<span class="span2" >포트폴리오 파일 첨부 - 다운로드한 PDF에는 포트폴리오 파일이 제외됩니다.</span>
									<div style="padding-bottom: 10px;" class="col-12 col-md-12 pd" id="emt">
										<input type="file" name='pofolFile'>
									</div>
							</div>
						</div>
						<div>
							<button type="button" class="pofolBtn">파일 추가</button>
						</div>
						<!-- 공개 미공개 여부 -->
						<div class="row">
							<div class="offset-4 col-4">
								<label for="yes">공개</label>
								<input type="checkbox" name="resOpencheck" id="yes">
								<label for="no">미공개</label>
								<input type="checkbox" name="resOpencheck" id="no">
							</div>
						</div>
					</div>
				</div>
				<div class="submitTag">
					<input type="submit" class="profileBtn" value="저장완료">
				</div>
			</form>
			</div>
	    </div>
	</div>

<script type="text/javascript">
	//업무 및 스킬 자동검색어 
	$("#skill").keyup(e=>{
		let skill=$("#skill").val()
		$.ajax({
			url:"${path}/resume/mySkill",
			data:{skill:skill},
			success:data=>{
				$.each(data,function(){
					$(".values").html(data);
				})
			}
		})
	})
	//year-picker
	$(document).ready(function(e) {
		$('.yrselectdesc').yearselect({
			start:1940,
			end:2030,
			order: 'desc',
			selected: 2020
		});
		$(".yrselectdesc").change(e=>{
			let birth_index=$(".yrselectdesc option").index($(".mem_catagory option:selected"));
			console.log(typeof $(".yrselectdesc").val())
			console.log(birth_index);
		})
	});

	$(document).ready(function(){
		var option={
				startYear:1940,
				finalYear:2040,
				selectedYear:2020,
				Button: "<i class='far fa-calendar-alt calendar' style='cursor: pointer'></i>",
				monthName:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		};
		$(".edu_term").MonthPicker(option);
		$(".edu_term").bind('click',function(){
			$(".edu_term").monthpicker('show');
		});
// 		$(".edu_term").monthpicker().bind('monthpicker-click-month',function(e,month){
// 			alert("선택한월 :"+month)
// 		})
	});

	//check선택시 다른 checkbox비활성화
	function genderCheck(chk){
		var gender = document.getElementsByClassName("aaa");
		for(var i=0; i<gender.length; i++){
			if(gender[i] != chk){
				gender[i].checked = false;
			}
		}
	}
		
	//select box 값 바꾸기
	$(function(){
		$(".mem_category").change(e=>{
			let job1=$(".mem_category option").index($(".mem_category option:selected"));
			$.ajax({
				url:"${path}/member/selectJob",
				data:{cateNo:job1},
				type:"get",
				success:data=>{
					console.log(data)
					$(".mem_category2").empty();
					if(job1!=0){
						for(var i=0; i<data.length; i++ ){
							var opt = $("<option value='"+data[i]['cateNo2']+"'>"+data[i]['jobs2']+"</option>")
							$(".mem_category2").append(opt);
						}
					}else{
						$(".mem_category2").find('option').remove();
						$(".mem_category2").append("<option value='0'>기타</option>");
					}
				}
			})
		})
	})
	//학력사항
	var edu="<div class='row edu'>";
		edu+="<div class='col-12 col-md-12 nth'>";
		edu+="<span class='span2 pd'>학력사항</span>";
		edu+="<div id='element1'>"
		edu+="<div class='col-4 col-md-4' id='element2'>";
		edu+="<div class='dateElement'>";
		edu+="<input type='text' class='dateinput' name='eduTerm' id='edu_term' placeholder='년/월'>&nbsp;~&nbsp;";
		edu+="<input type='text' class='dateinput' name='eduTermend' id='edu_termend' placeholder='년/월'></div>";
		edu+="<label for='goal'>졸업</label>";
		edu+="<input type='checkbox' name='eduGoal' id='goal'>";
		edu+="<label for='end'>중퇴</label>";
		edu+="<input type='checkbox' name='eduEnd' id='end'>";
		edu+="<label for='ing'>재학중</label>";
		edu+="<input type='checkbox' name='eduIng' id='ing'></div>";
		edu+="<div class=' col-8 col-md-8'>";
		edu+="<div><button type='button' onclick='remove();' class='float junk'><i>휴지통아이콘</i></button><input type='text' name='eduName' class='col-md-12 inp' placeholder='학교명을 입력해주세요'>";
		//추후에 수정해야할 부분
		edu+="<!-- <div><ul><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li></ul></div>-->";
		edu+="<input type='text' name='eduMajor' class='col-md-12 inp' placeholder='전공 및 학위'>";
		edu+="<textarea name='eduContents'  cols='30' class='bg_color form-control col-md-12 inp' placeholder='학력사항 내용' rows='10'></textarea></div></div></div></div></div>";
	//활동 및 수상내역
	var awa="<div class='row awa'>";
		awa+="<div class='col-12 col-md-12'>";
		awa+="<span class='span2' >활동 및 수상내역</span>";
		awa+="<div id='element1'><div class='col-4 col-md-4'>";
		awa+="<div class='dateElement'><input type='text' class='dateinput inp' name='awaTerm' id='awa_term' placeholder='년/월'>&nbsp;~&nbsp";
		awa+="<input type='text' class='dateinput inp' name='awaTermend' id='awa_termend' placeholder='년/월'></div>";
		awa+="<label for='prize'>수상</label><input type='checkbox' name='awaYn' id='prize'></div>";
		awa+="<div class='col-8 col-md-8'><div>";
		awa+="<input type='text' class='col-md-12 inp' name='awaName' placeholder='활동 및 수상 명을 입력해주세요'>";
		awa+="<textarea name='awaConetnts' class='bg_color form-control col-md-12 inp' cols='30' rows='10' placeholder='활동 및 수상내역을 작성해주세요'></textarea></div>";
		awa+="<button class='float'><i>휴지통아이콘</i></button></div></div></div></div>";
	//경력사항(checkbox name 이름 같게 했음)
	var car="<div class='row car'><div class='col-12 col-md-12'><span class='span2' >경력 사항</span>";
		car+="<div id='element1'><div class='col-4 col-md-4'><div class='dateelement'>";
		car+="<input type='text' class='car_term inp' name='carTerm' id='car_term' placeholder='년/월'>&nbsp;~&nbsp;";
		car+="<input type='text' class='car_termend inp' name='carTermend' id='car_termend' placeholder='년/월'></div>";
		car+="<label for='Incumbent'>재직중</label><input type='checkbox' name='carAttend' id='Incumbent'>";
		car+="<label for='Leaves'>퇴사</label><input type='checkbox' name='carAttend' id='Leaves'>";
		car+="</div><div class='col-8 col-md-8'><input type='text' class='col-md-12 inp' name='carName'  placeholder='기업명'>";
		//추후에 수정해야할 부분
		car+="<!-- <div><ul><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li></ul></div> -->";
		car+="<div class='element1' style='display: flex;'><input type='text' class='col-md-6 inp' name='carDept' placeholder='부서'>";
		car+="<input type='text' class='col-md-6 inp' name='carRank' placeholder='직책'></div>";
		car+="<input type='text' class='col-md-12 inp' name='carDuty' placeholder='직무'>";
		//추후에 수정해야할 부분						
		car+="<!-- <div><ul><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li><li><a href=''></a></li></ul></div> -->";
		car+="<textarea name='carContents' class='bg_color form-control col-md-12 inp' placeholder='업무경험을 적어주세요' cols='30' rows='10'></textarea>";
		car+="<button class='float'><i>휴지통아이콘</i></button></div></div></div></div>";
	//자격증
	var cer="<div class='row cer'><div class='col-md-12'>";
		cer+="<div class='element1'><span class='span2'>자격증 및 기타</span>";
		cer+="<div id='emt'><input type='text' class='col-md-12 inp' name='licName' placeholder='항목(자격증,언어,스킬 등 자유롭게 기재)'>";
		cer+="<textarea name='' class='bg_color form-control col-md-12 inp' name='licContents' placeholder='자세하게 입력해주세요' cols='30' rows='10'></textarea>";
		cer+="<button class='float1'><i>휴지통아이콘</i></button></div></div></div></div>";
	//포폴 파일
	var pofol="<div class='row pofol'><div style='padding-bottom: 10px;' class='col-12 col-md-12 pd' id='emt'><input type='file' name='pofolFile'></div></div>";
	//요소 추가
	
	//학력사항추가
	$(".eduBtn").click(e=>{
		$(".edu_parent").append(edu)
	})
	//활동및수상내역추가
	$(".awaBtn").click(e=>{
		$(".awa_parent").append(awa);
	})
	//경력사항 추가
	$(".carBtn").click(e=>{
		$(".car_parent").append(car);
	})
	//자격증 추가
	$(".cerBtn").click(e=>{
		$(".cer_parent").append(cer);
	})
	//포트폴리오추가
	$(".pofolBtn").click(e=>{
		$(".pofol_parent").append(pofol);
	})
	
	//요소 삭제(미완)
	$(".junk").click(e=>{
		let trash=$(e.target).val();
		trash.detach();
	})
		
	//저장시 필수항목 확인 검사
	$(".profileBtn").click(e=>{
		let saveCheck=new Array(5).fill(false);
		if($("#memName").val ==""){
			$(".sResult1").html("이름은 필수 항목입니다.");
			saveCheck[0]=false;
		}else{
			saveCheck[0]=true;
		}
		if($("#memTel").val()==""){
			$(".sResult2").html("번호는 필수 항목입니다.");
			saveCheck[1]=false;
		}else{
			saveCheck[1]=true;
		}
		if($(".gender").val()!="checked"){
			$(".sResult3").html("성별은 반드시 체크 해야합니다.");
			saveCheck[2]=false;
		}else{
			saveCheck[2]=true;
		}
		if($(".mem_category").var()=="기타" || $(".mem_category option").index($(".mem_catagory option:selected"))==0){
			$(".sResult4").html("직업군은 필수 항목입니다.");
			saveCheck[3]=false;
		}else{
			saveCheck[3]=true;
		}
		if($("#career").var()=="기타" || $("#career option").index($("#career option:selected"))==0){
			$(".sResult5").html("경력은 필수 항목입니다.");
			saveCheck[4]=false;
		}else{
			saveCheck[4]=true;
		}
		if($("#skill").val()==""){
			$(".sResult6").html("업무 및 스킬은 필수 항목입니다.");
			saveCheck[5]=false;
		}else{
			saveCheck[5]=true;
		}
		var saveAllCheck=true;
		for(var i=0; i<saveCheck.length; i++){
			if(saveCheck[i]==false){
				saveAllCheck=false;
			}
		}
		if(!saveAllCheck){
			alert("필수 항목은 반드시 작성해주셔야 합니다.")
		return false;
		}
	});
</script>
		
