<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>jstl7_choose</h3>

<%
int ranNum=(int)(Math.random()*10); //Math.random이 long타입이므로 int에 담기 위해 강제형변환 해줘야함
String grade="a"+ranNum;
out.println("grade : "+grade+"<br>");

%>
<c:set value="<%=grade %>" var="grade" />
<c:choose>
	<c:when test="${grade=='a1' }">
		당신의 등급은 : A1
	</c:when>
	<c:when test="${grade=='a2' }">
		당신의 등급은 : A2
	</c:when>
	<c:when test="${grade=='a3' }">
		당신의 등급은 : A3
	</c:when>
	<c:otherwise>
		당신의 등급은 기타등급입니다.
	</c:otherwise>
</c:choose>
</body>
</html>