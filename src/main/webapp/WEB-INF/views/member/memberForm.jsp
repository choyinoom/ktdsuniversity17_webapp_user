<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
<link rel="stylesheet" href="<c:url value='/resources/css/memberForm.css'/>">
</head>
<body>
	<section class="banner" id="memberform__banner">
				<h1>회원가입</h1>
	</section>
	<div class="memberform_container">
		<div class="memberform">
			<form id="addMemberForm" method="post" action="${contextPath}/member/addMember.do" name="addFrm">
				<table align="center">
					<tr>
						<td width="110"><p align="left">이름<span id="memberform_necessity">&nbsp;*</span></td>
						<td width="400">
						<input class="memberform_box" id="userName" type="text" name="name">
						</td>
					</tr>
					<tr>
						<td width="110"><p align="left">
								아이디<span id="memberform_necessity">&nbsp;*</span></td>
						<td width="400">
							<input class="memberform_box_id" minlength="4" maxlength="12" required id="userId" type="text" name="id" pattern="[0-9a-zA-z]+">
						<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button></td>
					</tr>
					<tr>
						<td width="110"><p align="left">비밀번호<span	id="memberform_necessity">&nbsp;*</span></td>
						<td width="400">
						<input id="pwd1" class="memberform_box" required type="password" name="pw" pattern="^(?=.*[0-9])(?=.*[a-zA-Z]).{8,16}$">
						<span style="color: #4D4D4D; margin-left: 35px; font-size: 12px;">8~16자리의 영문, 숫자를 조합하여 입력해주세요.</span></td>
					</tr>
					<tr style="margin-bottom: 20px;">
						<td class="pwd_check" width="110"><p align="left">비밀번호 확인<span id="memberform_necessity">&nbsp;*</span></td>
						<td class="pwd_check" width="400">
						<input class="memberform_box" id="pwd2" type="password">
						<span id="alert-success">비밀번호가 일치합니다.</span>
						<span id="alert-danger">비밀번호가 일치하지 않습니다.</span>
						</td>

					</tr>
					<tr>
						<td width="110"><p align="left">전화번호</td>
						<td width="400">
						<select name="tel1" id="userTel" style="" class="tel1">
								<option value="" selected="selected">선택</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
						</select>- 
						<input class="memberform_box_tel" type="tel" name="tel2" minlenth='3' maxlength='4' pattern="[0-9]+" >- 
						<input class="memberform_box_tel" type="tel" name="tel3" minlenth='3' maxlength='4' pattern="[0-9]+" >
						<input type="hidden" name="tel"></td>
					</tr>
					<tr>
						<td width="110">
						<p align="left">휴대폰<span id="memberform_necessity">&nbsp;*</span></td>
						<td width="400">
						<select name="phone1" id="userPhone" class="tel2">
								<option value="" selected="selected">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="018">018</option>
								<option value="017">017</option>
								<option value="019">019</option>
						</select>- 
						<input class="memberform_box_tel" type="tel" name="phone2" minlenth='3' maxlength='4' pattern="[0-9]+">- 
						<input class="memberform_box_tel" type="tel" name="phone3" minlenth='3' maxlength='4' pattern="[0-9]+">
						<input type="hidden" name="phone"></td>
					</tr>
					<tr>
						<td width="110"><p align="left" style="top: -1em; position: relative;">이메일<span id="memberform_necessity">&nbsp;*</span></td>
						<!-- <td width="400">
						<input class="memberform_box" id="userEmail" type="email" name="email"> -->
						
			             <td width="400"><p style="margin-left: 1.9em;">
			             <input type="text" name="emailId" id="inputEmail">@
			             <input type="text" name="emailAddress" id="inputEmail">
						<div class="memberSubscription">
						<input id="subscription" type="checkbox" name="subscription1"><span id="memberSubscription">E-Mail 수신 동의(선택)</span></td>
						<input id="subscription" type="hidden" name="subscription">
						</div>
				            <td style="position: relative; left: -3.3em;">
				             <select name="emailAddresList">
				                <option value="">직접입력</option>
				                <option value="naver.com">naver.com</option>
				                <option value="hanmail.net">hanmail.net</option>
				                <option value="gmail.com">gmail.com</option>
				                <option value="kakao.com">kakao.com</option>
				                <option value="nate.com">nate.com</option>
				                <option value="yahoo.co.kr">yahoo.co.kr</option>
				             </select>
			             <input type="hidden" name="email" >
				             </td>
					</tr>
					<tr>
					<tr>
						<td width="110"><p align="left">소속회사</td>
						<td width="400">
						<input class="memberform_box_company" type="text" name="companyName" id="companyName" readonly>
						<input id="memberform_search" type="button" name="button" value="검색" onclick="popup()"></td>
					</tr>
				</table>
				<div class="memberform_button">
					<input id="submit" type="submit" value="가입" onclick="addFrm.checking_email()">
					<input id="memberForm_cancel" type="button" onclick="location.href='${contextPath}/'" value="취소">
				</div>
			</form>
		</div>

	</div>

	<!-- 비밀번호 확인 -->
	<script>
		$('.memberform').focusout(function() {
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();

			if (pwd1 != '' && pwd2 == '') {
				null;
			} else if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").css('display', 'inline-block');
					$("#alert-danger").css('display', 'none');
				} else {
					$("#alert-success").css('display', 'none');
					$("#alert-danger").css('display', 'inline-block');
				}
			}
		});
		
		//등록할 때 텍스트박스 값 합쳐서 db에 저장할 메소드
		   $(function(){		
		      $('#addMemberForm').submit(function(){
		         var registercheckfrm = document.addFrm;
		         var tel1 = registercheckfrm.tel1.value;
		         var tel2 = registercheckfrm.tel2.value;
		         var tel3 = registercheckfrm.tel3.value;
		         var phone1 = registercheckfrm.phone1.value;
		         var phone2 = registercheckfrm.phone2.value;
		         var phone3 = registercheckfrm.phone3.value;
		         var tel = tel1+'-'+tel2+'-'+tel3;
		         var phone = phone1+'-'+phone2+'-'+phone3;
		         var emailId = registercheckfrm.emailId.value;
		         var emailAddress = registercheckfrm.emailAddress.value;
		         var email = emailId + '@' + emailAddress;
		         
		         
		         if(tel == '--') {
		        	 tel = null;
		         } else {
		         registercheckfrm.tel.value = tel;
		         }
		         registercheckfrm.phone.value = phone;
		         registercheckfrm.email.value = email;
		         return true;
		      }); 
		   })
		//체크박스 체크여부에 따른 값 입력
			
		addFrm.checking_email = function() {
			if($("input:checkbox[name=subscription1]").is(":checked")){
			$("input:hidden[name=subscription]").val("T");
			}else{
			$("input:hidden[name=subscription]").val("F");
			}
		   }
		</script>
		<script>
		<!-- 유효성 검사 -->
		$(document).ready(function(){
			// 취소
			$("#submit").on("click", function(){
				if($("#userName").val()==""){
					alert("이름을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#pwd1").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pwd1").focus();
					return false;
				}
				if($("#pwd2").val()==""){
					alert("비밀번호 확인란을 입력해주세요.");
					$("#pwd2").focus();
					return false;
				}
				if($("#userPhone").val()==""){
					alert("휴대폰을 입력해주세요.");
					$("#userPhone").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				var idChkVal = $("#idCheck").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#addMemberForm").submit();
				}
			});
		})
		
		//아이디 중복체크
		function fn_idChk(){
			var id = $("#userId").val();
			
			$.ajax({
				url : "${contextPath}/member/idCheck.do",
				type : "post",
				dataType : "json",
				data : { id : id },
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
		
		//회사 리스트 팝업창 뛰우기
		function popup(){
		    var url = "${contextPath}/company/popUp.do";
		    var name = "popup test";
		    var option = "width = 630, height = 620, top = 100, left = 200, location = no"
		    window.open(url, name, option);
		    
		}
		
		
		//이메일 선택
		$("select[name='emailAddresList']").on('change', function() {
	         
	         selectedAddress = $("select[name='emailAddresList'] option:selected").val();
	         if (selectedAddress != "") {
	            $("input[name='emailAddress']").attr('readonly', true);
	         } else{
	            $("input[name='emailAddress']").attr('readonly', false);
	         }
	         var frm = document.addFrm;
	         frm.emailAddress.value = selectedAddress;
	         
	      })
		
		
		</script>


</body>