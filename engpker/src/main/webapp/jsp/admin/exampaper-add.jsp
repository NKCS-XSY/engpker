<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>

<%@ include file="../common/taglibs.jsp"%>

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
		
		<link href="css/question-add.css" rel="stylesheet">
		<link href="chart/morris.css" rel="stylesheet">
		<style>
			input.add-ques-amount,input.add-ques-score{
				width:50px;
				margin-right:0;
			}
		
		</style>
	</head>
	<body>
		<%@ include file="../common/header.jsp"%>
		
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="#"><i class="fa fa-home"></i>网站首页</a>
						</li>
						<li>
							<a href="admin/question-list"><i class="fa fa-edit"></i>试题管理</a>
						</li>
						<li class="active">
							<a href="admin/exampaper-list"><i class="fa fa-file-text-o"></i>试卷管理</a>
						</li>
						<li>
							<a href="admin/user-list"><i class="fa fa-user"></i>会员管理</a>
						</li>
						<li>
							<a href="admin/field-list-1"><i class="fa fa-cloud"></i>题库管理</a>
						</li>
						<li>
							<a href="admin/sys-backup"><i class="fa fa-cogs"></i>网站设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							<li>
								<a href="admin/exampaper-list"> <i class="fa fa-list-ul"></i> 试卷管理 </a>
							</li>
							<li class="active">
								<a> <i class="fa fa-file-text-o"></i> 创建新试卷 </a>
							</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-file-text-o"></i> 创建新试卷 </h1>
						</div>
						<div class="page-content row">
							<form id="form-exampaper-add" method="post" action="/engpker/AddExamPaperServlet">
								<div class="form-line add-update-exampapername">
									<span class="form-label"><span class="warning-label">*</span>试卷名称：</span>
									<input type="text" class="df-input-narrow" name="papername">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-creat-type">
									<span class="form-label"><span class="warning-label">*</span>组卷方式：</span>
									<select class="df-input-narrow" >
										<option value="2">自动组卷</option>
										<option value="1">手动组卷</option>	
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-type">
									<span class="form-label"><span class="warning-label">*</span>试卷类型：</span>
									<select class="df-input-narrow">
										<option value="3">专家试卷</option>
										<option value="2" selected="selected">模拟考试</option>
										<option value="1">随机试卷</option>
										
									</select>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-pass-point">
									<span class="form-label"><span class="warning-label">*</span>及格分数：</span>
									<input type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-duration">
									<span class="form-label"><span class="warning-label">*</span>时长（分钟）：</span>
									<input type="text" class="df-input-narrow">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-types" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>题型：</span>
									<fieldset>
										<legend>
											选择题型分布
										</legend>
										<span class="add-ques-type">
											<label >单选题</label>
											<input type="hidden" class="ques-id" value="1">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >多选题</label>
											<input type="hidden" class="ques-id" value="2">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >判断题</label>
											<input type="hidden" class="ques-id" value="3">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >填空题</label>
											<input type="hidden" class="ques-id" value="4">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >简答题</label>
											<input type="hidden" class="ques-id" value="5">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >论述题</label>
											<input type="hidden" class="ques-id" value="6">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
										<span class="add-ques-type">
											<label >分析题</label>
											<input type="hidden" class="ques-id" value="7">
											<input type="text" class="df-input-narrow add-ques-amount">
											<span>道</span>
											<label >每道题</label>
											<input type="text" class="df-input-narrow add-ques-score">
											<span>分</span>
										</span>
										<br>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-total-point">
									<span class="form-label"><span class="warning-label">*</span>总分：</span>
									<input id="total-point" type="text" class="df-input-narrow" disabled="disbaled">
									<span class="form-message"></span>
								</div>
				
								<div class="form-line">
									<input value="下一步" type="submit" class="df-submit">
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="../common/footer.jsp"%>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/all.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/field-2-point.js"></script>
		<script type="text/javascript" src="js/exampaper-add.js"></script>
		
	</body>
</html>