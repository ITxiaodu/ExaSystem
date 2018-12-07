<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/11/8
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8"%>
<html>
<head>
    <title>修改</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width"/>
    <!-- 引入bootstrap样式 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入bootstrap-table样式 -->
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
        function re() {
            window.location.href = "../team/toTeamInfo";
        }
        function update() {
            $("#fok").click();
        }
    </script>
</head>
<body>
<div style="width: 100%;margin: 0 auto;margin-top: 30px">
    <h3 style="margin-left: 30px">信息修改</h3>
    <c:forEach items="${requestScope.list}" var="row">
    <form class="form-horizontal" role="form" method="post" action="/team/update">
        <div class="form-group">
            <label class="col-sm-2 control-label">团队名称</label>
            <div class="col-sm-10">
                <input type="text" name="teamName" style="display: none" value="${row.teamName}"/>
                <input type="text" class="form-control" name="teamName_dis" style="width: 60%" disabled="disabled" value="${row.teamName}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">队长名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="capName" style="width: 60%" value="${row.capName}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="capTel" style="width: 60%" value="${row.capTel}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">指导老师</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="teaName" style="width: 60%" value="${row.teaName}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">简介</label>
            <div class="col-sm-10">
                <textarea type="text" rows="3" class="form-control" name="introduce" style="width: 60%">${row.introduce}</textarea>
            </div>
        </div>
        <input type="submit" id="fok" style="display: none" value="提交">
    </form>
    <button type="button" class="btn btn-primary btn-default" style="float: right;margin-right: 33%" onclick="update()">修改</button>
    <button type="button" class="btn btn-primary btn-default" style="float: right;margin-right: 20px;" onclick="re()">返回</button>
    </c:forEach>
</div>
</body>
</html>
