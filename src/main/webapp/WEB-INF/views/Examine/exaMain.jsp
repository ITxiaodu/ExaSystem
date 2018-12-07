<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/11/17
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <style type="text/css">
        table{
            table-layout:fixed;
        }
        .table tbody tr td{
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //初始化table
            var oTable = new TableInit();
            oTable.Init();
        });

        var TableInit = function () {
            var oTableInit = new Object();
            //初始化Table
            oTableInit.Init = function () {
                $('#tb_departments').bootstrapTable({
                    url: '/proExa/pExa', //请求后台的URL（*）
                    method: 'post', //请求方式（*）
                    contentType: "application/x-www-form-urlencoded",
                    toolbar: '#toolbar', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: true, //是否显示分页（*）
                    sortable: false, //是否启用排序
                    sortOrder: "asc", //排序方式
                    queryParamsType: '', //传递参数（*）
                    sidePagination: 'server', //分页方式：client客户端分页，server服务端分页（*）
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    pageSize: 10, //每页的记录行数（*）
                    pageList: [5,10, 25, 50, 100], //可供选择的每页的行数（*）
                    search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    strictSearch: true,
                    showColumns: true, //是否显示所有的列
                    showRefresh: true, //是否显示刷新按钮
                    minimumCountColumns: 2, //最少允许的列数
                    clickToSelect: true, //是否启用点击选中行
                    height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                    uniqueId: "ID", //每一行的唯一标识，一般为主键列
                    showToggle: true, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    detailView: false, //是否显示父子表
                    columns: [{
                        checkbox: true
                    }, {
                        field: 'id',
                        title: 'ID',
                        visible:false
                    },{
                        field: 'proName',
                        title: '题目',

                    },{
                        field: 'teamName',
                        title: '团队名称',

                    }, {
                        field: 'fileName',
                        title: '文件名称',

                    }, {
                        field: 'path',
                        title: '存储位置',
                        visible:false
                    },{
                        field: 'time',
                        title: '时间',
                    },{
                        field: 'state',
                        title: '操作',

                        formatter:stateFormatter
                    }]
                });
            };

            return oTableInit;
        };

        function stateFormatter(value,row,index){
            if(value==1){
                return '<a onclick="down(\''+row.fileName+'\',\''+row.teamName+'\')">下载</a>';
            }else if(value==0){
                return '<a onclick="info('+row.id+')">未读</a>';
            }else{
                return ''
            }
        }
        function info(id) {
            alert(id);
        }
        function down(fileName,teamName) {
            var file = encodeURI(encodeURI(fileName));
            var team = encodeURI(encodeURI(teamName));
            // alert(file+":"+team);
            window.location.href = "/proExa/dl?fileName="+file+"&teamName="+team+"";
        }
    </script>
</head>
<body>
<table id="tb_departments"></table>
<a href="/proExa/toFront">上传测试</a>
</body>
</html>
