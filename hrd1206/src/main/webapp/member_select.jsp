<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
  <h3>후보자 조회</h3>

  <table class="select_table">
    <tr>
      <th>후보번호</th>
      <th>성명</th>
      <th>소속정당</th>
      <th>학력</th>
      <th>주민번호</th>
      <th>지역구</th>
      <th>대표전화</th>
      <th>구분</th>
    </tr>
    
    <%@ include file="dbconn.jsp" %>
    <%
       PreparedStatement pstmt=null;
       ResultSet rs=null;
       try{
    	   String sql="select A.M_NO,A.M_NAME,A.P_CODE,decode(A.P_SCHOOL,'1','고졸','2','학사','3','석사','4','박사'),A.M_JUMIN,A.M_CITY,B.P_TELL1,B.P_TELL2,B.P_TELL3 from member1206 A,PARTY1206 B WHERE A.P_CODE=B.P_CODE";
    	   pstmt=conn.prepareStatement(sql);
    	   rs=pstmt.executeQuery();
    	   while(rs.next()){
    		   String m_no=rs.getString(1);
    		   String m_name=rs.getString(2);
    		   String p_code=rs.getString(3);
    		   String p_school=rs.getString(4);
    		   String m_jumin=rs.getString(5);
    		   String m_city=rs.getString(6);
    		   String p_tell1=rs.getString(7);
    		   String p_tell2=rs.getString(8);
    		   String p_tell3=rs.getString(9);
    		   %>
    <tr>
      <td><%=m_no %></td>
      <td><%=m_name %></td>	
      <td><%=p_code %></td>
      <td><%=p_school %></td>
      <td><%=m_jumin %></td>
      <td><%=m_city %></td>
      <td><%=p_tell1 %>-<%=p_tell2 %>-<%=p_tell3 %></td>
      <td><a href="member_update.jsp?id=<%=m_no%>">수정</a>/<a href="member_delete.jsp?id=<%=m_no %>">삭제</a></td>	  
    </tr>
   <%
    		   
    	   }
       }catch(Exception e){
    	   e.printStackTrace();
    	   System.out.println("db오류");
       }
    %>
  </table>
  
</section>

<%@ include file="footer.jsp" %>
</body>
</html>