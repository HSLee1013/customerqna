<%@page import="kr.co.greenart.web.customer.qna.QNA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

.container {
	min-width: 1200px;
	max-width: 1200px;
	background-color: white;
	padding: 30px;
	margin: 0 auto;
	border: 2px solid limegreen;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

thead {
	background-color: #f2f2f2;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 8px;
	text-align: center;
}

table {
	width: 100%;
}

table th:nth-child(1), table td:nth-child(1) {
	width: 100px;
	min-width: 100px;
	max-width: 100px;
}

table th:nth-child(2), table td:nth-child(2) {
	max-width: 684px;
}

table td:nth-child(2) {
 	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: left;
}

table th:nth-child(3), table td:nth-child(3) {
	width: 150px;
	min-width: 150px;
	max-width: 150px;
}

table th:nth-child(4), table td:nth-child(4) {
	width: 70px;
	min-width: 70px;
	max-width: 70px;
}

table th:nth-child(5), table td:nth-child(5) {
	width: 70px;
	min-width: 70px;
	max-width: 70px;
}

th {
	background-color: #4CAF50;
	color: white;
}

tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

tbody tr:hover {
	background-color: #f1f1f1;
	cursor: pointer; /* 커서를 포인터로 변경 */
}

h1 {
	text-align: center;
	margin: 0px;
    padding: 100px;
	font-family: Arial, sans-serif;
}

.title-container{
	background: linear-gradient(to right, Mediumseagreen, limegreen);
    margin-bottom: 10px;
}

.resultoption-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.result-container h4{
	margin : 0px;
	padding-left : 10px;
}

.option-container select {
	padding: 8px 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	color: #333;
	background-color: white;
	margin-right: 5px;
}

.write-container {
	text-align-last: end;
	margin-top: 15px;
}

.write-container button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
	margin-right: 5px;
	transition: background-color 0.3s;
}

.write-container button:hover {
	background-color: #45a049;
}

nav {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

nav a {
	text-decoration: none;
	color: #4CAF50;
	padding: 8px 16px;
	margin: 0 5px;
	border: 1px solid #4CAF50;
	border-radius: 4px;
	transition: background-color 0.3s;
}

nav a:hover {
	background-color: #4CAF50;
	color: white;
}

/* 현재 페이지 스타일 */
nav a.current {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.search-container {
	background-color: #f1f1f1;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
	padding: 10px;
}

.search-container select, .search-container input[type="text"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	margin-right: 10px;
}

.search-container select {
	width: 100px;
}

.search-container input[type="text"] {
	width: 50%;
}

.search-container button {
	background-color: #4CAF50;
	width: 80px;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s;
}

.search-container button:hover {
	background-color: #45a049;
}

</style>
<script>
    function goToArticle(articleId) {
        location.href = '/qna/' + articleId; // 클릭 시 상세 페이지로 이동
    }
    function searchEvent(){
    	const urlParam = new URLSearchParams(location.search);
    	let searchType = document.querySelector('select[name="searchOption"]').value;
    	let search = document.querySelector('input[name="search"]').value;
     	let url= '/qna?searchType='+searchType+'&search='+search;
    	url+=urlAddSize(urlParam,url);  
    	url+=urlAddSort(urlParam,url);  
    	location.href=url;
    }
    function handleOrderChange(value) {
    	const urlParam= new URLSearchParams(location.search);
    	let url='/qna?sort='+value;
    	url+=urlAddSize(urlParam,url);        
    	url+=urlAddSearch(urlParam,url);        
        location.href=url;
    }
    function handleSizeChange(value) {
    	const urlParam= new URLSearchParams(location.search);
    	let url='/qna?size='+value;
    	url+=urlAddSort(urlParam,url);        
    	url+=urlAddSearch(urlParam,url);    
        location.href=url;
    }
    function urlAddSize(urlParam,url){
    	let size=urlParam.get('size');
        if(size!=null)
        	return "&size="+size;      
        return "";
    }
    function urlAddSort(urlParam,url){
    	let sort=urlParam.get('sort');
        if(sort!=null)
        	return "&sort="+encodeURIComponent(sort);
        return "";
    }
    function urlAddSearch(urlParam,url){
    	let search=urlParam.get('search');
    	let searchType=urlParam.get('searchType');
    	if(search!=null)
    		return "&searchType="+searchType+"&search="+search;
    	return "";
    }
</script>
</head>
<body>
	<div class="container">
		<div class="title-container">
			<h1>Q&A 게시판</h1>
		</div>

		<div class="search-container">
			<select name="searchOption">
				<option value="title"<c:if test="${ searchType == 'title'}">selected</c:if>>제목</option>
				<option value="content"<c:if test="${ searchType == 'content'}">selected</c:if>>내용</option>
				<option value="username"<c:if test="${ searchType == 'username'}">selected</c:if>>작성자</option>				
			</select>
			<input type="text" name="search" value="${ search }"  onkeypress="if(event.key === 'Enter') searchEvent()">
			<Button onclick="searchEvent()">검색</Button>
		</div>
		
		<div class="resultoption-container">
			<div class="result-container">
				<h4>총 게시물 ${ count }건 | 현재 페이지 ${ page }/${ totalPage }</h4>				
			</div>
			<div class="option-container">
				<select name="orderOption" onchange="handleOrderChange(this.value)">
					<option value="created_at,DESC"<c:if test="${ sort == 'created_at,DESC'}">selected</c:if>>최신 순</option>
					<option value="created_at,ASC"<c:if test="${ sort == 'created_at,ASC'}">selected</c:if>>오래된 순</option>
					<option value="views,DESC"<c:if test="${ sort == 'views,DESC'}">selected</c:if>>조회수 순</option>
				</select>
				<select name="sizeOption" onchange="handleSizeChange(this.value)">
					<option value="10" <c:if test="${ size == 10}">selected</c:if>>10개씩</option>
					<option value="20" <c:if test="${ size == 20}">selected</c:if>>20개씩</option>
					<option value="40" <c:if test="${ size == 40}">selected</c:if>>40개씩</option>
				</select>
			</div>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>등록일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${ qnaList }">
					<tr onclick="goToArticle(${ qna.articleId })">
						<!-- 행 클릭 시 상세 보기 -->
						<td>${ qna.articleId }</td>
						<td><c:if test="${ qna.secure }">🔒︎ </c:if>${ qna.title }</td>
						<td>${ qna.username }</td>
						<%
						QNA qna = (QNA) pageContext.getAttribute("qna");
						LocalDateTime createdAt = qna.getCreatedAt();
						LocalDateTime now = LocalDateTime.now();

						DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("YY.MM.dd");
						DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
						DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM.dd");
						String formatDate;
						if (createdAt.toLocalDate().getYear() != now.getYear()) {
							formatDate = createdAt.format(yearFormatter);
						} else if (createdAt.toLocalDate().isEqual(now.toLocalDate())) {
							formatDate = createdAt.format(timeFormatter);
						} else {
							formatDate = createdAt.format(dateFormatter);
						}
						pageContext.setAttribute("formatDate", formatDate);
						%>
						<td>${ formatDate }</td>
						<td>${ qna.views }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="write-container">
			<button onclick="location.href='/qna/form'">글쓰기</button>
		</div>
		<nav>
			<c:url var="base" value="/qna">
				<c:if test="${ size != 20 }">
					<c:param name="size">${ size }</c:param>
				</c:if>
				<c:if test="${ not empty search }">
					<c:param name="searchType">${ searchType }</c:param>
					<c:param name="search">${ search }</c:param>
				</c:if>
				<c:if test="${ sort != 'created_at,DESC' }">
					<c:param name="sort">${ sort }</c:param>
				</c:if>
			</c:url>
			<c:if test="${ start != 1 }">
				<c:url var="ll" value="${ base }">
					<c:param name="page">${ 1 }</c:param>
				</c:url>
				<a href="${ ll }">≪</a>
				<c:url var="l" value="${ base }">
					<c:param name="page">${ start - 1 }</c:param>
				</c:url>
				<a href="${ l }">＜</a>
			</c:if>

			<c:forEach var="index" begin="${ start }" end="${ end }">
				<c:url var="link" value="${ base }">
					<c:param name="page">${ index }</c:param>
				</c:url>
				<a href="${ link }" class="${ page == index ? 'current' : '' }">${ index }</a>
			</c:forEach>
			
			<c:if test="${ end != totalPage }">
				<c:url var="r" value="${ base }">
					<c:param name="page">${ end + 1 }</c:param>
				</c:url>
				<a href="${ r }">＞</a>
				<c:url var="rr" value="${ base }">
					<c:param name="page">${ totalPage }</c:param>
				</c:url>
				<a href="${ rr }">≫</a>
			</c:if>
		</nav>
	</div>
</body>
</html>