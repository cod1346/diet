<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/register">
		<div><input name="username" placeholder="이름"></div>
		<div><input name="height" type="number" placeholder="키"></div>
		<div><input name="weight" type="number" placeholder="몸무게"></div>
		<div>
			<select name="gender">
				<option selected="selected">성별
				<option value="man">남
				<option value="woman">여
			</select>
		</div>
		<button id="getCodeBtn" type="button">접속코드 받기</button>
		<input hidden="" id="userCode" name="userCode" readonly="readonly">
		<button hidden="" id="registerBtn" type="submit">등록</button>
	</form>
</body>
<script>
document.querySelector("#getCodeBtn").addEventListener("click",()=>{
    fetch("/getCode")
    .then(response=>{
        return response.text()
    })
    .then(data=>{
    	console.log(data)
    	alert("접속코드는 "+data+"입니다. 꼭 외워주세요.")
    	document.querySelector("#registerBtn").removeAttribute("hidden")
    	document.querySelector("#userCode").value=data
    	document.querySelector("#userCode").removeAttribute("hidden")
        document.querySelector("#getCodeBtn").setAttribute("hidden","")
    })
})
</script>
</html>