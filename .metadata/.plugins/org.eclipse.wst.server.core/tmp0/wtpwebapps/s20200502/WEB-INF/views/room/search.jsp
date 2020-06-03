<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title> 기초 : 그냥 지도만 생성해 보기</title>
</head>
<body>
<header>
<p>${room.ro_title}</p>
<div id="map" width:1000px; margin-top:40px; height:500px;"></div>
</body>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9pb7eu6jme"></script>
<style type="text/css">

#map {
	height:830px;
	width:1820px;
	
}
.c{
	position:relative;
	bottom:30px;
	left:500px;
}
</style>

<script type="text/javascript">
var mapDiv =document.getElementById('map');

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.498178, 127.023922),
    zoom: 15
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.498178, 127.023922),
    map: map
});	
var $window = $(window);

function getMapSize() {
    var size = new naver.maps.Size($window.width() - 15, $window.height() - 15);

    return size;
};

$window.on('resize', function() {
    map.setSize(getMapSize());
});
</script>


</html>