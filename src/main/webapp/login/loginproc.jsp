<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");

//db접속
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);

String sql="select id,pwd from nmember where id=?";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs=pstmt.executeQuery();
//rs.next();
//System.out.println("id : "+rs.getString("id")+":: pwd : "+rs.getString(2));

//아이디 비번 일치판정
String ypass="";
int x=-1;
String msg="";

if(rs.next()){ //rs.next()가 true라면 칼럼에 존재, 즉 아이디가 존재한다는 의미
	ypass=rs.getString("pwd");
	if(ypass.equals(password)) //패스일치
		x=1;
	else //패스불일치
		x=0;
}else{ //아이디가 존재하지 않으면
	System.out.println("아이디 없음");
	x=-1;
}
System.out.println("x value : "+x);

//x값으로 전송위치를 결정
if(x==1){
	//로그인 성공하면 세션에 저장 후 MainForm.jsp로 이동
	session.setAttribute("sessionID", id); //sessionID라는 이름으로 id를 보관
	msg="../index.jsp";
}else if(x==0){
	msg="loginForm.jsp?msg=0";
}else{ //x가 -1인 상태
	msg="loginForm.jsp?msg=-1";
}
response.sendRedirect(msg);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>loginproc.jsp</h3>
</body>
</html>