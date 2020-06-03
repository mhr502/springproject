<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="room" items="${list }">
			<tr>
				<td>${room.ro_num}</td>
				<td><a href="detail.do?empno=${room.ro_num }">${room.ro_title }</a></td>
				<td>${room.ro_img}</td>
			</tr>
		</c:forEach>

</body>
</html>