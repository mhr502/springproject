<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<br>
	<br>
	<br>
	<br>
	<div class="jumbotron" style="min-width:100%;">
	<div class="row">
	<c:forEach items="${list }" var="room">
		<div class="col-sm-6 col-md-3  ">
			<div class="thumbnail">
				<a href="roomContent.do?ro_num=${room.ro_num }" class="thumbnail">
					<img src="${pageContext.request.contextPath}/upload/${room.ro_img}"
					width="100px" height="100px" alt="...">
				</a>
				<p>${room.ro_title }</p>
			</div>
		</div>
	</c:forEach>

	</div>
</div>
</div>
	<div class="container">
	<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			</div>
	<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
	<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
	<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
</div>

</body>
</html>