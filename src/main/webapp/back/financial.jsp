<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/5
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <base href="http://localhost:8080/jxcsystem/">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/normalize.css">
    <link rel="stylesheet"  href="css/default.css" >
    <style type="text/css">

    </style>



    <title>财务报表</title>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">利润报表</li>
        <li >销售订单</li>
        <li>采购订单</li>


    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show" >
            <table>
                <thead>
                <tr>
                    <th>本月的收入支出情况</th>

                    <th style="margin-left: 2000px">本年的收入支出情况</th>
                </tr>
                </thead>
                <tbody id="profit">
                <tr>
                    <td><button id="getData" onclick="getPicture()">获取数据</button> <canvas id="chart-area" width="300" height="300"/></td>
                    <td ><button id="getYearData" onclick="getYearData()">获取数据</button><canvas id="canvas" height="450" width="600"></canvas></td>
                </tr>
                </tbody>
            </table>
            <%--<table>

                <tbody id="profityear">
                <tr>
                    <td></td>
                </tr>
                </tbody>

            </table>--%>


            <%--<table class="table">
                <caption>本月收入支出情况</caption>
                <thead>
                <tr>
                    <th>支出</th>
                    <th>收入</th>
                    <th>利润</th>
                </tr>
                </thead>
                <tbody id="profit">
                </tbody>
            </table>--%>

        </div>



        <div class="layui-tab-item ">
            <form role="form" class="form-inline">
                <div class="form-group">
                    <label for="selltoNo">&nbsp;&nbsp;&nbsp;&nbsp;流水号</label>
                    <input type="text" class="form-control" id="selltoNo" >
                </div>
                <div class="form-group">
                    <label for="selltoTime">&nbsp;&nbsp;&nbsp;&nbsp;销售日期</label>
                    <input type="date" class="form-control" id="selltoTime" >
                </div>
                <div class="form-group">
                    <label for="selltoClient">&nbsp;&nbsp;&nbsp;&nbsp;客户</label>
                    <input type="text" class="form-control" id="selltoClient" value="" >
                </div>
                <div class="form-group">
                    <label for="selltoMan">&nbsp;&nbsp;&nbsp;销售员</label>
                    <input type="text" class="form-control" id="selltoMan" value="" >
                </div>

            </form>
            <button style="margin-top: 30px;margin-bottom: 50px" class="btn btn-primary btn-lg" onclick="searchSell(1,5)" id="searchsell" >查询</button>
            <table class="table">
                <caption></caption>
                <thead>
                <tr>
                    <th>流水号</th>
                    <th>销售日期</th>
                    <th>销售客户</th>
                    <th>销售员</th>
                    <th>销售总价</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="mytbd1">
                </tbody>
            </table>
            <div style="position: fixed; bottom: 20px;">
                当前是第<span id="currPage1"></span>页，共<span id="totalpage1"></span>页，
                <button id="prevPage1">上一页</button><button id="nextPage1">下一页</button>
                每页<select id="pageSize1">
                <option value="5">5</option>
                <option value="2">2</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
            </select>条
            </div>
        </div>



        <div class="layui-tab-item">
            <form role="form" class="form-inline">
                <div class="form-group">
                    <label for="purtoNo">&nbsp;&nbsp;&nbsp;&nbsp;流水号</label>
                    <input type="text" class="form-control" id="purtoNo" >
                </div>
                <div class="form-group">
                    <label for="purtoTime">&nbsp;&nbsp;&nbsp;&nbsp;申请日期</label>
                    <input type="date" class="form-control" id="purtoTime" >
                </div>
                <div class="form-group">
                    <label for="purtoAppMan">&nbsp;&nbsp;&nbsp;&nbsp;申请人</label>
                    <input type="text" class="form-control" id="purtoAppMan" value="" >
                </div>
                <div class="form-group">
                    <label for="purtoAppDep">&nbsp;&nbsp;&nbsp;申请部门</label>
                    <input type="text" class="form-control" id="purtoAppDep" value="" >
                </div>

            </form>

            <button style="margin-top: 30px;margin-bottom: 50px" class="btn btn-primary btn-lg" onclick="search(1,5)" id="find" >查询</button>
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
            <div style="position: fixed; bottom: 20px;">
                当前是第<span id="currPage"></span>页，共<span id="totalpage"></span>页，
                <button id="prevPage">上一页</button><button id="nextPage">下一页</button>
                每页<select id="pageSize">
                <option value="5">5</option>
                <option value="1">1</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
            </select>条
            </div>
        </div>








    </div>

</div>


<%--详情显示--%>
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



<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    订单详情
                </h4>
            </div>
            <div class="modal-body" >
                <table class="table">
                    <caption></caption>
                    <thead>
                    <tr>
                        <th>商品名称</th>
                        <th>销售数量</th>
                        <th>小计</th>

                    </tr>
                    </thead>
                    <tbody id="selldetaillist">
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

<script src="js/Chart.js"></script>
<script src="layui/layui.js"></script>
<script>

    var yearData=new Array();
    var yearSellData=new Array()
    for (var i=0;i<12;i++){
        yearData[i]=0;
        yearSellData[i]=0;
    }
    function getYearPurData() {
        $.ajax({
            url: "pur/getPurTotalPriceThisYear",
            type: "post",
            dataType: "json",
            success: function (data) {

                for (var i=0;i<data.length;i++){
                    yearData[data[i].month-1]=parseFloat(data[i].price)
                }

            }
        })

    }
    function getYearSellData() {
        $.ajax({
            url: "sell/sellPricethisYear",
            type: "post",
            dataType: "json",
            success: function (data) {

                for (var i=0;i<data.length;i++){
                    yearSellData[data[i].month-1]=parseFloat(data[i].price)
                }

            }
        })

    }

    function getYearData() {
        var barChartData = {
            labels : ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    // data : [2000,parseFloat(yearData[1]),parseFloat(yearData[2]),parseFloat(yearData[3]),parseFloat(yearData[4]),parseFloat(yearData[5]),parseFloat(yearData[6])
                    //     , parseFloat(yearData[7]),parseFloat(yearData[8]),parseFloat(yearData[9]),parseFloat(yearData[10]),parseFloat(yearData[11])]
                    data: [yearData[0],yearData[1],yearData[2],yearData[3],yearData[4],yearData[5],yearData[6],yearData[7],yearData[8],yearData[9],yearData[10],yearData[11]]
                },
                {
                    fillColor : "rgba(151,187,205,0.5)",
                    strokeColor : "rgba(151,187,205,0.8)",
                    highlightFill : "rgba(151,187,205,0.75)",
                    highlightStroke : "rgba(151,187,205,1)",
                    // data : [parseFloat(yearData[0]),parseFloat(yearData[1]),parseFloat(yearData[2]),parseFloat(yearData[3]),parseFloat(yearData[4]),parseFloat(yearData[5]),parseFloat(yearData[6])
                    //     , parseFloat(yearData[7]),parseFloat(yearData[8]),parseFloat(yearData[9]),parseFloat(yearData[10]),parseFloat(yearData[11])]
                    data: [yearSellData[0],yearSellData[1],yearSellData[2],yearSellData[3],yearSellData[4],yearSellData[5],yearSellData[6],yearSellData[7],yearSellData[8],yearSellData[9],yearSellData[10],yearSellData[11]]
                }
            ]

        }
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myBar = new Chart(ctx).Bar(barChartData, {
            responsive : true
        });
        $("#getYearData").hide();
    }




    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        element.init();
    });
    $(function () {
        querySell(1,5);
        query(1,5);
        getSellPrice();
        getPurPrice();
        getYearPurData();
        getYearSellData()
    })

    //采购订单部分
    var dataPage;
    function query(pages,pageSize){
        $.ajax({
            url: "pur/queryApply",
            type: "post",
            data: {"point":3,"pageNum":pages,"pageSize":pageSize},
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
                    tr+="<td> <button class=\"btn btn-primary btn-lg detail\" data-toggle=\"modal\" data-target=\"#myModal\" >详情 </button></td>"
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
        var id = $(this).parent().parent().find("td").eq(0).text()
        $.ajax({
            url: "pur/queryDetail",
            type: "post",
            data: {"purtoNo": id},
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#detaillist").html("");
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr>"
                    tr += "<td>" + data[i].goodsName + "</td>"
                    tr += "<td>" + data[i].purdeNum + "</td>"
                    tr += "<td>" + data[i].purdeSub + "元</td>"
                    tr += "</tr>"
                    $("#detaillist").append(tr)

                }
            }
        })
    })



    function search(pages,pageSize) {
        var purtoNo=$("#purtoNo").val();
        var purtoTime=$("#purtoTime").val();
        var purtoAppMan=$("#purtoAppMan").val();
        var purtoAppDep=$("#purtoAppDep").val();
        var jsonstr={"purtoNo":purtoNo,"purtoTime":purtoTime,"purtoAppMan":purtoAppMan,"purtoAppDep":purtoAppDep,"pageNum":pages,"pageSize":pageSize};
        //alert(JSON.stringify(jsonstr));
        $.ajax({
            url: "pur/search",
            type: "post",
            contextType:"application/json",
            contentType : 'application/json',
            data: JSON.stringify(jsonstr),
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
                    tr+="<td> <button class=\"btn btn-primary btn-lg detail\" data-toggle=\"modal\" data-target=\"#myModal\" >详情 </button></td>"
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


    $("#nextPage").click(function(){
        //将下一页的页码传到服务器
        search(dataPage.nextPage,$("#pageSize").val());
    })
    $("#prevPage").click(function(){
        //将上一页的页码传到服务器
        search(dataPage.prePage,$("#pageSize").val());
    })

    $("#pageSize").change(function(){
        search(1,$("#pageSize").val());

    })




    //销售订单查询部分
    var sellData;
    function querySell(pages,pageSize){
        $.ajax({
            url: "sell/queryComplete",
            type: "post",
            data: {"pageNum":pages,"pageSize":pageSize},
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#mytbd1").html("");
                sellData=data;
                var info=data.list;
                for (var i=0;i<info.length;i++){
                    var tr="<tr>"

                    var day=info[i].selltoTime;
                    tr+="<td>"+info[i].selltoNo+"</td>"
                    tr+="<td>"+day+"</td>"
                    tr+="<td>"+info[i].selltoClient+"</td>"
                    tr+="<td>"+info[i].selltoMan+"</td>"
                    tr+="<td>"+info[i].selltoPrices+"元</td>"
                    tr+="<td> <button class=\"btn btn-primary btn-lg selldetail\" data-toggle=\"modal\" data-target=\"#myModal2\" >详情 </button></td>"
                    tr+="</tr>"
                    $("#mytbd1").append(tr)

                }
                $("#currPage1").html(data.pageNum);
                $("#totalpage1").html(data.pages);
                if(data.isFirstPage){
                    $("#prevPage1").hide();
                }else{
                    $("#prevPage1").show();
                }
                if(data.isLastPage){
                    $("#nextPage1").hide();
                }else{
                    $("#nextPage1").show();
                }


            }
        })
    }


    $("#nextPage1").click(function(){
        //将下一页的页码传到服务器
       searchSell(sellData.nextPage,$("#pageSize1").val());
    })
    $("#prevPage1").click(function(){
        //将上一页的页码传到服务器
       searchSell(sellData.prePage,$("#pageSize1").val());
    })

    $("#pageSize1").change(function(){
       searchSell(1,$("#pageSize1").val());

    })

    $("#mytbd1").on("click",".selldetail",function () {
        var id = $(this).parent().parent().find("td").eq(0).text()
        $.ajax({
            url: "sell/queryDetail",
            type: "post",
            data: {"selltoNo": id},
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#selldetaillist").html("");
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr>"
                    tr += "<td>" + data[i].goodsName + "</td>"
                    tr += "<td>" + data[i].selldeNum + "</td>"
                    tr += "<td>" + data[i].selldeSub + "元</td>"
                    tr += "</tr>"
                    $("#selldetaillist").append(tr)

                }
            }
        })
    })

    function searchSell(pages,pageSize) {
        var selltoNo=$("#selltoNo").val();
        var selltoTime=$("#selltoTime").val();
        var selltoClient=$("#selltoClient").val();
        var selltoMan=$("#selltoMan").val();
        var jsonstr={"selltoNo":selltoNo,"selltoTime":selltoTime,"selltoClient":selltoClient,"selltoMan":selltoMan,"pageNum":pages,"pageSize":pageSize};
        //alert(JSON.stringify(jsonstr));
        $.ajax({
            url: "sell/search",
            type: "post",
            contextType:"application/json",
            contentType : 'application/json',
            data: JSON.stringify(jsonstr),
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#mytbd1").html("");
                sellData=data;
                var info=data.list;
                for (var i=0;i<info.length;i++){
                    var tr="<tr>"

                    var day=info[i].selltoTime.substring(0,10)
                    tr+="<td>"+info[i].selltoNo+"</td>"
                    tr+="<td>"+day+"</td>"
                    tr+="<td>"+info[i].selltoClient+"</td>"
                    tr+="<td>"+info[i].selltoMan+"</td>"
                    tr+="<td>"+info[i].selltoPrices+"元</td>"
                    tr+="<td> <button class=\"btn btn-primary btn-lg selldetail\" data-toggle=\"modal\" data-target=\"#myModal2\" >详情 </button></td>"
                    tr+="</tr>"
                    $("#mytbd1").append(tr)

                }
                $("#currPage1").html(data.pageNum);
                $("#totalpage1").html(data.pages);
                if(data.isFirstPage){
                    $("#prevPage1").hide();
                }else{
                    $("#prevPage1").show();
                }
                if(data.isLastPage){
                    $("#nextPage1").hide();
                }else{
                    $("#nextPage1").show();
                }


            }
        })

    }

    var purprice;
    var sellprice;
    var pieData;
    function getPurPrice() {
        $.ajax({
            url: "pur/getPurTotalPriceThisMonth",
            type: "post",
            dataType: "text",
            success: function (data) {
                purprice=parseFloat(data);



            }
        })
    }
    function getSellPrice() {
        $.ajax({
            url: "sell/sellPricethisMonth",
            type: "post",
            dataType: "text",
            success: function (data) {

                sellprice=parseFloat(data);

            }
        })
    }

    function getPicture() {
        pieData = [
            {
                value:purprice,
                color:"#F7464A",
                highlight: "#FF5A5E",
                label: "支出"
            },
            {
                value:sellprice,
                color: "#46BFBD",
                highlight: "#5AD3D1",
                label: "收入"
            },

        ];
        var ctx = document.getElementById("chart-area").getContext("2d");
        window.myPie = new Chart(ctx).Pie(pieData);
        $("#getData").hide();
    }
</script>



</html>
