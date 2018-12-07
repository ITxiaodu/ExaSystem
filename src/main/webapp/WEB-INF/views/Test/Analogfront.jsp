<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="${pageContext.request.contextPath}/proExa/re" enctype="multipart/form-data" method="post">
    <input id="up" type="file" name="file" >
    <input id="sub_btn" type="submit" value="上传" style="">
</form>
</body>
</html>
