<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   Connection conn=null;
   
   try{
	   String url="jdbc:oracle:thin:@//localhost:1521/xe";
	   String user="system";
	   String pass="1234";
	   Class.forName("oracle.jdbc.OracleDriver");
	   conn=DriverManager.getConnection(url,user,pass);
	   System.out.println("데이터베이스 연결 성공");	   
   }catch(Exception e){
	System.out.println("데이터베이스 연결 실패");
   	e.printStackTrace();
   }
		
   
%>
</body>
</html>