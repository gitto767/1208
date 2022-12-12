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
<%@ include file="dbconn.jsp" %>
   <h3>후보자 등수</h3>
  
  <table class="select_table">
    <tr>
      <th>후보 번호</th>
      <th>성명</th>
      <th>총 투표수</th>
    </tr>
    <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    try{
    	String sql="select m.m_no,m.m_name,count(*) as v_total from member1206 m,vote1206 v where m.m_no=v.m_no and v.v_confirm='Y' group by m.m_no,m.m_name order by v_total desc";
    	pstmt=conn.prepareStatement(sql);
      	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String m_no=rs.getString(1);
    		String m_name=rs.getString(2);
    		String total=rs.getString(3);
    		
   	%>
    
    <tr>
      <td><%=m_no %></td>
      <td><%=m_name %></td>
      <td><%=total %></td>  
    </tr>
    
<%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>  
  </table>
  <div class="btn">
    <button type="button" onclick="location.href='vote_insert.jsp'">작성</button>
  </div>
 

</section>

<%@ include file="footer.jsp" %>
</body>
</html>