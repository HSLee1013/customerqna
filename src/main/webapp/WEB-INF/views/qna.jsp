<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<style>
body {
	display: flex;
	justify-content: center;
}

.container {
	width: 70%;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

thead {
	background-color: #f2f2f2;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: center;
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
	margin-top: 20px;
	font-family: Arial, sans-serif;
}

.orderSizeWrite {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	align-items: center;
}

.orderSizeWrite select {
	padding: 8px 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	color: #333;
	background-color: white;
	margin-right: 10px;
}

.button-container button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.button-container button:hover {
	background-color: #45a049;
}

nav {
	display: flex;
	justify-content: center;
	margin-top: 20px;
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
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}

.search-container select,
.search-container input[type="text"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	margin-right: 10px;
}

.search-container button {
	background-color: #4CAF50;
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
		<h1>게시판</h1>
		
		<div class="orderSizeWrite">
			<div class="orderSizeOption">
				<select name="orderOption" onchange="handleOrderChange(this.value)">
					<option value="created_at,DESC"<c:if test="${ sort == 'created_at,DESC'}">selected</c:if>>최신 순</option>
					<option value="created_at,ASC"<c:if test="${ sort == 'created_at,ASC'}">selected</c:if>>오래된 순</option>
					<option value="views,DESC"<c:if test="${ sort == 'views,DESC'}">selected</c:if>>조회수 순</option>
				</select> <select name="sizeOption" onchange="handleSizeChange(this.value)">
					<option value="10" <c:if test="${ size == 10}">selected</c:if>>10개씩</option>
					<option value="20" <c:if test="${ size == 20}">selected</c:if>>20개씩</option>
					<option value="40" <c:if test="${ size == 40}">selected</c:if>>40개씩</option>
				</select>
			</div>
			<div class="button-container">
				<button onclick="location.href='/qna/form'">게시글 작성</button>
			</div>
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
		<table>
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>공개 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${ qnaList }">
					<tr onclick="goToArticle(${ qna.articleId })">
						<!-- 행 클릭 시 상세 보기 -->
						<td>${ qna.articleId }</td>
						<td>${ qna.title }</td>
						<td>${ qna.username }</td>
						<td>${ qna.views }</td>
						<td><c:choose>
								<c:when test="${ qna.secure }">비공개</c:when>
								<c:otherwise>공개</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<c:forEach var="index" begin="1" end="${ totalPage }">
				<c:url var="link" value="/qna">
					<c:if test="${ size != 20 }">
						<c:param name="size">${ size }</c:param>
					</c:if>
					<c:param name="page">${ index }</c:param>
					<c:if test="${ not empty search }">
						<c:param name="searchType">${ searchType }</c:param>
						<c:param name="search">${ search }</c:param>
					</c:if>
					<c:if test="${ sort != 'created_at,DESC' }">
						<c:param name="sort">${ sort }</c:param>
					</c:if>
				</c:url>
				<a href="${ link }" class="${ page == index ? 'current' : '' }">
					${ index } </a>
			</c:forEach>
		</nav>
	</div>
</body>
</html>