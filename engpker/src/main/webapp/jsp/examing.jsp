<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0046)http://localhost:8080/examxx/student/examing/2 -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!--<base href="http://localhost:8080/examxx/">-->
    <base href=".">

    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Exam++</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="shortcut icon" href="../img/favicon.ico">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/exam.css" rel="stylesheet" type="text/css">
    <link href="../css/style-2.css" rel="stylesheet">

    <style type="text/css"></style>

</head>

<body>
    <div id="dic_bubble" class="selection_bubble" style="z-index:9999;" fetching="false"></div>
    <header>
        <div class="container">
            <div class="row">
                <div class="row">
                    <div class="col-xs-5">
                        <div class="logo">
                            <h1><a href="#">互联网英语学习考试系统</a></h1>
                            <div class="hmeta">
                                高效的英语学习解决方案
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-7" id="login-info">

                    </div>
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
                        <a href="#"><i class="fa fa-home"></i>主页</a>
                    </li>
                    <li class="active">
                        <a href="#"><i class="fa fa-edit"></i>试题练习</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-dashboard"></i>用户中心</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-cogs"></i>个人设置</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- Navigation bar ends -->

    <div class="content" style="margin-bottom: 100px;">

        <div class="container">
            <div class="row">
                <div class="col-xs-3" style="padding-right: 0px;padding-bottom:15px;">
                    <div class="def-bk" id="bk-exam-control">

                        <div class="def-bk-content" id="exam-control">

                            <div id="question-time" class="question-time-normal">
                                <div style="height:140px;text-align: center;">
                                    <i id="time-icon" class="fa fa-clock-o"> </i>
                                </div>

                                <span style="margin-right:10px;color: #B8B8B8;">倒计时</span>
                                <span id="exam-clock">00:59:42</span>
                                <span id="exam-timestamp" style="display:none;">3582</span>
                                <div id="answer-save-info"></div>

                            </div>
                            <div id="question-submit">
                                <button class="btn-success btn" style="width:100%;">
                                    我要交卷
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
                                <div id="exampaper-title" class="">
                                    <i class="fa fa-send"></i>
                                    <span id="exampaper-title-name"> 模拟试卷 </span>
                                    <span style="display:none;" id="exampaper-id">1</span>
                                </div>
                                <div id="exampaper-desc-container" class="">
                                    <div id="exampaper-desc" class="exampaper-filter"><span class="exampaper-filter-item efi-qt-singlechoice efi-selected">单选题[<span class="efi-fno">0</span>/<span class="efi-tno">60</span>]<span class="efi-qcode" style="display:none;">qt-singlechoice</span></span><span class="exampaper-filter-item efi-qt-trueorfalse">判断题[<span class="efi-fno">0</span>/<span class="efi-tno">40</span>]<span class="efi-qcode" style="display:none;">qt-trueorfalse</span></span>
                                    </div>
                                </div>

                            </div>
                            <input type="hidden" id="hist-id" value="1">
                            <input type="hidden" id="paper-id" value="2">
                            <ul id="exampaper-body">
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">1.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">1</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">The composer has never courted popularity: her rugged modernism seems to defy rather than to ______ the audience.</p>
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
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">2.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">2</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">The sight of a single actor portraying several characters in the same scene is no longer a shock to the average moviegoer, such special- effects trickery having become so ______.</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: expensive</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: specialized</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: sinister</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: commonplace</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="E" name="question-radio1" class="question-input">E: unreliable</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">3.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">3</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">机动车驾驶人造成事故后逃逸构成犯罪的，吊销驾驶证且多长时间不得重新取得驾驶证？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 5年内</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 10年内</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 终生</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 20年内</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">4.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">11</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">未取得驾驶证的学员在道路上学习驾驶技能，下列哪种做法是正确的？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 使用所学车型的教练车由教练员随车指导</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 使用所学车型的教练车单独驾驶学习</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 使用私家车由教练员随车指导</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 使用所学车型的教练车由非教练员的驾驶人随车指导</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">5.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">12</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">机动车驾驶人初次申领驾驶证后的实习期是多长时间？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 6个月</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 12个月</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 16个月</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 18个月</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">6.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">13</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">在实习期内驾驶机动车的，应当在车身后部粘贴或者悬挂哪种标志？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 注意新手标志</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 注意避让标志</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 统一式样的实习标志</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 注意车距标志</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">7.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">14</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">以欺骗、贿赂等不正当手段取得驾驶证被依法撤销驾驶许可的，多长时间不得重新申请驾驶许可？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 3年内</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 终身</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 1年内</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 5年内</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">8.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">20</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">驾驶拼装机动车上路行驶的驾驶人，除按规定接受罚款外，还要受到哪种处理？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 处10日以下拘留</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 暂扣驾驶证</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 吊销驾驶证</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 追究刑事责任</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">9.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">21</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">驾驶报废机动车上路行驶的驾驶人，除按规定罚款外，还要受到哪种处理？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 撤销驾驶许可</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 收缴驾驶证</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 强制恢复车况</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 吊销驾驶证</li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="question qt-singlechoice" style="display: list-item;">
                                    <div class="question-title">
                                        <div class="question-title-icon"></div><span class="question-no">10.</span><span class="question-type" style="display: none;">singlechoice</span><span class="knowledge-point-id" style="display: none;">1</span><span class="question-type-id" style="display: none;">1</span><span>[单选题]</span><span class="question-point-content"><span>(</span><span class="question-point">1</span><span>分)</span></span><span class="question-id" style="display:none;">22</span>
                                    </div>
                                    <form class="question-body">
                                        <p class="question-body-text">对驾驶已达到报废标准的机动车上路行驶的驾驶人，会受到下列哪种处罚？</p>
                                        <ul class="question-opt-list">
                                            <li class="question-list-item">
                                                <input type="radio" value="A" name="question-radio1" class="question-input">A: 处15日以下拘留</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="B" name="question-radio1" class="question-input">B: 吊销机动车驾驶证</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="C" name="question-radio1" class="question-input">C: 处20以上200元以下罚款</li>
                                            <li class="question-list-item">
                                                <input type="radio" value="D" name="question-radio1" class="question-input">D: 追究刑事责任</li>
                                        </ul>
                                    </form>
                                </li>
                            </ul>
                            <div id="exampaper-footer" style="height: 217px;">
                                <div id="question-navi" style="position: fixed; bottom: 0px; z-index: 1;">
                                    <div id="question-navi-controller">
                                        <i class="fa fa-arrow-circle-down"></i>
                                        <span>答题卡</span>
                                    </div>
                                    <div id="question-navi-content">

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div id="loading-progress" style="display:none;">
            <div id="loading-content">
                <h2>正在提交您的答案</h2>
                <img class="loading-gif" src="./Exam++_files/loading.gif">
                <div></div>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copy">
                        <p>
                            Exam++ Copyright © <a href="http://www.examxx.net/" target="_blank">Exam++</a> - <a href="http://localhost:8080/examxx/" target="_blank">主页</a> | <a href="http://www.examxx.net/" target="_blank">关于我们</a> | <a href="http://www.examxx.net/" target="_blank">FAQ</a> | <a href="http://www.examxx.net/" target="_blank">联系我们</a>
                        </p>
                    </div>
                </div>
            </div>

        </div>

    </footer>

    <!-- Slider Ends -->

    <!-- Javascript files -->
    <!-- jQuery -->
    <script type="text/javascript" src="../js/jquery/jquery-1.9.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/all.js"></script>
    <script type="text/javascript" src="../js/paper-examing.js"></script>



</body>

</html>