<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>noticeRegPro.jsp</h3>
<%
/* String title=request.getParameter("title");
String content=request.getParameter("content");

Notice n=new Notice();
n.setTitle(title);
n.setContent(content);

NoticeDao dao=new NoticeDao();
int cnt=dao.insert(n);
*/

/* if(cnt>0){
	response.sendRedirect("notice.jsp");
} */

%>



<!-- pstmt 사용
insert 완성되면
notice.jsp로 돌아가도록 -->

</body>
</html>