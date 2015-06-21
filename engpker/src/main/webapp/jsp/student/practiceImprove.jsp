<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
		<meta charset="utf-8" />
		<base href="<%=basePath%>">

		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Practice Improve</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<link rel="shortcut icon" href="<%=basePath%>images/favicon.ico" />
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/exam.css" rel="stylesheet" type="text/css">
		<link href="css/style-2.css" rel="stylesheet">
		
		<style type="text/css">
			.question-body {
				padding: 30px 30px 20px 30px;
				background: #FFF;
			}
			
			ul#exampaper-body{
				margin-bottom: 0px;
			}
			
			ul#exampaper-body li{
				padding-bottom:0px;
			}
			.question-body{
				min-height:300px;
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
							<a href="home"><i class="fa fa-home"></i>主页</a>
						</li>
						<li class="active">
							<a href="start-exam"><i class="fa fa-edit"></i>试题练习</a>
						</li>
						<li>
							<a href="student/usercenter"><i class="fa fa-dashboard"></i>个人主页</a>
						</li>
						<li>
							<a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<div class="content" style="margin-bottom: 100px;">
			<% 
				IQuestionBiz questionBiz =new QuestionBizImpl();
				List<Question> questionList = questionBiz.getRandomQuestions(5);%>
			<div class="container">
				<div class="row">
					<div class="col-xs-3" style="padding-right: 0px;padding-bottom:15px;">
						<div class="def-bk" id="bk-exam-control">

							<div class="def-bk-content" id="exam-control">

								<div>
									<span style="color:#428bca;">题型库：</span>
									<div>
										<span id="practice-type" class="pt-singlechoice">单选题[ 共 <span class="pt-tno"><%=questionList.size() %></span> 题 ]<span class="pt-qcode" style="display:none;">qt-singlechoice</span></span>
									</div>
									<!-- <span style="color:#428bca;">学习进度：</span>
									<div class="h-progress" style="margin-top:5px;" title="50%">
										<span></span>
									</div> -->
									<span id="exam-timestamp" style="display:none;">0</span>
									<div id="answer-save-info"></div>

								</div>
								<div id="question-submit">
									<button class="btn-success btn" style="width:100%;" id="switch-model-btn" data-exam="true"> 
										答题模式
									</button>
								</div>
								<div id="exam-info" style="display:none;">
									<span id="answer-hashcode"></span>
								</div>
							</div>

						</div>

					</div>
					<div class="col-xs-9" style="padding-right: 0px;">
						<div class="def-bk" id="bk-exampaper">
							<div class="expand-bk-content" id="bk-conent-exampaper">
								<div id="exampaper-header">
									<div id="exampaper-title"  style="margin-bottom:15px;">
										<i class="fa fa-paper-plane"></i>
										<span id="exampaper-title-name"> 强化练习 </span>

									</div>
									<!-- <div id="exampaper-desc-container">
									<div id="exampaper-desc" class="exampaper-filter">

									</div>
									</div> -->
							
								</div>

								<ul id="exampaper-body">
<%-- 									${questionStr } --%>
									<c:forEach items="<%=questionList %>" var="item">	
									<li class="question qt-singlechoice" style="display: list-item;">
									
										<div class="question-title">
											<div class="question-title-icon"></div>
											<span class="question-no">1.</span>
											<span class="question-type" style="display: none;">singlechoice</span>
											<span class="knowledge-point-id" style="display: none;">1</span>
											<span class="question-type-id" style="display: none;">1</span>
											<span>[单选题]</span>
											<span class="question-point-content" style="display: none;">
												<span>(</span>
												<span class="question-point">0</span><span>分)</span></span>
											<span class="question-id" style="display:none;">${item.questionId }</span>
											</div>
											<form class="question-body">
											<p class="question-body-text">${item.content}</p>
											<ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: ignore</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: discount</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: woo</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: teach</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="E" name="question-radio1" class="question-input">E: cow</li>
                                        	</ul>
											</form>
											<div class="answer-desc" style="display: none;">
											<div class="answer-desc-summary"><span>正确答案：</span><span class="answer_value">D</span><br></div>
											<div class="answer-desc-detail"><label class="label label-info"><i class="fa fa-paw"></i><span> 来源</span></label>
											<div class="answer-desc-content"><p></p></div></div><div class="answer-desc-detail"><label class="label label-warning"><i class="fa fa-flag"></i><span> 解析</span></label>
											<div class="answer-desc-content"><p></p></div></div><div class="answer-desc-detail"><label class="label label-success"><i class="fa fa-bookmark"></i><span> 考点</span></label>
											<div class="answer-desc-content"><p>驾校科目一理论考试 &gt; 道路交通安全法律、法规和规章 &gt; 
		知识关键点：</p></div></div></div></li>
								</c:forEach>
								</ul>
								<div id="exampaper-footer">
										
									
									<div id="question-switch">
										<button class="btn-success btn" id="previous-q-btn" style="width:160px;">
												<i class="fa fa-chevron-circle-left"></i>上一题

										</button>
										<button class="btn-success btn" id="next-q-btn" style="margin-left:60px;width:160px;">
												下一题 <i class="fa fa-chevron-circle-right"></i>
										</button>
										<button class="btn-warning btn" id="submit-q-btn" style="width:160px;float:right;">
												<i class="fa fa-check-circle-o"></i>提交答案

										</button>
									</div>
									
<!-- 									<div id="question-navi"> -->
<!-- 										<div id="question-navi-controller"> -->
<!-- 											<i class="fa fa-arrow-circle-down"></i> -->
<!-- 											<span>答题卡</span> -->
<!-- 										</div> -->
<!-- 										<div id="question-navi-content" ></div> -->
<!-- 									</div> -->

								</div>
							</div>
							
							<div class="expand-bk-content" id="bk-conent-comment" style="margin-top:40px;">
								<div id="comment-title" style="margin-bottom:15px;">
									<i class="fa fa-comments"></i>
									<span> 学员评论 </span>

								</div>
								<ul class="comment-list" style="display:none;">
									
									<li class="comment-list-item">
										<div class="comment-user-container">
											<div >
												<img src="img/photo.jpg" class="comment-user-img">
											</div>
											<div class="comment-user-info">
												<div>
													yanhuan [电能计量]
												</div>
												<div class="comment-date">
													发表于 1天前
												</div>
											</div>
										</div>
										<p class="comment-user-text">
											应该选B不是吗？
										</p>
										
									</li>
									<li class="comment-list-item">
										<div class="comment-user-container">
											<div >
												<img src="img/photo.jpg" class="comment-user-img">
											</div>
											<div class="comment-user-info">
												<div>
													yanhuan [电能计量]
												</div>
												<div class="comment-date">
													发表于 1天前
												</div>
											</div>
										</div>
										<p class="comment-user-text">
											应该选B不是吗？
										</p>
										
									</li>
								</ul>
<!-- 								<div> -->
<!-- 									<input type="hidden" id="idx_hidden" value="1"> -->
<!-- 									<button id="show_more_btn">更多评论</button> -->
<!-- 								</div> -->
								<form class="comment-form">
									<textarea rows="" cols="" style="width:100%;height:95px;"></textarea>
									<input class="btn btn-primary" type="submit" value="发表评论">
								</form>								
							</div>
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
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/all.js?v=0712"></script>
		<script type="text/javascript" src="js/practice-improve.js"></script>

	</body>
</html>
