<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="java.util.*"%>
<%@ page import="edu.nk.pker.biz.impl.QuestionBizImpl" %>
<%@ page import="edu.nk.pker.biz.IQuestionBiz" %>
<%@ page import="edu.nk.pker.model.po.Question" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>images/favicon.ico" />
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/style-2.css" rel="stylesheet">
		
		<link href="css/exam.css" rel="stylesheet">
		<link href="chart/morris.css" rel="stylesheet">
		<style>
			.examing-point{
				display:block;
				font-size:10px;
				margin-top:5px;
			}
			.question-name-td{
				width:300px;
			}
		</style>
	</head>
	<body>
			<% 
		IQuestionBiz questionBiz =new QuestionBizImpl();
		List<Question> questionList = questionBiz.getRandomQuestions(5);%>

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;width:840px;">

				<div class="row">
					
					<div class="col-xs-12">
						
						<div class="page-content row">

							<div id="question-filter">

								<dl id="question-filter-field">
									<dt>
										类别：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.fieldId == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										
										<c:forEach items="${fieldList}" var="field">
											<c:choose>
												<c:when test="${questionFilter.fieldId == field.fieldId }">
													<span class="label label-info" data-id="${field.fieldId}">${field.fieldName}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${field.fieldId}">${field.fieldName}</span>
												</c:otherwise>
											</c:choose>	
										</c:forEach>
									</dd>
								</dl>

								<dl id="question-filter-qt">
									<dt>
										试题类型：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.questionType == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${questionTypeList}" var="questionType">
											<c:choose>
												<c:when test="${questionFilter.questionType == questionType.id }">
													<span data-id="${questionType.id}" class="label label-info">${questionType.name}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${questionType.id}">${questionType.name}</span>
												</c:otherwise>
											</c:choose>
											
											
										</c:forEach>

									</dd>
								</dl>
								<div class="page-link-content">
									<ul class="pagination pagination-sm">${pageStr}</ul>
								</div>
							</div>
							<div id="question-list">
								<input id="field-id-hidden" value="${fieldId }" type="hidden">
								<input id="knowledge-hidden" value="${knowledge }" type="hidden">
								<input id="question-type-hidden" value="${questionType }" type="hidden">
								<input id="search-param-hidden" value="${searchParam }" type="hidden">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td><td>ID</td><td class="question-name-td">试题名称</td><td>试题类型</td><td>专业</td><td>知识类</td><td>创建人</td>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="<%=questionList %>" var="items">
											<tr>
												<td>
												<input type="checkbox" value="${items.questionId }">
												</td><td>${items.questionId }</td>
												<td>
													<a href="admin/question-preview/${items.questionId }" target="_blank" title="预览">${items.name }</a>
												</td>
												<td>{items.questionType }</td>
												<td>{items.fieldName }</td>
												<td>{items.pointName }</td>
												<td>{items.creator }</td>
											</tr>
										</c:forEach>
										

									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div class="page-link-content">
								<ul class="pagination pagination-sm">${pageStr}</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/question-list4dialog.js"></script>
	</body>
</html>
