<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${vo.pimage2}
${vo.pimage3}
${vo.pimage1}
<table>
	<tr>
		<th colspan="2">${stockVo.sname}</th>
	</tr>
	<tr>
		<td>정가</td>
		<td>${vo.pprice }원</td>
	</tr>
	<tr>
		<td>할인가격</td>
		<td>${vo.pprice*(100-vo.pdiscount)/100 }원</td>
	</tr>
	<tr>
		<td>사이즈</td>
		<td>
			<select>
				<c:forEach var="i" items="${sizeList }">
					<option>${i }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>색상</td>
		<td>
			<select>
				<c:forEach var="i" items="${colorList }">
					<option>${i }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>