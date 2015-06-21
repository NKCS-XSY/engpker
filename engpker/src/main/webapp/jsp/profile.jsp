<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">
    <title>个人主页</title>

    <!-- Bootstrap css -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style-2.css" rel="stylesheet">
    <link href="css/style-1.css" rel="stylesheet">
    <link href="css/local.css" rel="stylesheet" />
    <link href="css/style-responsive-1.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#">互联网英语学习考试系统</a></h1>
							<div class="hmeta">
								英语高效学习解决方案
							</div>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">

				</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="home"><i class="fa fa-home"></i>主页</a>
						</li>
						<li>
							<a href="start-exam"><i class="fa fa-edit"></i>试题练习</a>
						</li>
						<li class="active">
							<a href="jsp/profile.jsp"><i class="fa fa-dashboard"></i>个人主页</a>
						</li>
						<li>
							<a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->
		
<!-- 	  <div class="content" style="margin-bottom: 100px;"> -->
		<!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <div class="row">
                <!-- profile-widget -->
                <div class="col-lg-12">
                    <div class="profile-widget profile-widget-info">
                          <div class="panel-body">
                            <div class="col-lg-2 col-sm-2">
                              <h4>Jenifer Smith</h4>               
                              <div class="follow-ava">
                                  <img src="img/profile-widget-avatar.jpg" alt="">
                              </div>
                              <h6></h6>
                            </div>
                            <div class="col-lg-4 col-sm-4 follow-info">
                                <p>大家好我是 Jenifer Smith</p>
                                <p>@jenifersmith</p>
								<p><i class="fa fa-twitter">jenifertweet</i></p>
                                <h6>
                                    <span><i class="icon_clock_alt"></i>11:05 AM</span>
                                    <span><i class="icon_calendar"></i>2014.04.03</span>
                                    <span><i class="icon_pin_alt"></i>NY</span>
                                </h6>
                            </div>
                            <div class="col-lg-2 col-sm-6 follow-info weather-category">
                                      <ul>
                                          <li class="active">
                                              
                                              <i class="fa fa-comments fa-2x"> </i><br>
											  
											  聊天
                                          </li>
										   
                                      </ul>
                            </div>
							<div class="col-lg-2 col-sm-6 follow-info weather-category">
                                      <ul>
                                          <li class="active">
                                              
                                              <i class="fa fa-bell fa-2x"> </i><br>
											  
											 消息
                                          </li>
										   
                                      </ul>
                            </div>
							<div class="col-lg-2 col-sm-6 follow-info weather-category">
                                      <ul>
                                          <li class="active">
                                              
                                              <i class="fa fa-tachometer fa-2x"> </i><br>
											  
                                             记录
                                          </li>
										   
                                      </ul>
                            </div>
                          </div>
                    </div>
                </div>
              </div>
              <!-- page start-->
              <div class="row">
                 <div class="col-lg-12">
                    <section class="panel">
                          <header class="panel-heading tab-bg-info">
                              <ul class="nav nav-tabs">
                                  <li class="active">
                                      <a data-toggle="tab" href="#recent-activity">
                                          <i class="icon-home"></i>
                                          时间线
                                      </a>
                                  </li>
                                  <li>
                                      <a data-toggle="tab" href="#profile">
                                          <i class="icon-user"></i>
                                          个人信息
                                      </a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#edit-profile">
                                          <i class="icon-envelope"></i>
                                          编辑个人信息
                                      </a>
                                  </li>
                              </ul>
                          </header>
                          
                          <!--   -->
                          <div class="panel-body">
                              <div class="tab-content">
                                  <div id="recent-activity" class="tab-pane active">
                                      <div class="container">
                                          <div class="page-header">
                                              <h1 id="timeline">用户事件记录</h1>
                                          </div>
                                          <ul class="timeline">
                                              <li>
                                                  <div class="timeline-badge info"><i class="fa fa-unlock"></i></div>
                                                  <div class="timeline-panel">
                                                      <div class="timeline-heading">
                                                          <h4 class="timeline-title">用户登陆</h4>
                                                          <span><i class="fa fa-clock-o fa-2x"></i>1小时20分钟以前</span>
                                                          <hr />
                                                      </div>
                                                      <div class="timeline-body">
                                                          <p>
                                                              您在1小时20分钟以前登陆，并在1小时前注销。
                                                          </p>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="timeline-inverted">
                                                  <div class="timeline-badge success"><i class="fa fa-search"></i></div>
                                                  <div class="timeline-panel">
                                                      <div class="timeline-heading">
                                                          <h4 class="timeline-title">用户PK记录表</h4>
                                                          <span><i class="fa fa-clock-o fa-2x"></i> 57分钟前</span>
                                                          <hr />
                                                      </div>
                                                      <div class="timeline-body">
                                                          <p>
                                                              您在由用户“John”发起的挑战中打败了三人，考试成绩为90分。
                                                          </p>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li>
                                                  <div class="timeline-badge danger"><i class="fa fa-shopping-cart"></i></div>
                                                  <div class="timeline-panel">
                                                      <div class="timeline-heading">
                                                          <h4 class="timeline-title">Items added to shopping cart</h4>
                                                          <span><i class="fa fa-clock-o fa-2x"></i> 37 minutes ago</span>
                                                          <hr />
                                                      </div>
                                                      <div class="timeline-body">
                                                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                              incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                                              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
                                                          </p>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="timeline-inverted">
                                                  <div class="timeline-badge info"><i class="fa fa-dollar"></i></div>
                                                  <div class="timeline-panel">
                                                      <div class="timeline-heading">
                                                          <h4 class="timeline-title">Payment processed</h4>
                                                          <span><i class="fa fa-clock-o fa-2x"></i> 27 minutes ago</span>
                                                          <hr />
                                                      </div>
                                                      <div class="timeline-body">
                                                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                              incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                                              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
                                                          </p>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li>
                                                  <div class="timeline-badge info"><i class="fa fa-share"></i></div>
                                                  <div class="timeline-panel">
                                                      <div class="timeline-heading">
                                                          <h4 class="timeline-title">User logged out</h4>
                                                          <span><i class="fa fa-clock-o fa-2x"></i> 10 minutes ago</span>
                                                          <hr />
                                                      </div>
                                                      <div class="timeline-body">
                                                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                              incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                                              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                                              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
                                                          </p>
                                                      </div>
                                                  </div>
                                              </li>
                                          </ul>
                                      </div>
                                  </div>
                                  
                                  <!-- profile -->
                                  <div id="profile" class="tab-pane">
                                    <section class="panel">
                                      <div class="bio-graph-heading">
                                                Hello I’m Jenifer Smith, a leading expert in interactive and creative design specializing in the mobile medium. My graduation from Massey University with a Bachelor of Design majoring in visual communication.
                                      </div>
                                      <div class="panel-body bio-graph-info">
                                          <h1>Bio Graph</h1>
                                          <div class="row">
                                              <div class="bio-row">
                                                  <p><span>姓名 </span>: Jenifer </p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>昵称 </span>: jaja</p>
                                              </div>                                              
                                              <div class="bio-row">
                                                  <p><span>生日</span>: 1995/03/05</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>国家</span>: 中国</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>职业 </span>: 学生</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Email </span>:jenifer@mailname.com</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>手机 </span>: 1234 456 789</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>电话 </span>:   956 789123</p>
                                              </div>
                                          </div>
                                      </div>
                                    </section>
                                      <section>
                                          <div class="row">                                              
                                          </div>
                                      </section>
                                  </div>
                                  <!-- edit-profile -->
                                  <div id="edit-profile" class="tab-pane">
                                    <section class="panel">                                          
                                          <div class="panel-body bio-graph-info">
                                              <h1> 个人信息</h1>
                                              <form class="form-horizontal" role="form">                                                  
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">姓名</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="f-name" placeholder="Jenifer">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">昵称</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="l-name" placeholder=" ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">关于我</label>
                                                      <div class="col-lg-6">
                                                          <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">国家</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="c-name" placeholder=" ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">生日</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="b-day" placeholder=" ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">职业</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="occupation" placeholder=" ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">邮箱</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="email" placeholder=" ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">电话</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="mobile" placeholder=" ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">网址 URL</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" id="url" placeholder="http://www.demowebsite.com ">
                                                      </div>
                                                  </div>

                                                  <div class="form-group">
                                                      <div class="col-lg-offset-2 col-lg-10">
                                                          <button type="submit" class="btn btn-primary">Save</button>
                                                          <button type="button" class="btn btn-danger">Cancel</button>
                                                      </div>
                                                  </div>
                                              </form>
                                          </div>
                                      </section>
                                  </div>
                              </div>
                          </div>
                      </section>
                 </div>
              </div>

              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
			
<!-- 		</div> -->
    <!-- javascripts -->
    <script src="js/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- jquery knob -->
    <script src="js/jquery.knob.js"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>

  <script>

      //knob
      $(".knob").knob();

  </script>

</body>
</html>