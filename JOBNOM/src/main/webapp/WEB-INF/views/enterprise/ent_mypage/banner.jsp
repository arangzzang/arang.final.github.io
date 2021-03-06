<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
.jmklabel {
	background-color: /* #e9ecef */;
	color: #495057;
	border: 1px solid #ced4da;
}

.jmkbtn {
	background-color: #00c362;
	color: #fff;
	text-align: center;
	border-radius: 5px;
	font-weight: bold;
	border: 2px black solid;
}
</style>

<section id="content">
	<jsp:include page="/WEB-INF/views/enterprise/ent_mypage/ent_common.jsp">
		<jsp:param name="subheader" value="" />
	</jsp:include>

	<div class="container">
		<form action="${path }/com/bannerEnd.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${commonLogin.memNo }" name="ent_no"
				id="ent_no">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="bann_title"
					id="bann_title" required>
			</div>
			<div class="custom-file">
				<input type="file" class="custom-file-input" name="bann_file"
					id="bann_file"> <label class="custom-file-label"
					for="customFile">배너 사진</label>
			</div>
			<br><br>
			<div style="text-align:center;">
				<input type="submit" class="jmkbtn" value="업로드">
			</div>
		</form>
	</div>

	<br>
	<br>
	<br>
	<br>







</section>
<script>
	function applyAd() {
		location.replace("path/com/applyAd.do");
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />