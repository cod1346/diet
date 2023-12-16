<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="form" method="post" action="/test">
		<input id="username" name = "username" placeholder="유저네임">
		<input id="userCode" name="userCode" placeholder="유저코드">
		<button id="loginBtn" type="submit">접속</button>
	</form>
	<a href="/register">유저등록</a>
	<!-- Button trigger modal -->
	
	<br>
	<br>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	  비만도 계산하기
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">비만도 계산</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div><input placeholder="체중" type="number" id="weight">kg</div>
	        <div><input placeholder="키" type="number" id="height">cm</div>
	        <div><button type="button" id="calcBtn">입력</button></div>
	        <div><input placeholder="" id="result"></div>
	        <div><span id = "yourRange"></span></div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
document.querySelector("#calcBtn").addEventListener("click", (e) => {
    var weight = document.querySelector("#weight").value;
    var height = document.querySelector("#height").value;
    var yourRange = document.querySelector("#yourRange");
    if (weight === "" || height === "") {
        alert("값을 입력해주세요.");
    } else {
        var bmi = parseInt(weight) / ((parseInt(height)*parseInt(height))/10000);
        document.querySelector("#result").value = bmi.toFixed(2);
        if (bmi < 18.5) {
            yourRange.innerHTML = "당신은 저체중 범위에 속합니다.";
        } else if (bmi >= 18.5 && bmi < 23) {
            yourRange.innerHTML = "당신은 정상 범위에 속합니다.";
        } else if (bmi >= 23 && bmi < 25) {
            yourRange.innerHTML = "당신은 과체중 범위에 속합니다.";
        } else if (bmi >= 25 && bmi < 30) {
            yourRange.innerHTML = "당신은 비만 범위에 속합니다.";
        } else {
            yourRange.innerHTML = "당신은 고도비만 범위에 속합니다.";
        }
    }
});

document.querySelector("#loginBtn").addEventListener("click",(e)=>{
    e.preventDefault()
    const data = {
        username: document.querySelector("#username").value,
        userCode: document.querySelector("#userCode").value
    };
    fetch("/checkUser", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data) 
    })
    .then(response => {
        if (!response.ok) {
            alert("아이디나 접속코드 확인")
        }else{
            document.querySelector("#form").submit()
        }
        
    })
})
</script>
</html>