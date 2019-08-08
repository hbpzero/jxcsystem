<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/1
  Time: 9:47
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
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">
    </tbody>
</table>
<div style="position: fixed; bottom: 20px;">
    当前是第<span id="currPage"></span>页，共<span id="totalpage"></span>页，
    <button id="prevPage">上一页</button><button id="nextPage">下一页</button>
    每页<select id="pageSize">
    <option value="5">5</option>
    <option value="2">2</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
</select>条
</div>

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
        query(1,5);

    })
    var dataPage;
    function query(pages,pageSize){
        $.ajax({
            url: "pur/queryApply",
            type: "post",
            data: {"point":2,"pageNum":pages,"pageSize":pageSize},
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#mytbd").html("");
                dataPage=data;
                var info=data.list;
                for (var i=0;i<info.length;i++){
                    var tr="<tr>"

                    var day=info[i].purtoTime.substring(0,10)
                    tr+="<td>"+info[i].purtoNo+"</td>"
                    tr+="<td>"+day+"</td>"
                    tr+="<td>"+info[i].purtoAppMan+"</td>"
                    tr+="<td>"+info[i].purtoAppDep+"</td>"
                    tr+="<td>"+info[i].purtoPrices+"元</td>"
                    tr+="<td>"+info[i].purtoAuResult+"</td>"
                    tr+="<td> <button class=\"btn btn-primary btn-lg detail\" data-toggle=\"modal\" data-target=\"#myModal\" >详情 </button><button class=\"btn btn-primary btn-lg confirm\" data-toggle=\"modal\"  >确认调拨 </button></td>"
                    tr+="</tr>"
                    $("#mytbd").append(tr)

                }
                $("#currPage").html(data.pageNum);
                $("#totalpage").html(data.pages);
                if(data.isFirstPage){
                    $("#prevPage").hide();
                }else{
                    $("#prevPage").show();
                }
                if(data.isLastPage){
                    $("#nextPage").hide();
                }else{
                    $("#nextPage").show();
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

    $("#mytbd").on("click",".confirm",function () {
        var id=$(this).parent().parent().find("td").eq(0).text()
        if(confirm("请确认采购货物已经送达，是否确认到货")) {
            if(confirm("确认后将扣取金额，请再次确认")){
                $.ajax({
                    url: "pur/apply",
                    type: "post",
                    data: {"result": 2, "purtoNo": id},
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
    })
    $("#nextPage").click(function(){
        //将下一页的页码传到服务器
        query(dataPage.nextPage,$("#pageSize").val());
    })
    $("#prevPage").click(function(){
        //将上一页的页码传到服务器
        query(dataPage.prePage,$("#pageSize").val());
    })

    $("#pageSize").change(function(){
        query(dataPage.pageNum,$("#pageSize").val());

    })


</script>
</html>
