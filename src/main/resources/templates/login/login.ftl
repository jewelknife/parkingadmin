
<html xmlns:th="http://www.thymeleaf.org">
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.0.2
Version: 1.5.4
Author: KeenThemes
Website: http://www.keenthemes.com/
PurequestContexthase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<#assign contextpath="${rc.contextPath}"/>
<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="MobileOptimized" content="320">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${contextpath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="${contextpath}/assets/plugins/select2/select2_metro.css" />
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="${contextpath}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="${contextpath}/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
    <link href="${contextpath}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
    <img srequestContext="${contextpath}/assets/img/logo-big.png" alt="" />
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form"  method="post">
        <h3 class="form-title">请登录</h3>
        <div class="alert alert-danger display-hide">
            <button class="close" data-close="alert"></button>
            <span>请输入用户名和密码.</span>
        </div>
        <p th:if="${param.logout}" class="alert">You have been logged out</p>
        <p th:if="${param.error}" class="alert alert-error">There was an error, please try again</p>
        <#--<#if errorMsg?? >-->
        <#--<div class="alert alert-danger">-->
            <#--<button class="close" data-close="alert"></button>-->
            <#--<span> ${errorMsg}</span>-->
        <#--</div>-->
        <#--</#if>-->
    <#--<#if param?? && param.logout?? >-->
        <#--<p class="alert">You have been logged out</p>-->
    <#--</#if>-->
    <#--<#if param?? && param.error?? >-->
        <#--<p class="alert alert-error">There was an error, please try again</p>-->
    <#--</#if>-->
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">用户名</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
            </div>
        </div>
        <div class="form-actions">
            <label class="checkbox pull-left">
                <input type="checkbox" name="remember" value="1"/> 记住我
            </label>
            <button type="submit" class="btn blue pull-right">
                登陆 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    2015 &copy; Parking Admin Demo.
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script srequestContext="${contextpath}/assets/plugins/respond.min.js"></script>
<script srequestContext="${contextpath}/assets/plugins/excanvas.min.js"></script>
<![endif]-->
<script srequestContext="${contextpath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
<script srequestContext="${contextpath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script srequestContext="${contextpath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<script type="text/javascript" srequestContext="${contextpath}/assets/plugins/select2/select2.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script srequestContext="${contextpath}/assets/scripts/app.js" type="text/javascript"></script>
<script srequestContext="${contextpath}/assets/scripts/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        App.init();
        Login.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>