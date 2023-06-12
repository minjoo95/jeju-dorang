<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<%-- <%@ include file="/WEB-INF/views/header.jsp"%> --%>
<%-- <jsp:include page="/WEB-INF/views/header.jsp" /> --%>
<%-- <jsp:include page="/WEB-INF/views/headerBoot.jsp" /> --%>

<!-- bootstrap-->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
function goBoardWrite(){
	location.href="${pageContext.request.contextPath}/board/boardWrite";
}

</script>

<script>
function changeCateBtnName(ths){
	var text = $(ths).text();
	const btnElement = document.getElementById('srcCateBtn');
	btnElement.innerText = text;
}
</script>

<style>

/* not(html), .wrap, header {
box-sizing: content-box !important;
}
.container, .container * {
box-sizing: border-box !important;
position: relative;
}
 */
#board-main-header {
	height: 800px;
}

div.board-header {
	height : 100px;
	border-bottom-style: solid;
	border-width: 1px;
	/* background-color: red; */
}

p.header-text {
	display: inline-block;
	font-size: 200%;
	padding-top: 4%;
    padding-left: 3%;
}

p.board-main-btn {
	display: inline-block;
	float: right;
	padding-top: 4%;
	margin-right: 3%;
}

p.board-main-btn>button{
	background-color: #FB7A51;
	width: 195px;
	margin-bottom: 0;
}


p.header-text2 {
	/* background-color: yellow; */
	display: inline-block;
	/* border: solid 1px; */
	margin-top: 4%;
	margin-left: 3%;
/* 	margin-bottom: 1% solid 1px; */
	font-size: 200%;
}
	
/* 	p.board-main-btn {
		background-color: #FB7A51;
		height: 45px;
		width: 195px;
		/* border: solid 1px; */
/*		float: right;
		margin-top: 4%;
		margin-right: 3%;
		
	} */
	
/* 	board-main-btn>button{
		background-color: #FB7A51;
	} */
	
/* p.board-main-btn {
	display: inline-block;
	float: right;
	margin-top: 55px;
    margin-right: 2%;
} */
	
/* th{
	marign: auto;
	background-color: #FB7A51;
} */
	
#table-category{
	width: 10%;	
}
	
#table-title{
	width: 50%;
}
	
#table-writer {
	width: 20%;
}
	
#table-date {
	width: 10%;
}
	
#table-like {
	witdh: 10%;
}
	
#boardSearch{
    margin: 0 auto;
    width: 50%;
/*  border: none;
    border-bottom: 1px solid black; */
}
	
/* 	#table-text{
		float: none;
		margin: 0 auto;
	} */

.pagination {
	justify-content: center;
}
.user-div {
	overflow:hidden;
}
#userAge {
	margin: 0;
    width: 60px;
    height: 25px;
    display: flex;
    align-items: center;
    border-radius: 10px;
    justify-content: center;
    border: 1px solid #FB7A51;
}

#userPic {
	background-color: blue;
	width: 150px;
/*	width: 50%;*/
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    float: left;
    margin-left: 3%;
}

#userPic>img{
	width: 100%;
    height: 100%;
    object-fit: cover;

}

.userInfoUpper{
	display: flex;
    align-items: center;

}
#userGender {
	width: 30px;
    height: 27px;
    color: white;
    display: flex;
    margin-left: 5px;
    border-radius: 10px;
    background: #FB7A51;
    align-items: center;
    justify-content: center;
}

#userNickname {
	font-size: 1.5em;
    text-align: center;
}

#userInfo{
	width: 50%;
	height: 100%;
	float: right;
}

#userTags>p{
	width: 100%;
    height: 100%;
    display: flex;
    color: #FFFFFF;
    font-size: 1em;
    border-radius: 8px;
    align-items: center;
    justify-content: center;
    background-color: #FB7A51;
}

.userBtn{
	background-color: white;
	border-color:#FB7A51;
	color:#FB7A51;
}

.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

.boardFooter {
	margin-top: 50px;
	margin-bottom: 50px;
}

.pg {
	margin-top: 50px;
}

</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/headerBoot.jsp" />
<div class = "container" id = "board-main-container">
	<div class="board-header">
		<p class="header-text">후기</p>
		<p class="board-main-btn">
			<button type="button" class="btn text-white" onclick="goBoardWrite()">후기 작성</button>
		</p>
	</div>
	
	<table class="table table-hover">
		<thead>
		    <tr class="text-center align-self-center" id="table-text">
		      <th scope="col" id="table-category">분류</th>
		      <th scope="col" id="table-title">제목</th>
		      <th scope="col" id="table-writer">작성자</th>
		      <th scope="col" id="table-date">날짜</th>
		      <th scope="col" id="table-like">추천</th>
		    </tr>
		</thead>
		<tbody>
		<c:forEach items = "${list}" var="board">
			<tr class="text-center" no = "${board.board_id}">
				<td>${board.board_category}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardDetail?no=${board.board_id}">${board.board_title}</a></td>
				
				<td>
					<a onclick="showWriterInfo(${board.user_code})">${board.user_nickname }</a>
				</td>				
				<td>
					${board.board_reg_date}
				</td>
				<td>${board.board_like}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="btn-group pagination pg">
		<%-- ${pageMaker.prev } --%>
			<c:choose>
				<c:when test="${pageMaker.startPage-1 == 0}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/list?page=1'/>" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.startPage-1 }'/>" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:otherwise>
			</c:choose>			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/list?page=${pageNum }'/>">${pageNum }</a>
			</li>
			</c:forEach>		
			<c:choose>
				<c:when test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.endPage+1 }'/>" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
				<li class="page-item">
					<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.endPage}'/>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	
	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/board/boardSearch">
		<div class="boardFooter">
<!-- 			<button type="button" class="btn text-white dropdown-toggle" id="srcCateBtn" style="background-color:#FB7A51;" 
				data-bs-toggle="dropdown" aria-expanded="false" name="board_category">전체</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" onclick="changeCateBtnName(this)">동행후기</a></li>
				<li><a class="dropdown-item" onClick="changeCateBtnName(this)">여행후기</a></li>
			</ul> -->
			<!-- <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
			<!-- 일단은 제목만 검색하게 -->
			<input class="form-control" type="text" id="boardSearch" name="boardSearch" placeholder="글 제목 검색" aria-label="Search">
			<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
		</div>
	</form>
	
	<!-- Modal -->
	<div class="modal fade" id="userInfoModal" tabindex="-1" aria-labelledby="userInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body user-div">
					<div class="userPic" id="userPic"></div>
					<form name="userBoardForm" id="userBoardForm" action="${pageContext.request.contextPath}/board/userBoard" method="post">
					<div class="userInfo" id="userInfo">
						<!-- 이름 통일... -->
						<div class = "userInfoUpper">
							<span id="userAge"></span>
							<span id="userGender"></span>
						</div>
						<p id="userNickname"></p>
						
						<div id="userTags">
						</div>
						
						<!-- <p id="userTag"></p> -->
						<input type="hidden" id="user_code" name="user_code" value=""/>
					</div>
					<div class="userBtn" id="userBtn">
						<button type="submit" class="btn btn-outline-light userBtn" data-bs-dismiss="modal">작성글보기</button>
						<button type="button" class="btn btn-outline-light userBtn" data-bs-dismiss="modal">닫기</button>	
					</div>
					</form>
				</div>	
			</div>
		</div>
	</div>

<script>
function showWriterInfo(ths){
	
	console.log(ths);
	var user_code = ths;
	console.log("user_code : " + user_code);

	const userInfoModalEl = new bootstrap.Modal(document.querySelector("#userInfoModal"));

	$.ajax({ 
		type: "post",
		url: "${pageContext.request.contextPath}/board/writerInfo",
		data:{
			user_code
		},
		success: function(user) {

			console.log("user : " + user);
			console.log(user.user_id);
			console.log(user.user_code);
				
			$("#userPic").empty();
			$('#userAge').empty();
			$('#userGender').empty();
			$('#userNickname').empty();
			$('#userTags').empty();
				
			let img; //이미지
			let age; //나이대
			let gender; //성별
			let tagArr; //태그
			
			
			if((user.user_pic).indexOf('kakaocdn') == -1){
				
				img = $("<img>").attr({'src':"${contextPath }/resources/uploadProfilePic/${sessionScope.userInfo.user_pic }"});
				
			} else{
				
				img = $("<img>").attr({'src':user.user_pic});
				
			}	
			console.log("img : " + img.src);			
			
			if ((user.user_age_range == '10~14') || (user.user_age_range == '15~19')){
				age = '10대';
			} else if(user.user_age_range == '20~29') {
				age = '20대';				
			} else if(user.user_age_range == '30~39') {
				age = '30대';
			} else if(user.user_age_range == '40~49'){
				age = '40대';
			} else if(user.user_age_range == '50~59') {
				age = '50대';
			} else if(user.user_age_range == '60~69') {
				age = '60대';
			} else if(user.user_age_range == '70~79') {
				age = '70대';
			} else if(user.user_age_range == '80~89') {
				age = '80대';
			} else if(user.user_age_range == '90~' ) {
				age = '90대';
			} else {
				age = '-';
			}
			
			if(user.user_gender == 'female'){
				gender = '여';
			} else {
				gender = '남';
			}
			
			tagArr = (user.user_tag).split(",");
			
			let tagArea = document.getElementById('userTags');
			for(let i = 0; i < tagArr.length; i++){
				let new_pTage = document.createElement('p');
				new_pTage.setAttribute("id", "userTag"+i);
				tagArea.appendChild(new_pTage);
				
				$('#userTag'+i).append(tagArr[i]);
				
			}
			
/* 			
 			for(let i = 0; i < tagArr.length; i++){
				console.log(tagArr[i]);
				$('#userTag').append(tagArr[i]);
				$('#userTag').append('<br/>');
			} */

			$("#userPic").append(img);
			//$('#userAge').append(user.user_age_range);
			$('#userAge').append(age);
			//$('#userGender').append(user.user_gender);
			$('#userGender').append(gender);
			$('#userNickname').append(user.user_nickname);
//			$('#userTag').append(user.user_tag);

			$('input[name=user_code]').attr('value', user.user_code);

			//음..굳이?
			$('button[name=goWriterPage]').attr('onclick', "goWriterPage("+ user.user_code + ")");
	
			userInfoModalEl.show();

		}
	});
}
</script>
<script>
function goWriterPage(code){
	
	console.log(code);
	
}
</script>

</div>
</body>
<%-- <jsp:include page="/WEB-INF/views/footer.jsp" /> --%>
<jsp:include page="/WEB-INF/views/footerBoot.jsp" />
</html>