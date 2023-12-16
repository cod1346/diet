<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<meta charset="UTF-8">
	    <title>달 력</title>
	    <style>
	        td {
	            width: 50px;
	            height: 50px;
	        }
	
	        .Calendar { 
	            text-align: center;
	            margin: 0 auto; 
	        }
	
	        .Calendar>thead>tr:first-child>td { font-weight: bold; }
	
	        .Calendar>thead>tr:last-child>td {
	            background-color: gray;
	            color: white;
	        }        
	
	        .pastDay{ background-color: lightgray; }
	
	        .today{            
	            background-color: #FFCA64;            
	            cursor: pointer;
	        }
	
	        .otherDay{            
	            background-color: #FFFFFF;
	            cursor: pointer;
	        }
	
	        .otherDay.choiceDay, .today.choiceDay{            
	            background-color: #3E85EF;            
	            color: #fff;
	            cursor: pointer;
	        }
	    </style>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	    <script>
	        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행
	
	        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	        let today = new Date();     // 페이지를 로드한 날짜를 저장
	        today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화
	
	        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	        function buildCalendar() {
	
	            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
	            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
	
	            let tbody_Calendar = document.querySelector(".Calendar > tbody");
	            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
	            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
	
	            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
	                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
	            }
	
	            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           
	
	            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
	                let nowColumn = nowRow.insertCell();        // 열 추가
	            }
	
	            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
	
	                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
	                nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력
	
	            
	                if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
	                    nowColumn.style.color = "#DC143C";
	                }
	                if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
	                    nowColumn.style.color = "#0000CD";
	                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
	                }
	
	
	               /*  if (nowDay < today) {                       // 지난날인 경우
	                    nowColumn.className = "pastDay";
	                } */
	                if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
	                    nowColumn.className = "day today";
	                }
	                else {                                      // 미래인 경우
	                    nowColumn.className = "day otherDay";
	                }
	            }
	            ////////////////////////////////////////////////////////////////////////
	            const days = document.querySelectorAll('.day');
				
	            
	            days.forEach(e => {
	                e.addEventListener('click', ()=>{
	                	var clickYear=document.querySelector("#calYear").innerHTML
	                    var clickMonth=document.querySelector("#calMonth").innerHTML
	                    var clickDay =e.innerHTML.substring(0, 2);
	                    document.querySelector("#exampleModalLabel").innerHTML=clickYear+"년"+clickMonth+"월"+clickDay+"일"
	                	document.querySelector("#modalBtn").click()
	                });
	            });
				////////////////////////////////////////////////////////////////////////
				getDaysKcal()
	        }
	
	        
	        // 이전달 버튼 클릭
	        function prevCalendar() {
	            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	            buildCalendar();    // 달력 다시 생성
	        }
	        // 다음달 버튼 클릭
	        function nextCalendar() {
	            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
	            buildCalendar();    // 달력 다시 생성
	        }
	
	        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	        function leftPad(value) {
	            if (value < 10) {
	                value = "0" + value;
	                return value;
	            }
	            return value;
	        }
	        function getDaysKcal(){
	        	console.log("-----------")
	        	const month = document.querySelector("#calYear").innerHTML+document.querySelector("#calMonth").innerHTML
	        	const lastDay = new Date(document.querySelector("#calYear").innerHTML, document.querySelector("#calMonth").innerHTML, 0).getDate();
	        	console.log(lastDay)


	        	fetch("/getMonthCal?month="+month+"&lastDay="+lastDay+"&userCode="+document.querySelector("#userCode").value)
	        	.then(response=>{
	        		if(!response.ok){
	        			console.log("오류발생")
	        		}else{
	        			return response.json()
	        		}
	        	})
	        	.then(data=>{
			    	document.querySelectorAll(".day").forEach(e => {
			    		
			    		let kcalFound=false
			    		let daykcal = 0
			    		data.forEach(item=>{
				    		var day = item.eatDate.substring(6);
			    			if(day==e.innerHTML.substring(0, 2)){
			    				daykcal+=item.kcal
			    				kcalFound=true
			    			}
			    		})
			    		if(kcalFound){
		    				e.innerHTML =e.innerHTML.substring(0, 2)+ "<br><small style='color: gray'>"+daykcal+"kcal</small>";
			    		}else{
		    				e.innerHTML =e.innerHTML.substring(0, 2)+ "<br><small style='color: gray'>0kcal</small>";
			    		}
		        	});
	        	})
	        	
	        	console.log("-----------")
	        }
	       
	    </script>
	</head>
	
	<body>
		<div>
	        <span>
	        성별 : ${dto.gender == 'man' ? '남자' : '여자'}, 
	        키 : ${dto.height}cm, 
	        몸무게 : ${dto.weight}kg,  
	        표준체중 : <span id="aveWeight"></span>kg,  
	        하루필요열량 : <span id="dayKcal"></span>kcal
	        </span>
		</div>
		<input hidden="" value="${dto.height }" id="height">
		<input hidden="" value="${dto.weight }" id="weight">
		<input hidden="" value="${dto.gender }" id="gender">
		<input hidden="" value="${dto.userCode}" id="userCode"> 
		
	    <table class="Calendar">
	        <thead>
	            <tr>
	                <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
	                <td colspan="5">
	                    <span id="calYear"></span>년
	                    <span id="calMonth"></span>월(${dto.username })
	                </td>
	                <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
	            </tr>
	            <tr>
	                <td>일</td>
	                <td>월</td>
	                <td>화</td>
	                <td>수</td>
	                <td>목</td>
	                <td>금</td>
	                <td>토</td>
	            </tr>
	        </thead>
	
	        <tbody>
	        </tbody>
	    </table>
	    
	    <!-- 모달 -->
	    <!-- Button trigger modal -->
		<button type="button" hidden="" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  Launch d em o modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<select class="eatType">
		      		<option>구분
		      		<option>아침
		      		<option>점심
		      		<option>저녁
		      		<option>아침간식
		      		<option>점심간식
		      		<option>저녁간식
		      	</select>
		      	<div>
					<select class="foodType">
						<option>종류
						<option>직접입력
						<option>밥
						<option>과일
						<option>구이
						<option>국
						<option>김치
						<option>나물
						<option>다과류
						<option>라면
						<option>볶음
						<option>빵
						<option>음료
						<option>전
						<option>조림
						<option>찜
						<option>튀김
					</select>
				</div>
				<input hidden="" id="writeFoodName" placeholder="음식명">
				<input hidden="" id="writeFoodKcal" placeholder="칼로리" type="number">
				
			   	<select id="밥" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '밥'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="과일" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '과일'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="구이" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '구이'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="국" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '국'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="김치" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '김치'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="나물" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '나물'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="다과류" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '다과류'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="라면" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '라면'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="볶음" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '볶음'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="빵" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '빵'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="음료" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '음료'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="전" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '전'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="조림" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '조림'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="찜" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '찜'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
			   	<select id="튀김" hidden="">
					<c:forEach var="food" items="${list}">
	 					<c:if test="${food.type == '튀김'}">
					    	<option value="${food.foodName }-${food.kcal}">${food.foodName}, ${food.kcal}kcal 
					    </c:if>
			    	</c:forEach>
		       	</select>
		        <button hidden="" id="saveBtn" type="button">입력</button>
		        <button hidden="" id="saveBtn1" type="button">입력</button>
		        <div>
		        	<small id="small"></small>
		        </div>
		      	<div>현재 섭취 칼로리 : <span id="nowKcal">0</span>kcal</div>
		      	<div>일일 권장 칼로리 : <span id="dayKcal1"></span></div>
		      </div>
		    </div>
		  </div>
		</div>
	<a href="/">홈으로</a>	    
	</body>
	<script>
	const height = document.querySelector("#height").value
	const weight = document.querySelector("#weight").value
	const gender = document.querySelector("#gender").value
	var aveWeight = ''

	if(gender=='man'){
	    aveWeight = height*height*22/10000
	}else{
	    aveWeight = height*height*21/10000
	}
	var dayKcal = Math.round(aveWeight*30)
	document.querySelector("#aveWeight").innerHTML=aveWeight
	document.querySelector("#dayKcal").innerHTML=dayKcal
	document.querySelector("#dayKcal1").innerHTML=dayKcal+'kcal'
	
	var type1='';
	
	function hideAllOptions(type) {
	    var allSelects = document.querySelectorAll('select[id]');
	    allSelects.forEach((select)=>{
	        select.setAttribute('hidden', "");
	    });
    	document.querySelector('#saveBtn').removeAttribute("hidden")
    	document.querySelector('#saveBtn1').setAttribute("hidden",'')
	    if(type=="종류"){
	    	
	    	document.querySelector('#saveBtn').setAttribute("hidden","")
	    	document.querySelector('#writeFoodKcal').setAttribute("hidden","")
	    	document.querySelector('#writeFoodName').setAttribute("hidden","")
	    }else if(type=='직접입력'){
    		document.querySelector('#saveBtn1').removeAttribute("hidden")
    		document.querySelector('#saveBtn').setAttribute("hidden",'')
	    	document.querySelector('#writeFoodKcal').value=""
	    	document.querySelector('#writeFoodName').value=""
	    	document.querySelector('#writeFoodKcal').removeAttribute("hidden")
	    	document.querySelector('#writeFoodName').removeAttribute("hidden")
	    }else{
	    	document.getElementById(type).removeAttribute("hidden")
	    	document.querySelector('#writeFoodKcal').setAttribute("hidden","")
	    	document.querySelector('#writeFoodName').setAttribute("hidden","")
	    }
    	type1=type
	}
	
	var selectElement = document.querySelector('.foodType');
    selectElement.addEventListener('change', (e)=>{
        var selectedValue = e.target.value;
        console.log('선택된 값:', selectedValue);
	    hideAllOptions(selectedValue)
    });
    
    document.querySelector('#saveBtn').addEventListener('click', (e)=>{
		console.log(document.getElementById(type1).value)
		var value = document.getElementById(type1).value;
		var splitValues = value.split('-');
		var foodName = splitValues[0]; // 음식명
		var kcal = splitValues[1]; // 칼로리
		
		const data = {
		        userCode: document.querySelector("#userCode").value,
		        eatType: document.querySelector(".eatType").value,
		        foodName: foodName,
		        kcal: kcal,
		        eatDate: document.querySelector("#exampleModalLabel").innerHTML
		    };
			
		console.log(data)
	
		console.log('음식명:', foodName);
		console.log('칼로리:', kcal);

		if(document.querySelector(".eatType").value=='구분'){
			alert("섭취타입을 선택해주세요")
		}else{
			fetch("/addEat", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify(data) 
		    })
		    .then(response => {
		        if (!response.ok) {
		            alert("오류발생")
		        }else{
			    	var nowKcal = parseInt(document.querySelector("#nowKcal").innerHTML);
	
			        nowKcal += parseInt(data.kcal); 
			        document.querySelector("#nowKcal").innerHTML=nowKcal;
			        document.querySelector("#small").innerHTML+='<br>'+data.eatType+", 음식명 : "+data.foodName+", 칼로리 : "+data.kcal+"kcal"
					getDaysKcal()
		        }
		    })
		        
		}
		
    });
    document.querySelector('#saveBtn1').addEventListener('click', (e)=>{
		console.log(document.getElementById("writeFoodName").value)
		console.log(document.getElementById("writeFoodKcal").value)
		
		const data = {
		        userCode: document.querySelector("#userCode").value,
		        eatType: document.querySelector(".eatType").value,
		        foodName: document.getElementById("writeFoodName").value,
		        kcal: document.getElementById("writeFoodKcal").value,
		        eatDate: document.querySelector("#exampleModalLabel").innerHTML
		    };
		console.log(data)
	    
		if(document.querySelector(".eatType").value=='구분'){
			alert("섭취타입을 선택해주세요")
		}else{
			fetch("/addEat", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify(data) 
		    })
		    .then(response => {
		        if (!response.ok) {
		            alert("오류발생")
		        }else{
			    	var nowKcal = parseInt(document.querySelector("#nowKcal").innerHTML);
	
			        nowKcal += parseInt(data.kcal); 
			        document.querySelector("#nowKcal").innerHTML=nowKcal;
			        document.querySelector("#small").innerHTML+='<br>'+data.eatType+", 음식명 : "+data.foodName+", 칼로리 : "+data.kcal+"kcal"
			        getDaysKcal()
		        }
		    })
		        
		}
    });
    document.querySelector('#modalBtn').addEventListener('click', (e)=>{
    	document.querySelector('#writeFoodKcal').value=""
	    document.querySelector('#writeFoodName').value=""
	    document.querySelector(".eatType").value="구분"
	    document.querySelector('.foodType').value="종류"
	    hideAllOptions('종류')
    	console.log(document.querySelector("#exampleModalLabel").innerHTML)
        fetch("/readEatDate?eatDate="+document.querySelector("#exampleModalLabel").innerHTML+"&userCode="+document.querySelector("#userCode").value)
        .then(response=>{
        	if(response.ok){
                return response.json()
            }
        })
        .then(data=>{
            console.log(data)
            const small = document.querySelector('#small');
            small.innerHTML = ''; // 기존 내용 비우기
			var nowKcal=0
            data.forEach(item => {
            	nowKcal+=item.kcal
                small.innerHTML += '<br>'+item.eatType+', 음식명: '+item.foodName+',  칼로리: '+item.kcal+'kcal';
            });
            document.querySelector("#nowKcal").innerHTML=nowKcal
        })
    })
</script>
</html>