<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var= "name" items="${nameList }">
	<c:forEach var="vo" items="${list }">
		<div class="row">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		      <img src="..." alt="${name }img">
		      <div class="caption">
		        <h3><a href="${cp }/user/productDetail?pid=${vo.pid}">${name }</a></h3>
		        <h3>상품아이디: ${vo.pid }</h3>
		        <h3>상품가격: ${vo.pprice }</h3>
		        <h3>할인율: ${vo.pdiscount }</h3>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
</c:forEach>