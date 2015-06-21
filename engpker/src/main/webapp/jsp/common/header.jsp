<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>

<header>
    <div class="container">
        <div class="row">
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
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"> --%>
<!-- 								<div id="login-info-user"> -->
									
<%-- 									<a href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a> --%>
<!-- 									<span>|</span> -->
<!-- 									<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a> -->
<!-- 								</div> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<a class="btn btn-primary" href="user-register">用户注册</a> -->
<!-- 								<a class="btn btn-success" href="user-login-page">登录</a> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
				</div>
            </div>
        </div>
    </div>
</header>