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
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<!--  -->

</head>
<body>
	<div class="container">
		<textarea class="summernote" name="morning"></textarea>
	</div>

	<div class="form-group">
		<label for="content">ToDo</label>
		<textarea class="form-control summernote" id="content" name="lunch"></textarea>
	</div>
	<script>
$('.summernote').summernote({
	  height: 300,
	  lang: "ko-KR"
	});
	
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

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
        
			save: function (){
		    let data = {
		        title: $("#title").val(),
		        content: $("#content").val(),
		    };
		    if(data.title==""){
		        alert("title을 작성해주세요.");
		        return;
		    }
		    $.ajax({
		        type:"POST",
		        url:"/api/writeProc",
		        data: JSON.stringify(data),
		        contentType:"application/json;utf-8",
		    })
		    .done(function (response){
		        if(response.status===500){
		            alert("작성에 실패하였습니다.");
		        }
		        else{
		            alert("작성에 성공하였습니다.");
		        }
		        location.href="/todolist/proceeding?page=0";
		    })
		    .fail(function (error){
		       JSON.stringify(error);
		    })
}
</script>
</body>
</html>