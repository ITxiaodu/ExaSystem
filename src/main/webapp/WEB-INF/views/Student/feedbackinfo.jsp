<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8"%>

<html>
<head>
    <title>学生信息</title>
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
            window.location.href = "${pageContext.request.contextPath}/stu/goBack";
        }
        function reply() {
            if($("#reply").val()==""||$("#reply").val()==null){
                alert("您的回复为空！")
            }else {
                $("#fok").click();
            }

        }
    </script>
</head>
<body>

<div style="width: 100%;margin: 0 auto;margin-top: 30px">
    <c:forEach items="${requestScope.list}" var="row">
    <form class="form-horizontal" role="form" method="post" action="/stu/reply">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <label class="col-sm-2 control-label">${row.stuNumber}</label>
                <input type="text" class="form-control" name="id" style="width: 60%;display: none;" value="${row.id}" />
                <input type="text" class="form-control" name="stuNumber" style="width: 60%;display: none;" value="${row.stuNumber}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">真实姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="realName" style="width: 60%" value="${row.realName}" disabled="disabled" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">内容</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" name="content" rows="5" style="width: 60%" disabled="disabled">${row.content}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">回复</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" id="reply" name="reply" rows="5" style="width: 60%">${row.reply}</textarea>
            </div>
        </div>
        <input type="submit" id="fok" style="display: none" value="提交">
    </form>
        <button type="button" class="btn btn-primary btn-default" style="float: right;margin-right: 33%" onclick="reply()">回复</button>
        <button type="button" class="btn btn-primary btn-default" style="float: right;margin-right: 20px;" onclick="re()">返回</button>
    </c:forEach>
</div>


</body>
</html>
