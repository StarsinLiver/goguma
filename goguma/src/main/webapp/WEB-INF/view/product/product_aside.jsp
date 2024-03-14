<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<aside id="user-aside" style="width : 250px;">
    <h2>검색</h2>
    <ul>
        <li><a href="#" class="search-type" data-type="title">제목 검색</a><input type="text" class="search-input" placeholder="검색어 입력" oninput="highlightSearch(this)" /></li>
        <li><a href="#" class="search-type" data-type="address">주소 검색</a><input type="text" class="search-input-address" placeholder="검색어 입력" oninput="highlightSearch(this)" /></li>
         <li><a href="#" class="search-type" data-type="title">낮은 가격</a><input type="number" class="search-low-price" placeholder="낮은 가격 입력" oninput="highlightSearch(this)" min="0" max="9999999" step="1000" value="0"/></li>
                  <li><a href="#" class="search-type" data-type="title">높은 가격</a><input type="number" class="search-high-price" placeholder="높은 가격 입력" oninput="highlightSearch(this)" min="0" max="9999999" step="1000" value="0"/></li>
        <li><a href="#" class="search-type" data-type="interest">관심 많은 순</a></li>
        <li><a href="#" class="search-type" data-type="chat">채팅 많은 순</a></li>
        <li><a href="#" class="search-type" data-type="price-high">가격 높은 순</a></li>
        <li><a href="#" class="search-type" data-type="price-low">가격 낮은 순</a></li>
    </ul>
    <button class="btn" onclick="checkSelected()">확인</button>
    <button class="btn" onclick="resetSelection()" id="button1">태그 초기화</button>
</aside>

