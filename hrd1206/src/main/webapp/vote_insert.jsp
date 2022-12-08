<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
   function check(){
	   var name=/^[가-힣]+$/;
	   var V_NAME=document.form.V_NAME.value;
	   if(document.form.V_JUMIN.value==""){
			alert("주민번호가 입력 되지 않았습니다.`");
			document.form.V_JUMIN.focus();
		}else if(document.form.V_JUMIN.value.length<13||document.form.V_JUMIN.value.length>13){
			alert("주민번호는 숫자 13자리 입니다.");
			document.form.V_JUMIN.focus();
		}else if(document.form.V_NAME.value==""){
			alert("성명이 입력 되지 않았습니다.");
			document.form.V_NAME.focus();
		}else if(!name.test(V_NAME)){
			alert("한글로 성명을 입력해주세요");
			document.form.V_NAME.focus();
		}else if(document.form.M_NO.value==""){
			alert("후보번호가 선택 되지 않았습니다.");
			document.form.M_NO.focus();
		}else if(document.form.V_TIME.value==""){
			alert("투표시간이 입력 되지 않았습니다.");
			document.form.V_TIME.focus();
		}else if(document.form.V_AREA.value==""){
			alert("투표장소가 입력되지 않았습니다. ");
			document.form.V_AREA.focus();
		}else if(document.form.V_CONFIRM.value==""){
			alert("유권자 확인이 선택 되지 않았습니다.");
			document.form.V_CONFIRM.focus();
		}else{
			alert("투표가 완료 되었습니다.");
			document.form.submit();
		}
   }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
  <h3>투표하기</h3>
  <form name="form" method="post" action="vote_insertProcess.jsp">
    <table class="insert_table">
      <tr>
        <th>주민번호</th>
        <td><input type="text" name="V_JUMIN"></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="V_NAME"></td>
      </tr>
      <tr>
        <th>투표번호</th>
        <td>
          <select name="M_NO">
            <option selected hidden="" disabled>후보</option>
            <option value="1">1 김후보</option>
            <option value="2">2 이후보</option>
            <option value="3">3 박후보</option>
            <option value="4">4 조후보</option>
            <option value="5">5 최교수</option>                          
          </select>
        </td>
      </tr>
      <tr>
        <th>투표시간</th>
        <td><input type="text" name="V_TIME" placeholder="예)0930"></td>
      </tr>
      <tr>
        <th>투표장소</th>
        <td><input type="text" name="V_AREA" placeholder="예)제1투표장"></td>
      </tr>      
      <tr>
        <th>유권자 확인</th>
        <td>
          <input type="radio" name="V_CONFIRM" value="Y"/>확인
          <input type="radio" name="V_CONFIRM" value="N">미확인
        </td>
      </tr> 
      <tr>
        <td colspan=2 class="last">
          <input class="buttons" type="button" value="투표하기" onclick="check()">
          <input class="buttons" type="reset" value="취소">
        </td>
      </tr>   
      
    </table>
  </form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>