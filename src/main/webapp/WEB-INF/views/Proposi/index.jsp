<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>命题管理</title>
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
        function info(id) {
            window.location.href = "../pro/toProInfo?id="+id;
        }
        function add() {
            window.location.href = "../pro/toProInfo";
        }
    </script>
</head>
<body>
<div class="btn-group" style="margin-top: 20px;margin-left: 20px">
    <button class="btn btn-default" type="button" onclick="add()"><em class="glyphicon glyphicon-plus"></em> 添加</button>
    <%--<button class="btn btn-default" type="button"><em class="glyphicon glyphicon-align-center"></em> 中</button>--%>
</div>
<div class="col-md-12 column" style="margin-top: 30px">
    <c:forEach items="${requestScope.list}" var="row">
    <div class="panel panel-danger" style="margin-top: -20px" onclick="info(${row.id})">
        <div class="panel-body">
            <dl class="dl-horizontal">
                <dt>题目名称</dt>
                <dd>${row.proName}</dd>
                <dt>题目内容</dt>
                <dd>${row.content}</dd>
                <dt>分值</dt>
                <dd>${row.score}</dd>
                <dt>期限</dt>
                <dd>${row.time}</dd>
                <dt>题目要求</dt>
                <dd>${row.proRequ}</dd>
                <dt>其他要求</dt>
                <dd>${row.othRequ}</dd>
                <dt>是否发布</dt>
                <dd>
                    <c:if test="${row.state==1}">
                        <button type="button" class="btn btn-primary disabled btn-xs">已发布</button>
                    </c:if>
                    <c:if test="${row.state!=1}">
                        <button type="button" class="btn disabled btn-xs btn-warning">未发布</button>
                    </c:if>
                </dd>
            </dl>
        </div>
    </div>
    </c:forEach>
</div>
</body>
</html>
