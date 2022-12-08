<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function changesubmit(){
	  form.submit();
  }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%
   String area=request.getParameter("area");
   if(area==null){
	   area="1";
   }
   String area_name="";
   if (area.equals("1")){
	   area_name="제1투표장";
   }else{
	   area_name="제2투표장";
   }
	   
%>

<section>
<%@ include file="dbconn.jsp" %>
  <form name="form" method=post action="vote_select.jsp">
    <fieldset id="fd">
      <legend>선택</legend>
      투표소 : <input type="radio" name="area" value="1" onchange="changesubmit()" <%if(area.equals("1")){%>checked<%} %>>제1투표장
             <input type="radio" name="area" value="2" onchange="changesubmit()" <%if(area.equals("2")){%>checked<%} %>>제2투표장
    </fieldset>
  </form>

  <h3>투표 검수 조회</h3>
  <% 
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  int cnt;
  try{
  	String sql="select count(*) from vote1206 where V_AREA='"+area_name+"'";
  	pstmt=conn.prepareStatement(sql);
  	rs=pstmt.executeQuery();
  	if(rs.next()){
  		cnt=rs.getInt(1);
  		%>
  		
  <p id="t1">총 <%=cnt %>명의 투표 검수 조회가 있습니다.</p>
  <%
  	}
  }catch(Exception e){
	  e.printStackTrace();
  }
  	%>
  <table class="select_table">
    <tr>
      <th>성명</th>
      <th>생년월일</th>
      <th>나이</th>
      <th>성별</th>
      <th>후보 번호</th>
      <th>투표 시간</th>
      <th>유권자 확인</th>
      <th>구분</th>        
    </tr>
    <%
   
    try{
    	String sql="select V_NAME, to_char(to_date(substr(V_JUMIN,1,6)),'yy.mm.dd'), substr(V_JUMIN,7,1), to_char(sysdate,'yyyy'), decode(substr(V_JUMIN,7,1),'1','남','2','여','3','남','4','여') v_gender, M_NO, substr(V_TIME,1,2)||':'||substr(V_TIME,3,2) v_time, decode(V_CONFIRM,'Y','확인','N','미확인'),V_JUMIN from vote1206 where V_AREA='"+area_name+"'";
    	pstmt=conn.prepareStatement(sql);
      	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String name=rs.getString("V_NAME");
    		String birth=rs.getString(2);
    		
    		String byy=birth.substring(0,2);
    		String age=rs.getString(3);
    		String gender="";
    		if(age.equals("1")||age.equals("3")){
    			gender="남";
    		}else{
    			gender="여";
    		}
    		String p_year=rs.getString(4);
    		String b_year="";
    		if(age.equals("1")||age.equals("2")){
    			b_year="19"+byy;
    		}else{
    			b_year="20"+byy;
    		}
    		int age1=Integer.parseInt(p_year)-Integer.parseInt(b_year);
    		age="만"+age1+"세";
    		String gender1=rs.getString("v_gender");
    		String m_no=rs.getString("M_NO");
    		String v_time=rs.getString("v_time");
    		String v_confirm=rs.getString(8);
    		String V_JUMIN=rs.getString(9);
   	%>
    
    <tr>
      <td><%=name %></td>
      <td><%=birth %></td>
      <td><%=age %></td>
      <td><%=gender %></td>
      <td><%=m_no %></td>
      <td><%=v_time %></td>
      <td><%=v_confirm %></td>
      <td><a href="vote_update.jsp?V_JUMIN=<%=V_JUMIN %>">수정</a>/
          <a href="vote_delete.jsp?V_JUMIN=<%=V_JUMIN %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
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