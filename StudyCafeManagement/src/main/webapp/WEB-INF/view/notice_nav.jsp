<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
li {list-style: none; display: inline; padding: 6px;}
</style>

<ul>					
				<li><a href="NoticeList?user_id=${sessionScope.user_id}&page=${cri.page }&perPageNum=${cri.perPageNum }">글목록보기</a></li>
				<li><a href="/StudyCafeManagement/common/LoginMain">메인화면</a></li>
</ul>