<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SummerNoteExample</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<!--  -->

</head>
<body>

	<form:form modelAttribute="postVO" action="${pageContext.request.contextPath}/post-detail" >
	         <form:hidden path="ownerid" value="${sessionScope.account.userid}"/>
	         
	    	 <label for="content">아침</label>
			 <form:textarea path="morning" class="summernote"/>
	         
	    	 <label for="content">점심</label>
			 <form:textarea path="lunch" class="summernote"/>
	         
	    	 <label for="content">저녁</label>
			 <form:textarea path="dinner" class="summernote"/>
	         
	    	 <label for="content">간식</label>
			 <form:textarea path="snack" class="summernote"/>
	         
	    	 <label for="content">야식</label>
			 <form:textarea path="midnight" class="summernote"/>
   </form:form>
	<script>
		$('.summernote').summernote({
			height : 300,
			lang : "ko-KR"
		});

		$(document)
				.ready(
						function() {

							var toolbar = [
									// 글꼴 설정
									[ 'fontname', [ 'fontname' ] ],
									// 글자 크기 설정
									[ 'fontsize', [ 'fontsize' ] ],
									// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'strikethrough', 'clear' ] ],
									// 글자색
									[ 'color', [ 'forecolor', 'color' ] ],
									// 표만들기
									[ 'table', [ 'table' ] ],
									// 글머리 기호, 번호매기기, 문단정렬
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									// 줄간격
									[ 'height', [ 'height' ] ],
									// 그림첨부, 링크만들기, 동영상첨부
									[ 'insert', [ 'picture', 'link', 'video' ] ],
									// 코드보기, 확대해서보기, 도움말
									[
											'view',
											[ 'codeview', 'fullscreen', 'help' ] ] ];

							var setting = {
								height : 300,
								minHeight : null,
								maxHeight : null,
								focus : true,
								lang : 'ko-KR',
								toolbar : toolbar,
								callbacks : { //여기 부분이 이미지를 첨부하는 부분
									onImageUpload : function(files, editor,
											welEditable) {
										for (var i = files.length - 1; i >= 0; i--) {
											uploadSummernoteImageFile(files[i],
													this);
										}
									}
								}
							};

							$('#summernote').summernote(setting);
						});

		
	</script>
</body>
</html>