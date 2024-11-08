<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>비밀번호 입력</title>
		<style>
			body {
				font-family: 'Nanum Gothic', sans-serif;
				background-color: #f4f4f4;
				margin: 0;
				padding: 20px;
				display: flex;
			}

			.container {
				min-width: 290px;
				max-width: 290px;
				background-color: white;
				padding: 30px;
				margin: 0 auto;
				border: 2px solid limegreen;
				border-radius: 10px;
				box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
				text-align: center;
			}

			form input[type="password"] {
				padding: 8px;
				border: 1px solid #ccc;
				border-radius: 5px;
				font-size: 14px;
				margin-right: 10px;
			}

			form input[type="submit"] {
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

			form input[type="submit"]:hover {
				background-color: #45a049;
			}

			p {
				margin-bottom: 0px;
				margin-top: 10px;
				color: red;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<form>
				<h3>비밀번호 입력</h3>
				<input type="password" name="password" required>
				<input type="submit" value="확인">
				<p><strong>${ message }</strong></p>
			</form>
		</div>
	</body>
	<script>
		let form = document.querySelector("form");
		form.addEventListener("submit",(e)=>{
			e.preventDefault();
			let result=confirm("삭제 시 복구가 불가능합니다.\n삭제하시겠습니까?");
			if(result){
				submit();	
			}
		})
	</script>

	</html>