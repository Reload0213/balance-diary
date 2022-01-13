<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script
	src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<!--  -->

</head>
<body>

	<div class="container">
		<form id="post-form" action="${pageContext.request.contextPath}/setdiary">
		<%-- <form id="post-form" action="${pageContext.request.contextPath}/testdiary" method="post"> --%>
			<input type="hidden" name="owner" value="${sessionScope.account.userid}">

			<label for="mcontent">아침</label>
			<textarea class="summernote" name="mcontent"></textarea>

			<label for="lcontent">점심</label>
			<!-- id로 맵핑시키나? -->
			<textarea class="summernote" name="lcontent"></textarea>

			<label for="dcontent">저녁</label>
			<textarea class="summernote" name="dcontent"></textarea>

			<label for="scontent">간식</label>
			<textarea class="summernote" name="scontent"></textarea>

			<label for="mncontent">야식</label>
			<textarea class="summernote" name="mncontent"></textarea>
			<input type="hidden" name="postlist" />
			<input type="hidden" name="diarylist" />
			<button id="submit">완료</button>
		</form>
	</div>

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

	 	/* $(function() {
			$("#submit").click(function() {
				const formData = new FormData();
				const $post = $(".summernote");
				let posts = $post[0].posts;

				for (var i = 0; i < posts.length; i++) {
					formData.append("setpost", posts[i])
				}

				$.ajax({
					url : '${pageContext.request.contextPath}/setpost',
					processData : false,
					contentType : false,
					data : formData,
					type : "post",
					datatype : "json",
					success : function(result) {
						console.log(JSON.stringify(result));
						$("#postlist").val(JSON.stringify(result));
						 $("#diary-form").submit(); 
					}
				});
			});
		});  */
	</script>
</body>
</html>