<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/1
  Time: 19:22
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
<!-- 已经采购完成的订单读取过来 -->
<div class="panel panel-default">

    <div class="panel-body">
        <table class="table">
            <thead>
            <th>入库单号</th>

            <th>操作人</th>
            <th>入库时间</th>
            <th>操作</th>
            <th>状态</th>
            </thead>
            <tbody id="mytbd"></tbody>
        </table>
    </div>
</div>
<hr/>
<div class="panel panel-default">
    <div class="panel-body">
        <form role="form" class="form-inline">

            <table  class="table">
                <thead>
                <tr>
                    <th>入库订单</th>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品类别</th>
                    <th>规格型号</th>
                    <th>计量单位</th>
                    <th>入库数量</th>
                    <th>入库仓库</th>
                </tr>
                </thead>
                <tbody id="mytbd3">


                </tbody>

            </table>

        </form>

    </div>
<button style="float:right" class="btn btn-primary btn-lg" disabled id="applyToWare" onclick="comfirm()">提交入库</button>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title titles" id="myModalLabel">
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
                        <th>实际数量</th>
                        <th>入库仓库</th>

                    </tr>
                    </thead>
                    <tbody id="detaillist">
                    </tbody>
                </table>
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary setContent" >
                    提交
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    var username="${user.userName}"
    var time = new Date();
    var day = ("0" + time.getDate()).slice(-2);
    var month = ("0" + (time.getMonth() + 1)).slice(-2);
    $(function () {
        query();

    })
    function query() {
        $.ajax({
            url: "putIn/queryApply",
            type: "post",
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#mytbd").html("");
                for (var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].puttoNo+"</td>"
                    tr+="<td>"+username+"</td>"
                    tr+="<td>"+time.getFullYear()+"-"+month+"-"+day+"</td>"
                    tr+="<td> <button class=\"btn btn-primary btn-lg detail\" data-toggle=\"modal\" data-target=\"#myModal\" >开始入库 </button></td>"
                    tr+="<td>待入库</td>"
                    tr+="</tr>"
                    $("#mytbd").append(tr)

                }


            }
        })

    }
    var goodInfo
    $("#mytbd").on("click",".detail",function () {
        var puttoNo=$(this).parent().parent().find("td").eq(0).text()
        $.ajax({
            url: "putIn/queryDetail",
            data: {"puttoNo":$(this).parent().parent().find("td").eq(0).text()},
            type: "post",
            dataType: "json",
            success: function (data) {

                $("#myModal .titles").text(puttoNo);
                $("#detaillist").html("");
                goodInfo=data;
                for (var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].goodsName+"</td>"
                    tr+="<td>"+data[i].putdeNum+"</td>"
                    tr+="<td>"+"<input id='putdeActNum' size='5px'>"+"</td>"
                    tr+="<td><select id='warehouse' class='warename'></select></td>"
                    tr+="</tr>"
                    $("#detaillist").append(tr);


                }

                queryWare();
            }
        })
    })
    $("#myModal").on("click",".setContent",function () {
        var flag=0
        for (var i=0;i<$("#detaillist").find("tr").length;i++){
            if ($("#detaillist").find("tr").eq(i).find("input").val()==""){
                flag=1;
                alert("请确认所有货物都已清点");
                break;
            }
        }
        if (flag!=1){
            if(confirm("请确保输入的货物清点数量正确，提交后不可更改")){
                for (var i=0;i<$("#detaillist").find("tr").length;i++){
                    var tr="<tr>"
                    for(var j=0;j<goodInfo.length;j++){
                        if (goodInfo[j].goodsName==$("#detaillist").find("tr").eq(i).find("td").eq(0).text()) {
                            tr+="<td>"+$("#myModal .titles").text()+"</td>"
                            tr+="<td>"+goodInfo[j].goodsNo+"</td>"
                            tr+="<td>"+$("#detaillist").find("tr").eq(i).find("td").eq(0).text()+"</td>"
                            tr+="<td>"+goodInfo[j].goodsTypeName+"</td>"
                            tr+="<td>"+goodInfo[j].goodsSize+"</td>"
                            tr+="<td>"+goodInfo[j].unit+"</td>"
                            tr+="<td>"+$("#detaillist").find("tr").eq(i).find("input").val()+"</td>"
                            tr+="<td>"+$("#detaillist").find("tr").eq(i).find("select option:selected").text()+"</td>"
                            break;

                        }
                    }

                    tr+="</tr>"
                    $("#mytbd3").append(tr);

                }
               // alert($("#mytbd").find("tr").eq(0).find("td").eq(0).text())
                var puttno=$("#myModal .titles").text()
                for (var a=0;a<$("#mytbd").find("tr").length;a++){
                    if ($("#mytbd").find("tr").eq(a).find("td").eq(0).text()==puttno) {
                        $("#mytbd").find("tr").eq(a).find("button").prop("disabled", true);
                        $("#mytbd").find("tr").eq(a).find("td").eq(4).text("已验收");
                        $("#applyToWare").prop("disabled", false);
                    }
                }
                alert("提交成功");
                $('#myModal').modal('hide')
            }

        }

    })


    function queryWare() {
        $.ajax({
            url: "ware/queryAll",
            dataType: "json",
            type:"post",
            success: function (data) {

                for (j=0;j<$("#detaillist .warename").length;j++){
                    for (var i=0;i<data.length;i++){
                        var option="<option value="+data[i].warehouseId+">";
                        option+=data[i].wareAddress;
                        option+="</option>>";
                        $("#detaillist .warename").eq(j).append(option);
                    }
                }


            }

        })
    }
    function comfirm(){
        if(confirm("确定执行入库?已验收的订单将会执行入库")){
            var puttoNoes=new Array();
            var goodsputin=new Array();
            $("#mytbd tr").each(function () {
                if($(this).find("td").eq(4).text()=="已验收"){
                    var puttoNo=$(this).find("td").eq(0).text();
                    puttoNoes.push(puttoNo);
                }
            })
            $("#mytbd3 tr").each(function () {
                var goods=new Object();
                goods.puttoNo=$(this).find("td").eq(0).text();
                goods.wareAddress=$(this).find("td").eq(7).text();
                goods.goodsNo=$(this).find("td").eq(1).text();
                goods.wGoodsNum=$(this).find("td").eq(6).text();
                goodsputin.push(goods);
            })
            var jsonstr={"puttoNoes":puttoNoes,"goodsputin":goodsputin};
           // alert(JSON.stringify(jsonstr));
            $.ajax({
                url:"ware/applyToWare",
                type: "post",
                contextType:"application/json",
                contentType : 'application/json',
                data: JSON.stringify(jsonstr),
                dataType: "text",
                success: function (data) {
                    if (data=="true"){
                        alert("提交成功");
                        $("#mytbd3").html("");
                        query();
                        $("#applyToWare").prop("disabled", true);
                    }
                }
            })
        }
    }
</script>
</html>
