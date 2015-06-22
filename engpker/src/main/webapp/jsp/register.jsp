<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login Page 2 | Creative - Bootstrap 3 Responsive Admin Template</title>

    <!-- Bootstrap ../css -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <!--external ../css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style-1.css" rel="stylesheet">
    <link href="css/style-responsive-1.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-img3-body">

<div class="container">

    <form class="login-form" action="/engpker/RegisterServlet">
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock-open_alt"></i></p>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_mail_alt"></i></span>
                <input type="text" name="username" id="username" class="form-control" placeholder="手机/邮箱" autofocus>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" name="password" id="password" class="form-control" placeholder="密码">
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_check_alt"></i></span>
                <input type="password" name="user_pwd1" id="user_pwd1" class="form-control" placeholder="确认密码">
            </div>
            <div class="form-group">
                <label class="checkbox text-right"><input type="checkbox"><span>阅读并接受《用户协议》</span></label>
            </div>
            <button class="btn btn-primary btn-lg btn-block" type="submit" name="submit" id="submit">提交</button>
             </div>
           <p>
           
            <a href="/engpker/jsp/login.jsp">已有账号？</a>
           </p>
    </form>


</div>


</body>
</html>
