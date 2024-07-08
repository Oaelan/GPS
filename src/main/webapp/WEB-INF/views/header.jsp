<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div class="StateBar">   	
    	<img src="../resources/IMG/wifi.png" class="wifi">
    	<img src="../resources/IMG/battery.png" class="battery">
    	<div class="time">12:00</div>  	
    </div>
    
    <div class="Menu">
    	<img src="../resources/IMG/menu_bar.png" class="menuBar" onclick="toggleMenu()">
			<c:if test="${userId == null}">
				<div class="title">
					<a href="/" style="text-decoration: none; font-weight: bold; color: white;">Green Hospital</a>
				</div>
			</c:if>
			<c:if test="${userId != null}">
				<div class="title">
					<a href="/introduce" style="text-decoration: none; font-weight: bold; color: white;">Green Hospital</a>
				</div>
			</c:if>			
	<img src="../resources/IMG/user.png" class="user" onclick="openUserMenu()">
    	
	</div>
	 <div id="slideMenu" class="slide-menu">
      <a href="#" class="closebtn" onclick="closeMenu()">&times;</a>
		<ul>
			<c:if test="${loginedType == null}">
				<li ><a href="/ComingRoute">오시는 길</a></li>
				<li><a href="/FindRoute">병원 내 길찾기</a></li>
				<li><a href="/introduce">병원소개</a></li>
			</c:if>
			
			<c:if test="${loginedType != null}">
				<li ><a href="/ComingRoute">담당 환자 찾기</a></li>
				<li><a href="/FindRoute">병원 내 길찾기</a></li>							
			</c:if>
				
			<c:if test="${loginedType.equals('master')}">
				<li><a href="/introduce">의료진 가입 요청</a></li>
			</c:if>
			
					
		</ul>
	</div>
	<div id="userMenu" class="user-menu">
    <a href="#" class="closebtn" onclick="closeUserMenu()">&times;</a>
    <ul>
		<c:if test="${userId == null}">
			<li><a href="/login">로그인</a></li>
			<li><a href="/sign">회원가입</a></li>
		</c:if>
		<c:if test="${userId != null}">
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/MyPage">마이페이지</a></li>
		</c:if>
	</ul>
  </div>
  <script src="../resources/JS/main.js"></script>
