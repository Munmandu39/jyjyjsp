<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String g_num=request.getParameter("asd");
if(g_num==null){
	g_num="1";
}


String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//여기까지 접속성공상태


String sql="select * from goodsinfo where gnum=?";

//실행
//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
//ResultSet rs=st.executeQuery(sql);
pstmt.setString(1, g_num);
ResultSet rs=pstmt.executeQuery();
rs.next();
System.out.println("value : "+rs.getString("gname"));
%>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>goodsBoardDetail.jsp</h3>

<table class="twidth" border="1">

	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="5%" />
		<col width="35%" />
	</colgroup>
	<caption>상품상세정보</caption>
	<tbody>
		<tr>
			<th class="left">상품번호</th>
			<td><%=rs.getInt("gnum") %></td>
			<th class="left">상품가격</th>
			<td><%=rs.getInt("gprice") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td>관리자</td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("gdate") %></td>
		</tr>
		<tr>
			<th class="left">상품명</th>
			<td colspan="3"><%=rs.getString("gname") %></td>
		</tr>
		<tr>
			<th class="left">입력사항</th>
			<td colspan="3" id="txtgdescribe"><%=rs.getString("gdescribe") %></td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">첨부</td>
		</tr>
	
	</tbody>
</table>
<a href="goodsboard.jsp">목록</a>

</body>
</html>
<%
rs.close();
pstmt.close();
conn.close();
%>