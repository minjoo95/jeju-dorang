<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>

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

a {
	text-decoration: none;
 	color: black;
}
 
#board-my-container {
	height: 80%;
}

div.board-header {
/* 	height : 100px;
	border-bottom-style: solid;
	border-width: 1px; */
	/* background-color: red; */
/* 	vertical-align: middle; */
	
	text-align: left;
	margin-bottom: 10px;
}

p.header-text {
	display: inline-block;
	font-size: 200%;
	padding-top: 4%;
    padding-left: 3%;
}

#table-text{
	color: #FB7A51;
}
#table-category{
	width: 20%;	
}
	
#table-title{
	width: 50%;
}	
	
#table-date {
	width: 20%;
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

.go-list-btn{
	float: right;
	background-color:#FB7A51;
	width: 135px;
	height: 35px;
}

.go-btn {
	/* background: #D9D9D9; */
	border-radius: 5px;
}
.go-btn:hover,
.go-btn:active{
	background: #D9D9D9;
	color: white;
}

.go-btn:visited {
  background: #7ea338;
  color: white;
}
.go-btn {
	border: 0;
}
.pagination {
	justify-content: center;
}

.myPage_item_a {
	text-decoration: none;
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

</style>

<script>
function change_btn(e){
	console.log("여기");
	var btns = document.querySelectorAll(".go-btn");
	btns.forEach(function (btn, i){
		if(e.currentTarget == btn){
			btn.classList.add("active");
		} else{
			btn.classList.remove("active");
		}

	});

	console.log(e.currentTarget);
	
}
</script>
</head>
<body>
<div class = "container" id = "board-my-container">
	<h3>&nbsp;</h3>
	<div class="board-header">
		<button type="button" class="go-btn" onclick="change_btn(event); location.href='${contextPath }/dorang/board/myBoardList?user=${sessionScope.userInfo.user_code }'">내가 작성한 글</button>
		<button type="button" class="go-btn" onclick="change_btn(event); location.href='${contextPath }/dorang/board/myCommentList?user=${sessionScope.userInfo.user_code }'">내가 작성한 댓글</button>
	</div>
	<table class="table table-hover">
		<thead>
		    <tr class="text-center align-self-center" id="table-text">
		      <th scope="col" id="table-category">분류</th>
		      <th scope="col" id="table-title">제목</th>
		      <th scope="col" id="table-date">날짜</th>
		    </tr>
		</thead>
		<tbody>
		<c:forEach items = "${list}" var="board">
			<tr class="text-center" no = "${board.board_id}">
				<td>${board.board_category}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardDetail?no=${board.board_id}">${board.board_title}</a></td>
				<td>
					${board.board_reg_date}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<nav aria-label="Page navigation example">
		<ul class="btn-group pagination">
		<%-- ${pageMaker.prev } --%>
			<c:choose>
				<c:when test="${pageMaker.startPage-1 == 0}">
					<li class="page-item">
						<a class="page-link" href="" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/myBoardList?user=${user.user_code}&page=${pageMaker.startPage-1 }'/>" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:otherwise>
			</c:choose>			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/myBoardList?user=${user.user_code}&page=${pageNum }'/>">${pageNum }</a>
			</li>
			</c:forEach>		
			<c:choose>
				<c:when test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/myBoardList?user=${user.user_code}&page=${pageMaker.endPage+1 }'/>" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
				<li class="page-item">
					<a class="page-link" href="" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</div>


</body>
</html>