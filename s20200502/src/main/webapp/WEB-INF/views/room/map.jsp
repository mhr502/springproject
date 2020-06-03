<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=9pb7eu6jme"></script>
</head>
<body>
<!-- api ID:9pb7eu6jme -->
<div id="map" style="width:100%;height:400px;"></div>

<script>
var mapDiv =document.getElementById('map');

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.498178, 127.023922),
    zoom: 15
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.498178, 127.023922),
    map: map
});
</script>
</body>
</html>