<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8" %>

<html>
<head>
    <title>详细信息</title>
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
        function qxfb(id) {
            window.location.href = "../pro/upSt?type=qxfb&id=" + id;
        }

        function fb(id) {
            window.location.href = "../pro/upSt?type=fb&id=" + id;
        }

        function re() {
            window.location.href = "../pro/getAll";
        }

        function ok() {
            $("#fok").click();
        }
        function del(id) {
            window.location.href = "../pro/del?id="+id;
        }
    </script>
<body>
<div style="margin-top: 20px">
    <c:if test="${requestScope.info==null}">
    <ul class="breadcrumb">
        <li>
            <a href="../pro/getAll">主页</a>
        </li>
        <li class="active">
            添加
        </li>
    </ul>
    <form class="form-horizontal" role="form" method="post" action="/pro/add">
        </c:if>
        <c:if test="${requestScope.info!=null}">
        <ul class="breadcrumb">
            <li>
                <a href="../pro/getAll">主页</a>
            </li>
            <li class="active">
                修改
            </li>
        </ul>
        <form class="form-horizontal" role="form" method="post" action="/pro/upAll">
            </c:if>
            <c:if test="${requestScope.info!=null}">
                <input type="text" class="form-control" name="id" style="display: none;"
                       value="${requestScope.info.id}"/>
            </c:if>
            <div class="form-group">
                <label class="col-sm-2 control-label">题目名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="proName" style="width: 60%"
                           value="${requestScope.info.proName}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">题目内容</label>
                <div class="col-sm-10">
                    <textarea type="text" class="form-control" rows="4" name="content"
                              style="width: 60%">${requestScope.info.content}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">分值</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="score" style="width: 60%"
                           value="${requestScope.info.score}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">期限</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="time" style="width: 60%"
                           value="${requestScope.info.time}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">题目要求</label>
                <div class="col-sm-10">
                    <textarea type="text" class="form-control" name="proRequ" rows="3"
                              style="width: 60%">${requestScope.info.proRequ}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">其他要求</label>
                <div class="col-sm-10">
                    <textarea type="text" class="form-control" name="othRequ" rows="3"
                              style="width: 60%">${requestScope.info.othRequ}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">是否发布</label>
                <div class="col-sm-10">
                    <c:if test="${requestScope.info.state==1}">
                        <button type="button" class="btn btn-primary btn-sm" onclick="qxfb(${requestScope.info.id})">
                            取消发布
                        </button>
                    </c:if>
                    <c:if test="${requestScope.info.state==0}">
                        <button type="button" class="btn btn-primary btn-sm" onclick="fb(${requestScope.info.id})">发布
                        </button>
                    </c:if>
                </div>
            </div>

            <input type="submit" id="fok" style="display: none" value="提交">
        </form>
        <button type="button" class="btn btn-primary btn-default" style="float: right;margin-right: 33%" onclick="ok()">
            确定
        </button>
        <button type="button" class="btn btn-primary btn-default" style="float: right;margin-right: 20px;"
                onclick="re()">返回
        </button>
        <c:if test="${requestScope.info!=null}">
        <button type="button" class="btn btn-danger btn-default" style="float: right;margin-right: 20px" onclick="del(${requestScope.info.id})">删除</button>
        </c:if>
</div>


</body>
</html>
