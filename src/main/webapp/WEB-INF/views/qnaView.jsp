<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="kr.co.greenart.web.customer.qna.QNA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
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

header {
	border-bottom: 2px solid #e6e6e6;
	padding-bottom: 15px;
	margin-bottom: 20px;
}

h1 {
	font-size: 24px;
	color: #333;
	margin-top: 0px;
	margin-bottom: 20px;
}

.meta {
	color: #999;
	font-size: 14px;
}

.meta p {
	margin: 3px 0;
}

.content {
	margin: 20px 0;
	line-height: 1.8;
	font-size: 16px;
	color: #444;
}

.content p {
	margin-bottom: 15px;
	word-break: break-all;
}

footer {
	border-top: 1px solid #e6e6e6;
	padding-top: 10px;
	margin-top: 20px;
	display: flex;
	justify-content: flex-end;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100px;
	font-size: 16px;
	margin-top: 20px;
	margin-right: 5px;
}

button {
	background-color: #45a049;
}

</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>${ qna.title }</h1>
			<div class="meta">
				<p>작성자: ${ qna.username }</p>
				<%
				QNA qna = (QNA) request.getAttribute("qna");
				LocalDateTime createdAt = qna.getCreatedAt();

				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss");
				String formatDate = createdAt.format(dateTimeFormatter);
				
				pageContext.setAttribute("formatData", formatDate);
				%>
				<p>작성일: ${ formatData }</p>
				<p>조회수: ${ qna.views }</p>
			</div>
		</header>

		<div class="content">
			<p>${ qna.content }</p>
		</div>

		<footer>
			<button onclick="location.href='/qna/modify/'+<%= qna.getArticleId() %>">수정</button>
			<button onclick="location.href='/qna/delete/'+<%= qna.getArticleId() %>">삭제</button>
			<button onclick="location.href='/qna'">목록</button>
		</footer>
	</div>

</body>
</html>