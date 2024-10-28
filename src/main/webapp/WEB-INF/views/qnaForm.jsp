<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>글 작성</title>
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

h1 {
	text-align: center;
	color: #4CAF50;
}

p {
	margin: 10px 0 5px;
}

input[type="text"], input[type="password"], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"], input[type="button"] {
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

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #45a049;
	/* 호버 시 배경색 변화 */
}

.input-container {
	display: flex;
	justify-content: space-between;
}

.id-container, .pw-container {
	width: 47%;
}

.secret-container {
	text-align: center;
	margin-right: 5px;
}

.secret-container input {
    margin-top: 12px;
    scale: 2.5;
}

.submitContainer {
	text-align: right;
}
</style>
</head>
<body>
	<div class="container">
		<h1>게시글 쓰기</h1>
		<form method="post">
			<p>제목</p>
			<input type="text" name="title" required>
			<div class="input-container">
				<div class="id-container">
					<p>아이디</p>
					<input type="text" name="username" required>
				</div>
				<div class="pw-container">
					<p>비밀번호</p>
					<input type="password" name="password" required>
				</div>
				<div class="secret-container">
					<p>비밀글</p>
					<input type="checkbox" name="secure">
				</div>
			</div>
			<p>내용</p>
			<textarea name="content" rows="33" style="resize: none;" required></textarea>
			<div class="submitContainer">
				<input type="button" value="취소" onclick="location.href='/qna'">
				<input type="submit" value="등록">
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
			if(formdata.has("secure")){
				formdata.delete("secure");
				formdata.append("secure",true);
			}else{
				formdata.append("secure",false);
			}
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