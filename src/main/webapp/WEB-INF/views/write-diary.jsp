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
		<form id="post-form"
			action="${pageContext.request.contextPath}/setdiary">
			<%-- <form id="post-form" action="${pageContext.request.contextPath}/testdiary" method="post"> --%>
			<input type="hidden" name="owner"
				value="${sessionScope.account.userid}"> <label
				for="mcontent">아침</label>
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
			<input type="hidden" name="postlist" /> <input type="hidden"
				name="diarylist" />
			<button id="submit">완료</button>
		</form>
	</div>

	<script>
	$(document).ready(function() {
		function sendFile(file){
			var data = new FormData();	
			data.append("file",file);
				$.ajax({
				  url: '${pageContext.request.contextPath}/profileImage',
				  type: "POST",
				  enctype: 'multipart/form-data',
				  data: data,
				  cache: false,
				  contentType : false,
				  processData : false,
				  success: function(image){	
					$('.summernote').summernote('insertImage',image);
					},
					 error: function(e){console.log(e);}  
					});	
				}

					
                    // summernote 
                    $('.summernote').summernote({
                    height :300,
                    minHeight:null,
                    maxHeight:null,
                    focus:true,
                    lang : "ko-KR",
                    placeholder: '내용을 입력해주세요',
                    callbacks: {
                    onImageUpload : function(files){
                    sendFile(files[0]);
                    		}
                    	}
                    });



});

	</script>
</body>
</html>