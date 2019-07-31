<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/31
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <base href="http://localhost:8080/jxcsystem/">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<table class="table">
    <caption></caption>
    <thead>
    <tr>
        <th>流水号</th>
        <th>申请日期</th>
        <th>申请人</th>
        <th>申请部门</th>
        <th>总价</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">
    </tbody>
</table>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    订单详情
                </h4>
            </div>
            <div class="modal-body" >
                <table class="table">
                    <caption></caption>
                    <thead>
                    <tr>
                        <th>商品名称</th>
                        <th>采购数量</th>
                        <th>小计</th>

                    </tr>
                    </thead>
                    <tbody id="detaillist">
                    </tbody>
                </table>
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
<script>
    $(function () {
        query();

    })
    function query(){
        $.ajax({
            url: "pur/queryApply",
            type: "post",
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#mytbd").html("");
                for (var i=0;i<data.length;i++){
                    var tr="<tr>"

                    var day=data[i].purtoTime.substring(0,10)
                    tr+="<td>"+data[i].purtoNo+"</td>"
                    tr+="<td>"+day+"</td>"
                    tr+="<td>"+data[i].purtoAppMan+"</td>"
                    tr+="<td>"+data[i].purtoAppDep+"</td>"
                    tr+="<td>"+data[i].purtoPrices+"元</td>"
                    tr+="<td> <button type=\"button\" class=\"layui-btn layui-btn-normal\" onclick=\"apply(1,this)\"> 同意采购 </button> <button type=\"button\" class=\"layui-btn layui-btn-danger\" onclick=\"apply(0,this)\">拒绝采购 </button><button class=\"btn btn-primary btn-lg detail\" data-toggle=\"modal\" data-target=\"#myModal\" >详情 </button></td>"
                    tr+="</tr>"
                    $("#mytbd").append(tr)

                }


            }
        })


    }
    $("#mytbd").on("click",".detail",function () {
        var id=$(this).parent().parent().find("td").eq(0).text()
        $.ajax({
            url: "pur/queryDetail",
            type: "post",
            data: {"purtoNo":id},
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#detaillist").html("");
                for (var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].goodsName+"</td>"
                    tr+="<td>"+data[i].purdeNum+"</td>"
                    tr+="<td>"+data[i].purdeSub+"元</td>"
                    tr+="</tr>"
                    $("#detaillist").append(tr)

                }
            }
        })


    })
    function apply(val,position) {
        var id=$(position).parent().parent().find("td").eq(0).text();
        if(confirm("确认提交审核结果？提交后不可修改")){
            $.ajax({
                url: "pur/apply",
                type: "post",
                data: {"result":val,"purtoNo":id},
                dataType: "text",
                success: function (data) {
                    if (data=="true"){
                        alert("提交成功")
                        query()
                    }
                }
            })
        }


    }
</script>
</html>
