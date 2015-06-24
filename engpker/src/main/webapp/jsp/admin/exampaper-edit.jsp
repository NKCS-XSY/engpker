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
		<title>EngPKer</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>images/favicon.ico" />
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/style-2.css" rel="stylesheet">
		
		<link href="css/exam.css" rel="stylesheet">
		<link href="chart/morris.css" rel="stylesheet">
		<style>
			#add-more-qt-to-paper{
				cursor: pointer;
				color: #1ba1e2;
			}
			#add-more-qt-to-paper:hover{
				color:#ff7f74;
			}
			#add-more-qt-to-paper i{
				color: #47a447;
				cursor: pointer;
				margin-right:5px;	
			}
			
			#qt-selector-iframe{
				border:none;
				height:600px;
			}
			.tmp-ques-remove{
				margin-left:10px;
			}
			
			.question-point{
				padding:0 8px;
				margin:0 2px;
				border-bottom: 1px solid;
				cursor:pointer;
			}
			.question-point:hover{
				color:#ff7f74;
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
							<li>
								<a href="admin/exampaper-add"> <i class="fa fa-file-text-o"></i> 创建新试卷 </a>

							</li>
							<li class="active">
								<a> <i class="fa fa-bar-chart-o"></i> 修改试卷 </a>
							</li>

						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1 style="margin-left: -15px;"><i class="fa fa-file-text"></i> 修改试卷 </h1>
						</div>
						<div class="page-content row">
							<div class="def-bk" id="bk-exampaper">

								<div class="expand-bk-content" id="bk-conent-exampaper">
									<div id="exampaper-header">
										<div id="exampaper-title">
											<i class="fa fa-send"></i>
											<span id="exampaper-title-name"> ${papername} </span>
											<span style="display:none;" id="exampaper-id">${paperid}</span>
										</div>
										<div id="exampaper-desc-container">
											<div id="exampaper-desc" class="exampaper-filter">
												
											
											</div>
											<div style="margin-top: 5px;">
												<span>试卷总分：</span><span id="exampaper-total-point" style="margin-right:20px;"></span>
												<span id="add-more-qt-to-paper"><i class="small-icon fa fa-plus-square" title="添加选项"></i><span>增加更多题目</span></span>
											</div>
										</div>
										
									</div>
									<ul id="exampaper-body" style="padding:0px;">
									</ul>
									<div id="exampaper-footer">
										<div id="question-navi">
										<div id="question-navi-controller">
											<i class="fa fa-arrow-circle-down"></i>
											<span>答题卡</span>
										</div>
										<div id="question-navi-content">
										</div>
										</div>
										<div style="padding-left:30px;">
											<button class="btn btn-danger"><i class="fa fa-save"></i>保存试卷</button>
										</div>
										
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="question-selector-modal">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">选择试题添加到试卷中</h4>
						      </div>
						      <div class="modal-body">
						        <iframe  id="qt-selector-iframe" src="jsp/admin/question-list-dialog.jsp" width="100%"></iframe>
						      </div>
						      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
							        <button id="add-list-to-exampaper" type="button" class="btn btn-primary">添加选中</button>
							      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
			</div>
			<div class="modal fade" id="question-point-modal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">修改分数</h4>
						      </div>
						      <div class="modal-body">
						        	<form>
										<div class="form-line qt-point-destination">
											<span class="form-label">分数：</span>
											<label></label>
											<input type="text" value=""/>
										</div>
										<div class="form-line">
											<button class="btn btn-sm btn-success" id="update-point-btn"><i class="fa fa-check"></i>仅修改第<span id="qt-point-target-index"></span>题</button>
											<button class="btn btn-sm btn-warning" id="update-point-type-btn"><i class="fa fa-random"></i>批量更新该题型</button>
										</div>
									</form> 

						      </div>
						      
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
			</div>
			
		</div>

		<%@ include file="../common/footer.jsp"%>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/all.js"></script>
		<script type="text/javascript" src="js/exampaper-edit.js"></script>
		
	</body>
</html>