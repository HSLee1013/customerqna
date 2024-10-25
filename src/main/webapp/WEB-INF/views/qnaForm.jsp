<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>글 작성</title>
		<style>
			body {
				font-family: Arial, sans-serif;
				background-color: #f9f9f9;
				display: flex;
				justify-content: center;
				/* 수평 가운데 정렬 */
				align-items: center;
				/* 수직 가운데 정렬 */
				height: 100vh;
				/* 화면 전체 높이 사용 */
				margin: 0;
			}

			.container {
				background-color: white;
				padding: 20px;
				border-radius: 8px;
				box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
				width: 400px;
				/* 고정 너비 */
			}

			h1 {
				text-align: center;
				color: #4CAF50;
				/* 제목 색상 */
			}

			p {
				margin: 10px 0 5px;
				/* 위쪽 여백 */
			}

			input[type="text"],
			input[type="password"],
			textarea {
				width: 100%;
				/* 전체 너비 사용 */
				padding: 10px;
				/* 내부 여백 */
				border: 1px solid #ccc;
				/* 테두리 색상 */
				border-radius: 4px;
				/* 모서리 둥글게 */
				box-sizing: border-box;
				/* 패딩 포함 전체 너비 계산 */
			}

			input[type="submit"], input[type="button"] {
				background-color: #4CAF50;
				/* 버튼 배경색 */
				color: white;
				/* 버튼 글자 색상 */
				padding: 10px;
				/* 버튼 내부 여백 */
				border: none;
				/* 테두리 없음 */
				border-radius: 4px;
				/* 모서리 둥글게 */
				cursor: pointer;
				/* 포인터 커서 */
				width: 100%;
				/* 전체 너비 사용 */
				font-size: 16px;
				/* 글자 크기 */
				margin-top: 20px;
				width: 45%;
			}

			input[type="submit"]:hover, input[type="button"]:hover {
				background-color: #45a049;
				/* 호버 시 배경색 변화 */
			}
			
			.submitContainer{
				display: flex;
				justify-content: space-around;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<h1>게시글 작성</h1>
			<form method="post">
				<p>제목</p>
				<input type="text" name="title" required>
				<p>내용</p>
				<textarea name="content" cols="30" rows="10" required></textarea>
				<p>아이디</p>
				<input type="text" name="username" required>
				<p>비밀번호</p>
				<input type="password" name="password" required><br>
				<div class="submitContainer">
					<input type="button" value="취소" onclick="location.href='/qna'">
					<input type="submit" value="작성하기">
				</div>
			</form>
		</div>
	</body>
	<script>
		const form = document.querySelector("form");

		form.addEventListener("submit", function (e) {
			e.preventDefault();
			// fetch form
			const formdata = new FormData(form);
			const qna = Object.fromEntries(formdata);
			const json = JSON.stringify(qna);
			console.log(json);
			// send data
			fetch("/qna/form", {
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: json
			}).then((resp)=>{
				if(resp.status==200){
					alert("작성 성공");
					location.href="/qna";
				}else{
					alert("작성 실패");
					form.reset();
				}
			})
		})

	</script>

	</html>