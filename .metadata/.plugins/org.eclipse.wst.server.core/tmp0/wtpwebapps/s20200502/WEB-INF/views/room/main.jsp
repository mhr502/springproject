<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script language="javascript">
  function showPopup() { window.open("plus.do", "a", "width=500, height=300, left=100, top=50"); }
  </script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-11">
				<p class="loc">
					지역선택 <input type="button" value="지역" onclick="showPopup();" />
				</p>
				<p class="date">
					날짜선택 <input type="date">
			</div>

		</div>
		<div class="row">
			<div class="col-xs-12">부분2</div>
			<form action="search.do" method="post">
				<input class="map" type="submit" value="지도">
			</form>
		</div>
		<div class="row">
			<div class="col-xs-13">부분3</div>

		</div>
	</div>


</body>
</html>
