<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>团队信息</title>
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
                    url: '/team/getAll', //请求后台的URL（*）
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
                    },{
                        field: 'teamName',
                        title: '团队名称',
                        width:150
                    }, {
                        field: 'capName',
                        title: '队长名称',
                        width:150
                    }, {
                        field: 'capTel',
                        title: '联系方式',
                        width:150
                    },{
                        field: 'teaName',
                        title: '指导老师',
                        width:150
                    },{
                        field: 'introduce',
                        title: '简介',
                        width:300
                    },{
                        field: 'status',
                        title: '状态',
                        width:120,
                        formatter:stateFormatter
                    },{
                        title:'操作',
                        width:120,
                        formatter:delFormatter

                    }]
                });
            };

            return oTableInit;
        };

        function stateFormatter(value,row,index){
            if(value==1){
                return '<a onclick="info(\''+row.stuNumber+'\')">正常</a>';
            }else if(value==0){
                return '<a onclick="info('+row.stuNumber+')">异常</a>';
            }else{
                return ''
            }
        }
        function delFormatter(value,row,index) {
            return '<button type="button" class="btn btn-primary btn-sm" onclick="updateTeam(\''+row.teamName+'\')">修改</button>';

        }
        
        function updateTeam(teamName) {
            var name = encodeURI(encodeURI(teamName));
           window.location.href = "../team/toTeamUp?teamName="+name;
            // alert(name);
        }
        
        function btn_ok() {
            $("#fok").click();
        }
        function show_confirm()
        {
            var r=confirm("确认删除？");
            if (r==true)
            {
               del()
            }
            else
            {

            }
        }
        function del() {
            var arr = $.map($("#tb_departments").bootstrapTable('getSelections'),function (row) {
                return row.teamName;
            });
            var teamNames= ","+arr;
            // alert(teamNames)
            $.ajax({
                url : "/team/delTeam",
                type : "POST",
                dataType : "json",
                data : {
                    teamName:teamNames
                },
                success : function(result1) {
                    if (result1.result==1){
                        alert("删除成功");
                        window.location.href = "/team/toTeamInfo";
                    }else{
                        alert("删除失败");
                    }
                },
                error : function(result) {
                    alert("删除失败，请检查网络！");
                }
            });
        }
    </script>
</head>
<body>
<div class="panel-body" style="padding-bottom:0px;">
    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default " data-toggle="modal" data-target="#myModal">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_delete" type="button" class="btn btn-default" onclick="show_confirm()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table id="tb_departments"></table>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" method="post" action="/team/inTeam">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">团队名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="teamName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">队长名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="capName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="capTel" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">指导老师</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="teaName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">简介</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="introduce" />
                            </div>
                        </div>
                        <input type="submit" id="fok" style="display: none" value="提交">
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="btn_ok()">提交更改</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
</div>
</body>
</html>
