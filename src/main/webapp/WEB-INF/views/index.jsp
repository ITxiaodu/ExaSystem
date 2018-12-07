<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>考试平台管理系统</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--link rel="shortcut icon" href="favicon.ico"-->
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="/css/index/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/index/animate.css" rel="stylesheet">
    <link href="/css/index/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id ="header" style="padding-left:30px;height:75px;width:auto;background-color:#2f4050">
    <p style="padding-top:15px;font-size:25px;color:white;font-family:'黑体'">考试平台管理系统</p>
    <p style="padding-top:5px;font-size:18px;color:white;font-family:'黑体';margin-top:-20px">Examination platform management system</p>
</div>
<!--主体-->

<div id="wrapper">
    <!--div class="dashbard-1" id="title">
        <img src="img/title.png">
    </div-->
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i></div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">&nbsp;</span>
                </li>
                <li>

                <li>
                    <a href="#"><i class="fa fa-folder"></i><span class="nav-label">学生管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/stu/to">学生信息</a></li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/stu/toFeedBack">学生反馈</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-folder"></i><span class="nav-label">团队管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/team/toTeamInfo">团队信息</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-folder"></i> <span class="nav-label">命题管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/pro/getAll">命题信息</a></li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/pro/toProInfo">添加题目</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-folder"></i> <span class="nav-label">作品审核</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/proExa/toExa">学生作品审核</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" src="" width="100%" height="100%" frameborder="0" data-id=" seamless"></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--内容
    <div1 id="content">

    </div1>-->
</div>

<!-- 全局js -->
<script src="/js/jquery/jquery-3.1.1.min.js?v=2.1.4"></script>

<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="/js/index/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/index/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/js/index/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="/js/index/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="/js/index/index.js"></script>

</body>

</html>
