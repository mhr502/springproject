<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9pb7eu6jme"></script>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">


<style>
/* Make the image fully responsive */
.carousel-inner>.carousel-item>img { /* width: 640px; height: 720px; */
	
}
</style>

<!-- <script>
	$(function() {
		$("#pw1, #pw2").keyup(function() {
			var pw1Value = $("#pw1").val();
			var pw2Value = $("#pw2").val();

			if (pw1Value != pw2Value) {
				$("#message").text("패스워드가 일치하지 않습니다.");
			} else {
				$("#message").text("패스워드가 일치합니다.");
			}
		})
	});
</script> -->
<title>관리자 사이트</title>
</head>
<body>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div style="width: 300px; margin: 100px;">
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<div class="carousel-item active">
					<c:forEach items="#{roomImg }" var="img">
						<c:if test="${img.i_seq == 1}">
							<img
								src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
								alt="Place" width="500px" height="300px">
						</c:if>
					</c:forEach>
				</div>
				<div class="carousel-item ">
					<c:forEach items="#{roomImg }" var="img">
						<c:if test="${img.i_seq == 2}">
							<img
								src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
								alt="Place" width="500px" height="300px">
						</c:if>
					</c:forEach>
				</div>
				<div class="carousel-item">
					<c:forEach items="#{roomImg }" var="img">
						<c:if test="${img.i_seq == 3}">
							<img
								src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
								alt="Place" width="500px" height="300px">
						</c:if>
					</c:forEach>
				</div>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
			</div>
			</a>
		</div>


	</div>
	방번호 : ${room.ro_num }
	<br> 멤버번호 : ${room.m_num }
	<br> 방제목 : ${room.ro_title }
	<br> 방내용 : ${room.ro_content }
	<br> 조회수 : ${room.ro_hit }
	<br> 오전가 : ${room.ro_mReservation }
	<br> 오후가 : ${room.ro_aftReservation }
	<br> 밤가 : ${room.ro_nitReservation }
	<br>
 		<c:forEach items="#{roomImg }" var="img">
			<img src="${pageContext.request.contextPath }/upload/${img.i_contentImg }"
			alt="img" width=150px; height=150px;>
		</c:forEach>
	<div id="map" style="width: 200px; height: 200px;"></div>

</body>
<script type="text/javascript">
var mapDiv = document.getElementById('map');

var map = new naver.maps.Map('map', {center : new naver.maps.LatLng(${room.ro_spot1},${room.ro_spot2}),zoom : 17,minZoom : 7,
	
	zoomControl: true, //컨트롤 표시 여부
	zoomControlOptions: {
		position: naver.maps.Position.TOP_RIGHT 
		}
	});


var marker = new naver.maps.Marker({position : new naver.maps.LatLng(${room.ro_spot1},${room.ro_spot2}),map : map});
var $window = $(window);

function getMapSize() {
	var size = new naver.maps.Size($window.width() - 15,
				$window.height() - 15);

		return size;
};

$window.on('resize', function() {
		map.setSize(getMapSize());
});

//실시간 예약 BootStrap modal Show
$(document).on('click', '.roomReserveListModal', function() {
	var roomNo = $(this).attr('value');
	$('#roomReserveNo').val(roomNo);
	$('#ddayYear').val(0);
	$('#ddayMonth').val(0);
	var ddayOption = 'default';
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption);
	$("#roomReserveListModal").modal('show');
});
//달력 month 변경
$(document).on('click', '.calendarMoveBtn', function() {
	var roomNo = $('#roomReserveNo').val();
	var ddayOption = $(this).attr('ddayOption');
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption);
});
//달력 load function
function reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption){
	$.ajax({
		url : "calendar",
		type : "POST",
		data : {roomNo, ddayYear:ddayYear, ddayMonth:ddayMonth, ddayOption:ddayOption},
		dataType : "json",
		success : function(data) {
			var html ="";
			var calendarTitle = data.ddayYear+"년 "+(data.ddayMonth+1)+"월";
			$("#calendarTitle").html(calendarTitle);
			var calendarList = data.calendarList;
			html = calenderAppend(calendarList);
			$('#calendarListTbody').html(html);
			$('#ddayYear').val(data.ddayYear);
			$('#ddayMonth').val(data.ddayMonth);
		}
	})
}
//달력 html
function calenderAppend(calendarList){
	var html = "";
	var roomNo = $('#roomReserveNo').val();
	var notThisMonthColor="#BDBDBD";
	var sundayColor="#FF0000";
	var weekdayColor="#000000";
	var saturdayColor="#0000FF";
	$.each(calendarList,function(key, item) {
        if(key%7==0){
			 html+= "<tr class='fc-week'>";
		}
		html+= "<td class='fc-day fc-widget-content'>";
		html+= "<div style='min-height: 80px;'>";
		html+= "<div class='fc-day-number' style='color:"
		//해당일수가 현재월에 포함되지않으면 색깔변경
        if(item.day > (key+1) || (key-item.day) > 27){
			html+=notThisMonthColor;
		}else{
            //요일에따른 색깔변경
			if(key%7==0){
				html+= sundayColor;
			}else if((key%7)>0 && (key%7)<6){
				html+= weekdayColor;
			}else if(key%7==6){
				html+= saturdayColor;
			}
		}
		html+=";font-weight:bold;'>"+item.day;
		html+="</div>";
		html+= "<div class='fc-day-content'>";
        //일수가 index+1보다 작거나같고 두 수의 차이가 27일보다 작으면..
		if(item.day <=(key+1) && (key-item.day)<27){
			if(item.reserveVo != null){
				html+="<h5 style='color:#FF0000;'>예약중</h5>";
			}else{
                //예약중이면 예약정보를 보여준다
				html+="<button type='button' class='btn btn-default'>예약</button>";
			}
		}
		html+= "<div style='position: relative; height: 25px;'></div>";
		html+= "</div>";
		html+= "</div>";
		html+= "</td>";
		if(key%7==6){
			 html+= "</tr>";
		}
	});
	return html;
}
</script>
</html>




