<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<table class="table">
		<tr>
			<th colspan="8">QnA</th>
		</tr>
		<tr>
			<th>카테고리</th>
			<th>회원아이디</th>
			<th>제품번호</th>
			<th>제목</th>
			<th>작성날짜</th>			
			<th>번호</th>			
			<th>삭제</th>			
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.qcate }</td>
			<td>${vo.mid }</td>
			<td>${vo.pid }</td>
			<td>
			<c:if test="${vo.qlev>0 }">		
				<c:forEach var="i" begin="1" end="${vo.qlev }">
					&nbsp;&nbsp;
				</c:forEach>
				[re]
			</c:if>
			<a href="${cp }/admin/qnadetail?qid=${vo.qid }" 
			onclick="window.open(this.href,'','width=500, height=500, toolbars=no, scrollbars=yes'); return false;">${vo.qtitle }</a></td>
			<td>${vo.qrdate }</td>
			<td></td>
			<td></td>
		</tr>
		</c:forEach>
	</table>