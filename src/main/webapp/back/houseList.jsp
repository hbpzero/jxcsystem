<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/5
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>查看仓库列表</title>
    <base href="http://localhost:8080/jxcsystem/">
    <link  rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css" >
    <script  src="js/jquery.min.js"></script>
    <script  src="js/bootstrap.min.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body>
<button id="addHouse" class="layui-btn"  data-toggle='modal' data-target='#myModal'>新建仓库</button>
<form id="queryForm" class="layui-form">
    <!--<div class="layui-input-inline">
        操作人:<input type="text" name="puttoMan" class="layui-input" value="${user.userName}" readonly="readonly" id="puttoMan">
    </div>-->
    <!--
    <div class="layui-input-inline">
        仓库地址:<select id="warehouseAddress" name="warehouseAddress" lay-filter="warehouseAddress">
        <option id="def" value="">--选择仓库--</option>
    </select>
    </div>
-->
    <div class="layui-inline">
        <div class="layui-input-inline">
           仓库地址:<select id="warehouseAddress" name="warehouseAddress" lay-filter="warehouseAddress" lay-verify="required" lay-search="">
            </select>
        </div>
    </div>
            <div class="layui-input-inline">
                商品名:<input class="layui-input" name="queryGoodsName" id="queryGoodsName" >
            </div>
            <div class="layui-input-inline">
                商品类型:<select class="layui-input" name="queryGoodsTypeName" id="queryGoodsTypeName" ></select>
            </div>
    <button id="selectBtn" class="layui-btn"  type="button">查找</button>
</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th width="5%" >商品编号</th>
        <th width="5%" >商品名</th>
        <th  width="5%">商品类型</th>
        <th width="5%">商品大小</th>
        <th width="5%">产地</th>
        <th width="5%">单位</th>
        <th width="5%">库存数量</th>
    </tr>
    </thead>
    <tbody id="showSelect">
    </tbody>
</table>
<!--新增-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    新建仓库
                </h4>
            </div>
            <div class="modal-body">
                <span id="tishi"></span>
                <form id="addForm" class="layui-form">

                    仓库名:<input type="text" name="wareAddress" id="wareAddress" class="layui-input wareAddress">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeAdd">关闭
                </button>
                <button type="button" class="layui-btn layui-btn-disabled" disabled="disabled" id="insertBtn">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div style="position: fixed; bottom: 20px;">
    当前是第<span id="currPage"></span>页，共<span id="totalpage"></span>页，
    <button id="prevPage" class="layui-btn layui-btn-sm">上一页</button><button id="nextPage" class="layui-btn layui-btn-sm">下一页</button>
    每页<select id="pageSize">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
</select>条
</div>
</body>
<script>
    var dataPage;
    var warehouseId="";
    layui.use('form', function(){
        var $=layui.jquery;
        var form = layui.form;
        form.on('select(warehouseAddress)',function () {
            warehouseId=$("#warehouseAddress").val();
            query(1,5);
            queryHouse()
            form.render();
         /*   $.ajax({
                url:"warehouse/total",
                type:"post",
                data:{"warehouseId":warehouseId},
                dataType:"json",
                success:function (data) {
                    $("#showSelect").html("");
                    for(var i=0;i<data.length;i++){
                        var tr="<tr>";
                        tr+="<td>"+data[i].goodsNo+"</td>";
                        tr+="<td>"+data[i].goodsName+"</td>";
                        tr+="<td>"+data[i].goodsTypeName+"</td>";
                        tr+="<td>"+data[i].goodsSize+"</td>";
                        tr+="<td>"+data[i].goodsPlace+"</td>";
                        tr+="<td>"+data[i].unit+"</td>";
                        tr+="<td>"+data[i].wGoodsNum+"</td>";
                        tr+="</tr>";
                        $("#showSelect").append(tr);
                        form.render();
                    }
                }
            })*/
        });
        form.render();
    });
    $(function () {
        queryHouse();
        queryGoodsTypeName();
    });
    function queryGoodsTypeName(){
        $.ajax({
            url:"warehouse/type",
            type:"post",
            dataType:"json",
            success:function (data) {
                $("#queryGoodsTypeName").html("");
                var oo="<option value=''>--商品类型--</option>";
                $("#queryGoodsTypeName").append(oo);
                for(var i in data){
                   var op="<option value='"+data[i].goodsTypeId+"'>"+data[i].goodsTypeName+"</option>";
                    $("#queryGoodsTypeName").append(op);
                }
            }
        })
    }
    function  query(pageNum,pageSize) {
        if(warehouseId!="") {
            $.ajax({
                url: "warehouse/page",
                type: "post",
                data: {"warehouseId": warehouseId, "pageNum": pageNum, "pageSize": pageSize},
                dataType: "json",
                success: function (data) {
                    dataPage = data;
                    var datelist = data.list;
                    $("#showSelect").html("");
                    for (var i in datelist) {
                        var tr = "<tr>";
                        tr += "<td>" + datelist[i].goodsNo + "</td>";
                        tr += "<td>" + datelist[i].goodsName + "</td>";
                        tr += "<td>" + datelist[i].goodsTypeName + "</td>";
                        tr += "<td>" + datelist[i].goodsSize + "</td>";
                        tr += "<td>" + datelist[i].goodsPlace + "</td>";
                        tr += "<td>" + datelist[i].unit + "</td>";
                        tr += "<td>" + datelist[i].wGoodsNum + "</td>";
                        tr += "</tr>";
                        $("#showSelect").append(tr);
                        $("#currPage").html(data.pageNum);
                        $("#totalpage").html(data.pages);
                        if (data.isFirstPage) {
                            $("#prevPage").hide();
                        } else {
                            $("#prevPage").show();
                        }
                        if (data.isLastPage) {
                            $("#nextPage").hide();
                        } else {
                            $("#nextPage").show();
                        }
                    }
                }
            })
        }
    }
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
   /* $(function(){
        query(1,5);
    })*/
    function queryHouse() {
        $.ajax({
            url:"warehouse/house",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#warehouseAddress").html("");
                var oo="<option id=\"def\" value=''>--输入仓库--</option>";
                $("#warehouseAddress").append(oo);
                for(var i=0;i<data.length;i++){
                    var op="<option value='"+data[i].warehouseId+"'>"+data[i].wareAddress+"</option>";
                    $("#warehouseAddress").append(op);
                }
            }
        })
    }
    $("#addForm").on("input propertychange","#wareAddress",function () {
        var wareAddress=$("#wareAddress").val();
        $.ajax({
            url:"warehouse/check",
            type:"post",
            data:{"wareAddress":wareAddress},
            dataType:"text",
            success:function (data) {
                    if (data == "success") {
                        $("#insertBtn").removeClass("layui-btn-disabled");
                        $("#insertBtn").prop("disabled", false);
                        $("#tishi").html("");
                    }
                    if(data!="success") {
                        $("#insertBtn").addClass("layui-btn-disabled");
                        $("#insertBtn").prop("disabled", true);
                        $("#tishi").html("仓库已存在");
                        $("#tishi").css("color","red");
                    }
                    if(wareAddress==""){
                        $("#insertBtn").addClass("layui-btn-disabled");
                        $("#insertBtn").prop("disabled", true);
                        $("#tishi").html("仓库名不可为空");
                        $("#tishi").css("color","red");
                    }
            }
        })
        /*
        if(wareAddress!=""){
            $("#insertBtn").removeClass("layui-btn-disabled");
            $("#insertBtn").prop("disabled",false);
        }else{
            $("#insertBtn").addClass("layui-btn-disabled");
            $("#insertBtn").prop("disabled",true);
        }*/
    })

    insertBtn.onclick=function () {
        var wareAddress=$("#wareAddress").val();
        if(confirm("确认提交?")) {
            $.ajax({
                url: "warehouse/addhouse",
                type: "post",
                data: {"wareAddress": wareAddress},
                dataType: "text",
                success: function (data) {
                    if (data == "success") {
                        alert("添加成功");
                        $('#myModal').modal('hide');
                        $("#addForm").find('input[type=text],select,input[type=hidden]').each(function () {
                            $(this).val('');
                        });
                        queryHouse();
                    }
                }
            })
        }
    }
    closeAdd.onclick=function () {
        $("#addForm").find('input[type=text],select,input[type=hidden]').each(function() {
            $(this).val('');
            $("#insertBtn").addClass("layui-btn-disabled");
            $("#insertBtn").prop("disabled",true);
        });
    }
    /*
    $("#warehouseAddress").change(function () {
        var warehouseId=$("#warehouseAddress").val();
        $.ajax({
            url:"warehouse/total",
            type:"post",
            data:{"warehouseId":warehouseId},
            dataType:"json",
            success:function (data) {
                $("#showSelect").html("");
                    for(var i=0;i<data.length;i++){
                        var tr="<tr>";
                        tr+="<td>"+data[i].goodsNo+"</td>";
                        tr+="<td>"+data[i].goodsName+"</td>";
                        tr+="<td>"+data[i].goodsTypeName+"</td>";
                        tr+="<td>"+data[i].goodsSize+"</td>";
                        tr+="<td>"+data[i].goodsPlace+"</td>";
                        tr+="<td>"+data[i].unit+"</td>";
                        tr+="<td>"+data[i].wGoodsNum+"</td>";
                        tr+="</tr>";
                        $("#showSelect").append(tr);

                    }

            }
        })
    })
*/
    selectBtn.onclick=function () {
        var goodsName=$("#queryGoodsName").val();
        var goodsTypeId=$("#queryGoodsTypeName").val();
        if(warehouseId!=""||warehouseId!=null) {
            $.ajax({
                url: "warehouse/selectByCheck",
                type: "post",
                data: {
                    "warehouseId": warehouseId,
                    "goodsName": goodsName,
                    "goodsTypeId": goodsTypeId,
                    "pageNum": 1,
                    "pageSize": 5
                },
                dataType: "json",
                success: function (data) {
                    dataPage = data;
                    var datelist = data.list;
                    $("#showSelect").html("");
                    for (var i in datelist) {
                        var tr = "<tr>";
                        tr += "<td>" + datelist[i].goodsNo + "</td>";
                        tr += "<td>" + datelist[i].goodsName + "</td>";
                        tr += "<td>" + datelist[i].goodsTypeName + "</td>";
                        tr += "<td>" + datelist[i].goodsSize + "</td>";
                        tr += "<td>" + datelist[i].goodsPlace + "</td>";
                        tr += "<td>" + datelist[i].unit + "</td>";
                        tr += "<td>" + datelist[i].wGoodsNum + "</td>";
                        tr += "</tr>";
                        $("#showSelect").append(tr);
                        $("#currPage").html(data.pageNum);
                        $("#totalpage").html(data.pages);
                        if (data.isFirstPage) {
                            $("#prevPage").hide();
                        } else {
                            $("#prevPage").show();
                        }
                        if (data.isLastPage) {
                            $("#nextPage").hide();
                        } else {
                            $("#nextPage").show();
                        }
                    }
                }
            })
        }
    }
</script>

</html>
