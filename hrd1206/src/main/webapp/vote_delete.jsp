<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
  PreparedStatement pstmt=null;
  String V_JUMIN=request.getParameter("V_JUMIN");
  try{
	  String sql="delete from vote1206 where V_JUMIN=?";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, V_JUMIN);
	  pstmt.executeUpdate();
	  %>
	  <script>
	     alert("삭제 성공");
	     location.href="vote_select.jsp";
	  </script>
	  <%
	  
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
</body>
</html>