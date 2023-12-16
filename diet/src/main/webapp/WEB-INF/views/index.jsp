<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
  /* body 스타일 */
  body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }
 
  #calendar1 {
    max-width: 1100px;
    margin: 0 auto;
  }
</style>
</head>
<body>
  <div id='wrap'>
    <!-- calendar 태그 -->
    <div id='calendar-wrap'>
      <div id='calendar1'></div> 
    </div>
  </div>
  <div>d  d d</div>
<!--   <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2023-12-07">
	  <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
		  <div class="fc-daygrid-day-top">
		 	 <a class="fc-daygrid-day-number">7 일</a>
		  </div>
		  <div class="fc-daygrid-day-events">
		  	<div class="fc-daygrid-day-bottom" style="margin-top: 0px;">
		 	 </div>
		  </div>
		  <div class="fc-daygrid-day-bg">
		  </div>
	  </div>
  </td> -->
  <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar1')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        // 해더에 표시할 툴바
	        headerToolbar: {
		          left: 'prev,next today',
		          center: 'title',
		          right : "<a href='/'>홈으로<a>"
		        },
	        locale: 'ko' // 한국어 설정
        
      });
      // 캘린더 랜더링
      calendar.render();  
      
      //
      var day=document.querySelectorAll(".fc-daygrid-day")
      day.forEach((e) => {
    	  var innerDay = e.querySelector(".fc-daygrid-day-bottom");
		  var date = e.getAttribute('data-date');
		  innerDay.innerHTML = date;
    	  e.addEventListener('click', () => {
    		  var day = e.getAttribute('data-date');
    		    console.log('클릭한 날짜:', day);
    		    alert("클릭이벤트"+day)
    		  });
    		});
      //
		var chunks = document.querySelectorAll(".fc-toolbar-chunk");
		var thirdChunk = document.querySelectorAll(".fc-toolbar-chunk")[2]; // 3번째 요소 선택
		thirdChunk.innerHTML="<a href='/'>홈으로<a>"
		
		// 각 요소의 data-date 값을 가져와서 해당하는 하위 요소에 넣기
		/* day.forEach(function(dayElement) {
		  var innerDay = e.querySelector(".fc-daygrid-day-bottom");
		  var date = e.getAttribute('data-date');
		  innerDay.innerHTML = date;
		}); */
      //
    });
    console.log(document.querySelectorAll(".fc-button-primary")) 
    document.querySelectorAll(".fc-button").forEach((e) => {
  	  e.addEventListener('click', () => {
  		  console.log("버튼클릭")
  		  var day=document.querySelectorAll(".fc-daygrid-day")
  	      day.forEach((e) => {
  	    	  var innerDay = e.querySelector(".fc-daygrid-day-bottom");
  			  var date = e.getAttribute('data-date');
  			  innerDay.innerHTML = date;
  	    	  e.addEventListener('click', () => {
  	    		  var day = e.getAttribute('data-date');
  	    		    console.log('클릭한 날짜:', day);
  	    		    alert("클릭이벤트"+day)
  	    		  });
  	    		});
  	      //
  			  var chunks = document.querySelectorAll(".fc-toolbar-chunk");
  			  var thirdChunk = document.querySelectorAll(".fc-toolbar-chunk")[2]; // 3번째 요소 선택
  			console.log("이거는 "+thirdChunk)
  			thirdChunk.innerHTML="<a href='/'>홈으로<a>"
  	  })
    })
      
    })();
  
 </script>
 </body>
  </html>
