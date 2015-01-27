<!DOCTYPE html>
<html lang="en">
<#--<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />-->
<#assign sec=JspTaglibs["/WEB-INF/security.tld"] />
<#assign contextpath="${rc.contextPath}" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ParkingAdmin</title>

    <link href="${contextpath}/js/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextpath}/js/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <link href="${contextpath}/css/timeline.css" rel="stylesheet">
    <link href="${contextpath}/css/gg-common.css" rel="stylesheet">
    <link href="${contextpath}/js/morrisjs/morris.css" rel="stylesheet">
    <link href="${contextpath}/js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.ftl">停车系统</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <@sec.authentication property="principal.username" /> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../login.ftl"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="../index.ftl"><i class="fa fa-dashboard fa-fw"></i> 首页</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 收费统计<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">统计信息</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 区域信息<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">实时信息</a>
                                </li>
                                <li>
                                    <a href="#">设备状态</a>
                                </li>
                                <#--<li>-->
                                    <#--<a href="#">三级菜单 <span class="fa arrow"></span></a>-->
                                    <#--<ul class="nav nav-third-level">-->
                                        <#--<li>-->
                                            <#--<a href="#">三级菜单 Item</a>-->
                                        <#--</li>-->
                                        <#--<li>-->
                                            <#--<a href="#">三级菜单 Item</a>-->
                                        <#--</li>-->
                                        <#--<li>-->
                                            <#--<a href="#">三级菜单 Item</a>-->
                                        <#--</li>-->
                                    <#--</ul>-->
                                    <#--<!-- /.nav-third-level &ndash;&gt;-->
                                <#--</li>-->
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 管理设置<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">区域管理</a>
                                </li>
                                <li>
                                    <a href="#">用户管理</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>