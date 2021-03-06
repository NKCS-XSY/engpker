<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>

<%@ include file="common/taglibs.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<c:url value="/img/favicon.ico"/>"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<title>Start Exam</title>
	<!-- custom style -->
	<link href="css/style-2.css" rel="stylesheet">
</head>
<body>
<%@ include file="common/header.jsp"%>
<%@ include file="common/nav.jsp"%>
		<!-- Slider starts -->
		<div>
			<!-- Slider (Flex Slider) -->
			<div class="container" style="min-height:500px;">
				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							<li class="active">
								<a href="admin/question-list"> <i class="fa fa-list-ul"></i> 试题管理 </a>
							</li>
							<li>
								<a href="jsp/addQuestion.jsp"> <i class="fa fa-pencil-square-o"></i> 添加试题 </a>
							</li>
							<li>
								<a href="admin/question-import"> <i class="fa fa-cloud-upload"></i> 导入试题 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i> 试题管理 </h1>
						</div>
						<div class="page-content row">
							<div id="question-filter">
								<dl id="question-filter-field">
									<dt>
										题库：
									</dt>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file="common/footer.jsp"%>
</body>
</html>
