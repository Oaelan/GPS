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
    	<div class="title">Green Hospital
    	</div>
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
				<c:if test="${loginedType == 'master'}">
				<li><a href="/introduce">의료진 가입 요청</a></li>
				</c:if>
				
			</c:if>	
			
					
		</ul>
	</div>
	<div id="userMenu" class="user-menu">
    <a href="#" class="closebtn" onclick="closeUserMenu()">&times;</a>
    <ul>
      <li><a href="/">로그아웃</a></li>
      <li><a href="/MyPage">마이페이지</a></li>
    </ul>
  </div>
  <script src="../resources/JS/main.js"></script>
