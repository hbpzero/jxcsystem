<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="http://localhost:8080/jxcsystem/">
    <link  rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script  src="js/jquery.min.js"></script>
    <script  src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">

                <table class="table">
                    <thead>
                    <tr>
                        <th width="20%" >商品编号</th>
                        <th width="25%" >商品名称</th>
                        <th  width="20%">采购数量</th>
                        <th width="20%">验收数量</th>
                        <th width="15%">操作<th>

                    </tr>
                    </thead>
                    <tbody id="showSelect2">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary"  id="updateBtn">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<table class="table table-striped">
    <thead>
    <tr>

        <th width="25%" >采购订单号</th>
        <th width="20%" >采购人</th>
        <th  width="25%">采购日期</th>
        <th width="25%">采购部门</th>

        <th width="5%">操作<th>

    </tr>
    </thead>
    <tbody id="showSelect">

    </tbody>
</table>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="layui-input-inline">
            流水号:<input name="puttoNo" type="text" class="layui-input" id="puttoNo" readonly="readonly">
        </div>
        <div class="layui-input-inline">
            入库时间:<input type="text" name="puttoTime" class="layui-input" id="puttoTime" readonly="readonly">
        </div>
        <div class="layui-input-inline">
            操作人:<input type="text" name="puttoMan" class="layui-input" value="${user.userName}" readonly="readonly" id="puttoMan">
        </div>
        <button class="layui-btn layui-btn-lg" id="up">提交</button>
        <table  class="table">
            <thead>
            <tr>
                <th>商品编号</th>
                <th>商品名称</th>
                <th>商品类别</th>
                <th>大小</th>
                <th>计量单位</th>
                <th>进货价格</th>
                <th>数量</th>
                <th>库存总数</th>
                <th>小计(￥元)</th>
                <th>备注</th>

            </tr>
            </thead>
            <tbody id="showSelect3">


            </tbody>

        </table>
    </div>
</div>
</body>
<script>
    var Info;
    $(function () {
        $.ajax({
            url:"putpurchase/select",
            type:"post",
            dataType:"json",
            success:function (data) {
                Info=data;
                $("#showSelect").html("");
                for(var i=0;i<data.length;i++){
                    var th="<tr>";
                         th+="<td>"+data[i].purtoNo+"</td>";
                         th+="<td>"+data[i].purtoMan+"</td>";
                         th+="<td>"+data[i].purtoTime+"</td>";
                         th+="<td>"+data[i].purtoAppDep+"</td>";
                         th+="<td><button class='putIn layui-btn' data-toggle='modal' data-target='#myModal'>详情</button></td>";
                         th+="<tr>";
                         $("#showSelect").append(th);
                }
            }
        })
    })
   var goodsInfo;
    $("#showSelect").on("click",".putIn",function () {
        var purtoNo=$(this).parent().parent().children("td").eq(0).text();

        $.ajax({
            url:"putpurchase/selectPurdetail",
            type:"post",
            data:{"purtoNo":purtoNo},
            dataType:"json",
            success:function (data) {
                $("#showSelect2").empty();
                goodsInfo=data;
                for(var i in data){
                    var th="<tr>";
                    th+="<td>"+data[i].goodsNo+"</td>";
                    th+="<td>"+data[i].goodsName+"</td>";
                    th+="<td>"+data[i].purdeNum+"</td>";
                    th+="<td><div class=\"layui-input-inline\"><input class='layui-input'></div></td>";
                    th+="<td><button class='correct layui-btn'>确认</button></td>";
                    th+="<tr>";
                    $("#showSelect2").append(th);
                }
            }
        })
    })
$("#showSelect2").on("click",".correct",function () {
    for(var i in goodsInfo){
        if(goodsInfo[i].goodsNo==$(this).parent().parent().children("td").eq(0).text()){
            var td="<tr>";
                 td+="<td>"+goodsInfo[i].goodsNo+"</td>";
                 td+="<td>"+goodsInfo[i].goodsName+"</td>";
                 td+="<td>"+goodsInfo[i].goodsTypeName+"</td>";
                 td+="<td>"+goodsInfo[i].goodsSize+"</td>";
                 td+="<td>"+goodsInfo[i].unit+"</td>";
                 td+="<td>"+goodsInfo[i].proPrice+"</td>";
               //  td+="<td>"+goodsInfo[i].goodsName+"</td>";
                 td+="<td>"+$(this).parent().prev().find("input").val()+"</td>";
              //   td+="<td>"+goodsinfo[i].productCount+"</td>";
                 td+="</tr>";
                 $("#showSelect3").append(td);
                 $(this).addClass("layui-btn-disabled");
                 $(this).prop("disabled",true);
        }
    }
});
    var goodsArray=new Array();

$("#up").click(function () {
    var puttoNo=$("#puttoNo").val();
    var puttoTime=$("#puttoTime").val();
    var puttoMan=$("#puttoMan").val();
    $("#showSelect3 tr").each(function () {
        var goods=new Object();
      //  var goodsNo=goodsInfo[i].goodsNo;
      //  var putdeNum=$(this).find("input").val();
        goods.puttoNo=puttoNo;
        goods.goodsNo=$(this).children("td").eq(0).text();
        goods.putdeNum=$(this).children("td").eq(6).text();
        goodsArray.push(goods);
    })
    var jsonArray={"puttoNo":puttoNo,"puttoTime":puttoTime,"puttoMan":puttoMan,"goodsArray":goodsArray};

    $.ajax({
        url:"putpurchase/puttoPurchase",
        type:"post",
        data:JSON.stringify(jsonArray),
        contentType:"application/json",
        success:function (data) {
            if(data=="success"){
                alert("提交完成");
                $("#up").addClass("layui-btn-disabled");

                $("#up").prop("disabled",true);

                // window.location.reload();
            }
        }
    })
});


    $(function () {
        $.ajax({
            url:"putpurchase/getCount",
            type:"post",
            dataType:"text",
            success:function (data) {
                $("#puttoNo").val(data);
            }
        })
    })
    //日期
    $(function () {
        $.ajax({
            url:"putpurchase/getTime",
            type:"post",
            dataType:"text",
            success:function (data) {
                $("#puttoTime").val(data);
            }
        })
    })
</script>
</html>
