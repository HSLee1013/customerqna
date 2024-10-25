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
	width: 70%;
	background-color: white;
	padding: 30px;
	margin: 0 auto;
	border-radius: 8px;
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
	margin-bottom: 5px;
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
}

footer {
	border-top: 1px solid #e6e6e6;
	padding-top: 10px;
	margin-top: 20px;
	text-align: right;
}

footer {
	display: flex;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>${ qna.title }</h1>
			<div class="meta">
				<p>작성자: ${ qna.username }</p>
				<p>조회수: ${ qna.views }</p>
				<p>작성일: ${ qna.createdAt }</p>
			</div>
		</header>

		<div class="content">
			<p>${ qna.content }</p>
		</div>

		<footer>
			<button onclick="">수정</button>
			<button onclick="">삭제</button>
			<button onclick="location.href='/qna'">게시판으로</button>
		</footer>
	</div>

</body>
</html>