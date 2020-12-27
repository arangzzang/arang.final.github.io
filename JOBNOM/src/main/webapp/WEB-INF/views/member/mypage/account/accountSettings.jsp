<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
	
	<form action="${path}/member/changeEmail" onsubmit="return mem_changeEmail();" class="needs-validation" novalidate>
		<div class="maininfo">
		    <h1 class="maintitle">계정설정</h1>
		    <div>
		        <h3>회원 이메일</h3>
		        <p>${mem.memEmail}</p>
		        <div class="form-gruop">
		            <label for="uname">변경할 이메일 주소</label>
		            <input type="email" class="form-control changeEmail" id="uname" placeholder="변경하실 이메일을 작성해주세요." name="memEmail" required>
		        </div>
		    </div>
		    <div class="text-center enrollBtn">
				<input type="number" class="change_certification">
	            <span class="time"></span>
	            <input type="button" class="btn btn-outline-success email_check" value="인증확인">
	            <input type="button" class="btn btn-outline-success changeEmailBtn" value="이메일 변경">
		    </div>
		</div>
	</form>
                            더 이상 job.nom을 이용하지 않는다면 <a href="${path }/common/userSecession?memNo=${mem.memNo}">회원탈퇴</a>
	
	<script>
	$(function (){
		//email변경(인증하기)
		$(".time").hide();
		$(".email_check").hide();
		$(".change_certification").hide();
		
		
		$(".changeEmailBtn").click(e=>{
			let re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			let changeMail = document.getElementById("uname").value;
			
			if(changeMail!=""){
				if(!re.test(changeMail)){
					alert("이메일 형식이 아닙니다.")
					return false;
				}else{
					$.ajax({
						url:"${path}/checkDuplicate/enrollCommon",
						data:{dupli:changeMail},
						success:data=>{
							if(data==="사용 할 수 있는 email입니다."){
								$(".mem_change_email").val("good");
								$(".time").show();
								$(".email_check").show();
								$(".change_certification").show();
								var timer = null;
								var isRunning = false;
								if($(".mem_change_email").val()=="good"){
									$(".email_check").attr("disabled",false)
									//인증 타이머 설정
									var display = $('.time');
									var leftSec = 180;
									// 남은 시간
									// 이미 타이머가 작동중이면 중지
									if (isRunning){
										clearInterval(timer);
										display.html("");
										startTimer(leftSec, display);
										console.log("true실행")
									}else{
										startTimer(leftSec, display);
										console.log("false실행")
									}
									//타이머 설정
									function startTimer(count, display) {
										var minutes, seconds;
										timer = setInterval(function () {
											minutes = parseInt(count / 60, 10);
											seconds = parseInt(count % 60, 10);
									
											minutes = minutes < 10 ? "0" + minutes : minutes;
											seconds = seconds < 10 ? "0" + seconds : seconds;
									
											display.html(minutes + ":" + seconds);
									
											// 타이머 끝
											if (--count < 0) {
												clearInterval(timer);
												alert("다시 인증해주세요");
												display.html("");
												$('.email_check').attr("disabled","disabled");
												isRunning = false;
												return isRunning;
											}
										}, 1000);
											isRunning = true;
									}
									$.ajax({
										url:"${path}/certification/sendEmail" ,
										data:{mEmail:changeMail},
										type:"get",
										success:data=>{
											alert("인증번호가 전송되었습니다.")
											//이메일 인증비교
											$(".email_check").click(e=>{
												let eNum=$(".change_certification").val();
												console.log(eNum)
												$.ajax({
													url:"${path}/certification/emailCheck",
													data:{eNum:eNum!=""?eNum:"0"},
													success:data=>{
														if(data==0){
															alert("인증번호를 확인해주세요.")
															return false;
														}else if(data!=1){
															alert("인증번호를 틀렸습니다. 다시 확인해 주세요.")
															return false;
														}else{
															clearInterval(timer);
															$(".email_check").hide();
															$(".change_certification").hide()
															$(".time").hide();
															$(".changeEmailBtn").prop("type","submit")
															$(".changeEmailBtn").val("변경하기")
															$(".mem_change_email2").val("good");
															
															
															let mem_change_check=new Array(1).fill(false);
															if(re.test(changeMail)){
																mem_change_check[0]=true;
															}else{
																mem_change_check[0]=false;
																alert("이메일을 양식에 맞게 써주세요")
															}
															if($(".mem_change_email2").val()==""){
																mem_change_check[1]=false;
																alert("인증확인 해주시기 바랍니다.")
															}else{
																mem_change_check[1]=true;
															}
															var all_check = true;
															for(var i=9; i<mem_change_check.length;i++){
																if(mem_change_check[i]==false){
																	all_check=false;
																}
															}
															if(!all_check){
																alert("입력한 정보가 올바르지 않거나 인증확인을 해주시기 바랍니다.")
																return false;
															}
															alert("인증완료")
														}
													}
												});
											});
										}
									})
								}else{
									
								}
							}else{
								alert(data);
								$(".mem_change_email").val("");
								return false;
							}
						}
					})
				}
			}else {
				alert("이메일을 작성해주세요");
				return false;
			};
		})
	})
	
	
	</script>