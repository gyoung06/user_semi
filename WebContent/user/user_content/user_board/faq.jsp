<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#accodion.collapse
</style>
<h4>자주묻는질문</h4>
<c:forEach var="vo" items="${list }">
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" 
        href="#${vo.fcontent }" aria-expanded="true" 
        aria-controls="${vo.fcontent }">
         	${vo.ftitle }
        </a>
      </h4>
    </div>
    <div id="${vo.fcontent }" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
			${vo.fcontent }
      </div>
    </div>
  </div>
</div>
</c:forEach>
