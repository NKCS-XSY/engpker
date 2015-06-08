<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>EnglishPK</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES -->
    <link href="css/style.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/index.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="bootstrap/js/html5shiv.js"></script>
    <script src="bootstrap/js/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body data-spy="scroll" data-target="#topnav">

<div class="navbar navbar-inverse navbar-fixed-top" id="topnav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/expose-logo.png" alt="Expose" height="17px" /> </a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#home">主页</a></li>
                <li><a href="#services">英语</a></li>
                <li><a href="jsp/login.html">登录</a></li>
                <li><a href="#pricing">个人主页</a></li>
                <!--<li><a href="#clients">Clients</a></li-->
                <li><a href="#contact">联系我们</a></li>

            </ul>

        </div>
        <!--/.navbar-collapse -->
    </div>
</div>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron" id="home">
    <div class="container">
        <div class="media">
            <a href="#" class="pull-right"><img class="media-object" src="img/Finder_256.png"/></a>

            <div class="media-body">
                <div class="col-md-11">
                    <h1 class="title"> <strong> 英语 </strong>  <span><em>PK</em></span></h1>

                    <p>
                        最有趣的英语学习网站<br>
                        最全面的英语学习资料<br>
                        Welcome to PK English<br>

                  </p>

                    <p><a class="btn btn-success btn-lg" href="login.html"> 欢迎登录<i class="icon icon-angle-right"></i></a></p>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="container" id="services">
    <div class="row text-center pad-bottom">
        <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
            <h2 class="head-set"><strong>让英语学习更有趣</strong></h2>
            <p>
               <br><br>
            </p>
        </div>
    </div>
    <div class="row text-center portfolio-item">

        <div class="col-md-4 col-sm-4 ">
            <div class="alert alert-info">
                <img src="img/1.jpg" class="img-responsive " alt="" />
                <div class="thumbnail">
                <h3>GRE</h3>
                <h5><a href="#"><strong>点击这里</strong> </a>to go to the GRE</h5>
                 </div>
                </div>

        </div>
        <div class="col-md-4 col-sm-4 ">
            <div class="alert alert-danger">
                <img src="img/2.jpg" class="img-responsive " alt="" />
                <div class="thumbnail">
                <h3>TOEFL</h3>
                <h5><a href="#"><strong>点击这里</strong> </a>to go to the TOEFL</h5>
            </div>
                </div>
        </div>
        <div class="col-md-4 col-sm-4 ">
            <div class="alert alert-success">
                <img src="img/3.jpg" class="img-responsive " alt="" />
                <div class="thumbnail">
                <h3>IELTS</h3>
                <h5><a href="#"><strong>点击这里</strong> </a>to go to the IELTS</h5>
            </div>
            </div>
        </div>

    </div>
</div>
<!--div class="container" id="services">
    <!--&lt;!&ndash; Example row of columns &ndash;&gt;-->
    <!--<div class="row features">-->
        <!--<div class="col-lg-4 text-center">-->
            <!--<div class="single-fet">-->
                <!--<div>-->
                <!--<span class="icon-stack icon-4x">-->
  <!--<i class="icon-circle icon-stack-base"></i>-->
  <!--<i class="icon-ok icon-light"></i>-->
<!--</span>-->
                <!--</div>-->
                <!--<h2>With Bootstrap <span class="label label-warning">3.0</span></h2>-->

                <!--<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor-->
                    <!--mauris-->
                    <!--condimentum nibh, ut fermentum massa justo sit amet. </p>-->

            <!--</div>-->
        <!--</div>-->
        <!--<div class="col-lg-4 text-center">-->
            <!--<div class="single-fet">-->
                <!--<div>-->
                <!--<span class="icon-stack icon-4x">-->
  <!--<i class="icon-circle icon-stack-base"></i>-->
  <!--<i class="icon-laptop icon-light"></i>-->
<!--</span>-->
                <!--</div>-->
                <!--<h2>Fully Responsive</h2>-->

                <!--<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor-->
                    <!--mauris-->
                    <!--condimentum nibh, ut fermentum massa justo sit amet. </p>-->

            <!--</div>-->
        <!--</div>-->
        <!--<div class="col-lg-4 text-center">-->
            <!--<div class="single-fet">-->
                <!--<div>-->
                <!--<span class="icon-stack icon-4x">-->
  <!--<i class="icon-circle icon-stack-base"></i>-->
  <!--<i class="icon-download-alt icon-light"></i>-->
<!--</span>-->
                <!--</div>-->
                <!--<h2>And Totally <span style="color:#248822">Free</span></h2>-->

                <!--<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor-->
                    <!--mauris-->
                    <!--condimentum nibh, ut fermentum massa justo sit amet. </p>-->

            <!--</div>-->
        <!--</div>-->

    <!--</div>-->


<!--</div>-->


<!--<section class="slider" id="features">-->
    <!--<div class="container">-->
        <!--<div class="inner-page">-->
            <!--<h2 class="page-headline large text-center">Tell your projects awesome story.</h2>-->

            <!--<p class="text-center">Tell your projects awesome story. Tell your projects awesome story. Tell your-->
                <!--projects awesome story. Tell your projects awesome story.</p>-->
        <!--</div>-->
        <!--<div class="row inner-page">-->
            <!--<div class="col-md-8 col-md-push-4 lazy-container loaded">-->
                <!--<!--<img data-original="img/mockup.png" src="img/mockup.png" alt="Looks great on every device"-->-->
                <!--<!--class="lazy">-->-->

                <!--<h2>Our <strong>Features</strong></h2>-->

                <!--<div class="row">-->
                    <!--<div class="col-md-6">-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-group"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">Customer Support</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit amet, consectetur adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-file"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">HTML5 / CSS3 / JS</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit amet, adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-google-plus"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">500+ Google Fonts</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit amet, consectetur adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-adjust"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">Colors</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit amet, consectetur adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                    <!--<div class="col-md-6">-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-film"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">Sliders</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit amet, consectetur.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-magic small user"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">Icons</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit amet, consectetur adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-reorder"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">Buttons</h4>-->

                                <!--<p class="tall">Lorem ipsum dolor sit, consectetur adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<div class="feature-box">-->
                            <!--<div class="feature-box-icon">-->
                                <!--<i class="icon-desktop"></i>-->
                            <!--</div>-->
                            <!--<div class="feature-box-info">-->
                                <!--<h4 class="shorter">Lightbox</h4>-->

                                <!--<p class="tall">Lorem sit amet, consectetur adip.</p>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->

            <!--</div>-->
            <!--<div class="col-md-4 col-md-pull-8">-->
                <!--<div class="list-group">-->
                    <!--<a href="#" class="list-group-item active">-->
                        <!--<h4 class="list-group-item-heading">List group item heading</h4>-->

                        <!--<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Fusce dapibus,-->
                            <!--tellus ac cursus commodo, tortor </p>-->
                    <!--</a>-->
                    <!--<a href="#" class="list-group-item">-->
                        <!--<h4 class="list-group-item-heading">List group item heading</h4>-->

                        <!--<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Fusce dapibus,-->
                            <!--tellus ac cursus commodo, tortor </p>-->
                    <!--</a>-->
                    <!--<a href="#" class="list-group-item">-->
                        <!--<h4 class="list-group-item-heading">List group item heading</h4>-->

                        <!--<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Fusce dapibus,-->
                            <!--tellus ac cursus commodo, tortor </p>-->
                    <!--</a>-->
                    <!--<a href="#" class="list-group-item">-->
                        <!--<h4 class="list-group-item-heading">List group item heading</h4>-->

                        <!--<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Fusce dapibus,-->
                            <!--tellus ac cursus commodo, tortor </p>-->
                    <!--</a>-->

                <!--</div>-->


            <!--</div>-->
        <!--</div>-->
    <!--</div>-->
<!--</section>-->

<!--<section class="pricing" id="pricing">-->

    <!--<div class="container">-->
        <!--<div class="row">-->
            <!--<div class="col-md-12 pricing-intro">-->
                <!--<h2 class="page-headline large text-center">Tell your projects awesome story.</h2>-->

                <!--<p class="text-center">Tell your projects awesome story. Tell your projects awesome story. Tell your-->
                    <!--projects awesome story. Tell your projects awesome story.</p>-->
            <!--</div>-->
        <!--</div>-->
    <!--</div>-->


    <!--<div class="container">-->

        <!--<div class="row pricing-table">-->
            <!--<div class="col-md-4">-->
                <!--<div class="panel panel-danger">-->
                    <!--<div class="panel-heading"><h3 class="text-center">DEV PLAN</h3></div>-->
                    <!--<div class="panel-body text-center">-->
                        <!--<p class="lead" style="font-size:40px"><strong>$10 / month</strong></p>-->
                    <!--</div>-->
                    <!--<ul class="list-group list-group-flush text-center">-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>-->
                    <!--</ul>-->
                    <!--<div class="panel-footer">-->
                        <!--<a class="btn btn-lg btn-block btn-danger"-->
                           <!--href="https://creativemarket.com/artlabs/12114-Bootstrap-3.0.-pricing-tables-flat">BUY-->
                            <!--NOW!</a>-->
                    <!--</div>-->
                <!--</div>-->

            <!--</div>-->
            <!--<div class="col-md-4">-->
                <!--<div class="panel panel-info">-->
                    <!--<div class="panel-heading"><h3 class="text-center">PRO PLAN</h3></div>-->
                    <!--<div class="panel-body text-center">-->
                        <!--<p class="lead" style="font-size:40px"><strong>$10 / month</strong></p>-->
                    <!--</div>-->
                    <!--<ul class="list-group list-group-flush text-center">-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>-->
                    <!--</ul>-->
                    <!--<div class="panel-footer">-->
                        <!--<a class="btn btn-lg btn-block btn-info"-->
                           <!--href="https://creativemarket.com/artlabs/12114-Bootstrap-3.0.-pricing-tables-flat">BUY-->
                            <!--NOW!</a>-->
                    <!--</div>-->
                <!--</div>-->

            <!--</div>-->
            <!--<div class="col-md-4">-->
                <!--<div class="panel panel-success">-->
                    <!--<div class="panel-heading"><h3 class="text-center">FREE PLAN</h3></div>-->
                    <!--<div class="panel-body text-center">-->
                        <!--<p class="lead" style="font-size:40px"><strong>$10 / month</strong></p>-->
                    <!--</div>-->
                    <!--<ul class="list-group list-group-flush text-center">-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>-->
                        <!--<li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>-->
                    <!--</ul>-->
                    <!--<div class="panel-footer">-->
                        <!--<a class="btn btn-lg btn-block btn-success"-->
                           <!--href="https://creativemarket.com/artlabs/12114-Bootstrap-3.0.-pricing-tables-flat">BUY-->
                            <!--NOW!</a>-->
                    <!--</div>-->
                <!--</div>-->

            <!--</div>-->
        <!--</div>-->
    <!--</div>-->


<!--</section>-->
<!--<section class="gray">-->
    <!--<div class="container">-->
        <!--<div class="row">-->
            <!--<div class="col-md-12">-->
                <!--<h3 class="text-center">Tell your projects awesome story.</h3>-->
            <!--</div>-->
        <!--</div>-->
    <!--</div>-->
<!--</section>-->
<!--<section class="about" id="clients">-->
    <!--<div class="dmask">-->

        <!--<div class="our-clients">-->
            <!--<div class="container">-->
                <!--<div class="row">-->
                    <!--<div class="client" style="background-position: 50% 27px;">-->
                        <!--<div class="client-logo">-->
                            <!--<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">-->
                                <!--<div class="clients-title">-->
                                    <!--<h3 class="title">Our <span>Clients</span></h3>-->

                                    <!--<div class="carousel-controls pull-right">-->
                                        <!--<a data-slide="prev" href="#client-carousel" class="prev btn-mini"><i-->
                                                <!--class="icon-angle-left"></i></a>-->
                                        <!--<a data-slide="next" href="#client-carousel" class="next btn-mini"><i-->
                                                <!--class="icon-angle-right"></i></a>-->

                                        <!--<div class="clearfix"></div>-->
                                    <!--</div>-->
                                <!--</div>-->
                                <!--<div class="clearfix"></div>-->
                                <!--<div class="row">-->
                                    <!--<div class="client-carousel slide" id="client-carousel">-->
                                        <!--<div class="carousel-inner">-->
                                            <!--<div class="item active">-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d1 animate_start">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="img/logo-1.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d2 animate_start">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="img/logo-2.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d3 animate_start">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="../img/logo-3.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d4 animate_start">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="../img/logo-4.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                            <!--</div>-->
                                            <!--<div class="item">-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="../img/logo-5.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="../img/logo-4.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="../img/logo-3.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                                <!--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">-->
                                                    <!--<div class="item-inner"><a style="cursor: pointer;"><img-->
                                                            <!--src="../img/logo-2.png" alt="Upportdash"></a></div>-->
                                                <!--</div>-->
                                            <!--</div>-->
                                        <!--</div>-->
                                    <!--</div>-->
                                <!--</div>-->
                            <!--</div>-->
                            <!--<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">-->
                                <!--<!-- Testimonials Widget Start -->-->
                                <!--<div class="row ">-->
                                    <!--<div class="testimonials widget">-->
                                        <!--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
                                            <!--<div class="testimonials-title">-->
                                                <!--<h3 class="title">Client <span>Testimonials</span></h3>-->

                                                <!--<div class="carousel-controls pull-right">-->
                                                    <!--<a data-slide="prev" href="#testimonials-carousel"-->
                                                       <!--class="prev btn-mini"><i class="icon-angle-left"></i></a>-->
                                                    <!--<a data-slide="next" href="#testimonials-carousel"-->
                                                       <!--class="next btn-mini"><i class="icon-angle-right"></i></a>-->

                                                    <!--<div class="clearfix"></div>-->
                                                <!--</div>-->
                                            <!--</div>-->
                                        <!--</div>-->
                                        <!--<div class="clearfix"></div>-->
                                        <!--<div class="testimonials-carousel slide animate_afr d5 animate_start"-->
                                             <!--id="testimonials-carousel">-->
                                            <!--<div class="carousel-inner">-->
                                                <!--<div class="item">-->
                                                    <!--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
                                                        <!--<div class="testimonial item">-->
                                                            <!--<p>-->
                                                                <!--Lorem Ipsum is simply dummy text of the printing and-->
                                                                <!--typesetting industry. Lorem Ipsum has been the-->
                                                                <!--industry's standard dummy text ever since the 1500s,-->
                                                                <!--when an unknown printer took a galley of type.-->
                                                            <!--</p>-->

                                                            <!--<div class="testimonials-arrow">-->
                                                            <!--</div>-->
                                                            <!--<div class="author">-->
                                                                <!--<div class="testimonial-image "><img-->
                                                                        <!--src="../img/team-member-1.jpg" alt=""></div>-->
                                                                <!--<div class="testimonial-author-info">-->
                                                                    <!--<a style="cursor: pointer;">Monica Sing/a> Template-->
                                                                        <!--Eden-->
                                                                <!--</div>-->
                                                            <!--</div>-->
                                                        <!--</div>-->
                                                    <!--</div>-->
                                                <!--</div>-->
                                                <!--<div class="item active">-->
                                                    <!--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
                                                        <!--<div class="testimonial item">-->
                                                            <!--<p>-->
                                                                <!--Lorem Ipsum is simply dummy text of the printing and-->
                                                                <!--typesetting industry. Lorem Ipsum has been the-->
                                                                <!--industry's standard dummy text ever since the 1500s,-->
                                                                <!--when an unknown printer took a galley of type.-->
                                                            <!--</p>-->

                                                            <!--<div class="testimonials-arrow">-->
                                                            <!--</div>-->
                                                            <!--<div class="author">-->
                                                                <!--<div class="testimonial-image "><img-->
                                                                        <!--src="../img/team-member-2.jpg" alt=""></div>-->
                                                                <!--<div class="testimonial-author-info">-->
                                                                    <!--<a href="#">John Doe</a> Template Eden-->
                                                                <!--</div>-->
                                                            <!--</div>-->
                                                        <!--</div>-->
                                                    <!--</div>-->
                                                <!--</div>-->
                                                <!--<div class="item">-->
                                                    <!--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
                                                        <!--<div class="testimonial item">-->
                                                            <!--<p>-->
                                                                <!--Lorem Ipsum is simply dummy text of the printing and-->
                                                                <!--typesetting industry. Lorem Ipsum has been the-->
                                                                <!--industry's standard dummy text ever since the 1500s,-->
                                                                <!--when an unknown printer took a galley of type.-->
                                                            <!--</p>-->

                                                            <!--<div class="testimonials-arrow">-->
                                                            <!--</div>-->
                                                            <!--<div class="author">-->
                                                                <!--<div class="testimonial-image "><img-->
                                                                        <!--src="../img/team-member-3.jpg" alt=""></div>-->
                                                                <!--<div class="testimonial-author-info">-->
                                                                    <!--<a style="cursor: pointer;">Carol Johansen</a>-->
                                                                    <!--Template Eden-->
                                                                <!--</div>-->
                                                            <!--</div>-->
                                                        <!--</div>-->
                                                    <!--</div>-->
                                                <!--</div>-->
                                            <!--</div>-->
                                        <!--</div>-->
                                    <!--</div>-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</div>-->
        <!--</div>-->

    <!--</div>-->
<!--</section>-->

<!--<section class="contact" id="contact">-->

    <!--<div class="container">-->

        <!--<div class="row">-->

            <!--<div class="col-md-6">-->

                <!--<div class="alert alert-success hidden" id="contactSuccess">-->
                    <!--<strong>Success!</strong> Your message has been sent to us.-->
                <!--</div>-->

                <!--<div class="alert alert-error hidden" id="contactError">-->
                    <!--<strong>Error!</strong> There was an error sending your message.-->
                <!--</div>-->

                <!--<h2 class="short"><strong>Contact</strong> Us</h2>-->

                <!--<form class="clearfix" accept-charset="utf-8" method="get" action="#">-->
                    <!--<div class="row">-->
                        <!--<div class="col-sm-6 form-group">-->
                            <!--<label for="name">Name</label>-->
                            <!--<input type="text" placeholder="" value="" name="name" id="name"-->
                                   <!--class="form-control input-lg">-->
                        <!--</div>-->

                        <!--<div class="col-sm-6 form-group">-->
                            <!--<label for="email">Email Address</label>-->
                            <!--<input type="email" placeholder="" value="" name="email" id="email"-->
                                   <!--class="form-control input-lg">-->
                        <!--</div>-->
                    <!--</div>-->
                    <!--<div class="row">-->
                        <!--<div class="col-sm-12 form-group">-->
                            <!--<label for="message">Message</label>-->
                            <!--<textarea rows="4" name="message" id="message" class="form-control"></textarea>-->
                        <!--</div>-->
                    <!--</div>-->

                    <!--<button class="btn btn-success btn-xlg" type="submit">Send Message</button>-->
                <!--</form>-->
            <!--</div>-->
            <!--<div class="col-md-offset-1 col-md-5">-->
                <!--<br/>-->
                <!--<h4 class="pull-top">Get in <strong>touch</strong></h4>-->

                <!--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget leo at velit imperdiet-->
                    <!--varius. In eu ipsum vitae velit congue iaculis vitae at risus.</p>-->

                <!--<hr>-->

                <!--<h4>The <strong>Office</strong></h4>-->
                <!--<ul class="unstyled">-->
                    <!--<li><i class="icon-map-marker"></i> <strong>Address:</strong> 1234 Street Name, City Name, United-->
                        <!--States-->
                    <!--</li>-->
                    <!--<li><i class="icon-phone"></i> <strong>Phone:</strong> (123) 456-7890</li>-->
                    <!--<li><i class="icon-envelope"></i> <strong>Email:</strong> <a href="mailto:mail@example.com">mail@example.com</a>-->
                    <!--</li>-->
                <!--</ul>-->


            <!--</div>-->


        <!--</div>-->

    <!--</div>-->

<!--</section>-->

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="footer-ribbon" style="right: 0">
                <h3 class="title" style="margin: 0;padding: 5px 10px">Thank <span>You</span></h3>
            </div>

        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a class="logo" href="index.html">
                        <img src="img/expose-logo.png" alt="Template Eden">
                    </a>
                </div>
                <div class="col-md-5">
                    <p>&copy; Copyright 2015 by NKCS-XSY All Rights Reserved.</p>
                </div>
                <div class="col-md-5">
                    <nav id="footer-menu">
                        <ul>
                            <li><a href="#">首页</a></li>
                            <li><a href="#">登录</a></li>
                            <li><a href="#">联系我们</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- REQUIRED BOOTSTRAP SCRIPTS -->
<script src="bootstrap/js/bootstrap.js"></script>

<script src="js/jquery.mb.YTPlayer.js"></script>
<!-- SCROLLING SCRIPTS PLUGIN  -->
<script src="js/jquery.easing.min.js"></script>
<!-- CUSTOM SCRIPTS   -->
<script src="js/custom.js"></script>
</body>
</html>
