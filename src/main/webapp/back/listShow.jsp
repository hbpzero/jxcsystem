<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/17
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>end</title>
    <base href="http://localhost:8080/jxcsystem/">
    <link  rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script  src="js/jquery.min.js"></script>
    <script  src="js/bootstrap.min.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body>
<!--
<form id="insertForm">
    <fieldset>
    <p>添加商品</p>

    商品编号:<input type="text" name="goodsNo" id="goodsNo">
    商品名:<input type="text" name="goodsName" id="goodsName">
    商品类型:<select id="goodstypeid" name="goodstypeid"></select>
        商品大小:<input type="text" name="goodsSize" id="goodsSize">
        成本:<input type="text" name="proPrice" id="proPrice">
        销售价格:<input type="text" name="salePrice" id="salePrice">
        价格:<input type="text" name="srPrice" id="srPrice">
        产地:<input type="text" name="goodsPlace" id="goodsPlace">
        unit:<input type="text" name="unit" id="unit">
    <button id="btn">确定</button>
</fieldset>
</form>
-->
<button class='bt  layui-btn' data-toggle='modal' data-target='#myModal2'  >添加商品</button>
<form class="layui-form">

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
        <th width="10%">商品Id</th>
        <th width="10%" >商品编号</th>
        <th width="10%" >商品名</th>
        <th  width="10%">商品类型</th>
        <th width="10%">商品大小</th>
        <th width="5%">成本</th>
        <th width="10%">销售价格</th>
        <th width="5%">价格</th>
        <th width="5%">产地</th>
        <th width="5%">单位</th>

    </tr>
    </thead>
    <tbody id="showSelect">
    <tbody>

</tbody>
    </tbody>
</table>

<%--<button><a href="/student/add.action" >添加学生</a></button>
<form method="post" action="/student/update.action">
    <input type="text" name="stuid"  placeholder="请输入要修改的学生ID" /><input type="submit" value="前往修改">
</form>
<form method="post" action="/student/delStudent.action">
    <input type="text" name="stuid"  placeholder="请输入要删除的学生ID" /><input type="submit" value="删除">
</form>--%>
<!--修改-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改商品信息
                </h4>
            </div>
            <div class="modal-body">

                <form id="updateForm" class="layui-form">
                    商品ID:<input type="text" name="goodsId" readonly="readonly" class="layui-input goodsId">
                    商品编号:<input type="text" name="goodsNo" readonly="readonly" class="layui-input goodsNo">
                    商品名:<input type="text" name="goodsName" class="layui-input goodsName" >
                    <div class="layui-inline">
                    <div class="layui-input-inline">
                    商品类型:<select id="goodstypeid2" name="goodstypeid" class="goodstypeid"></select><br>
                    </div>
                    </div>
                    <br>
                    商品大小:<input type="text" name="goodsSize" class="layui-input goodsSize" >
                    成本:<input type="text" name="proPrice"  class="layui-input proPrice">
                    销售价格:<input type="text" name="salePrice" class="layui-input salePrice">
                    价格:<input type="text" name="srPrice" class="layui-input srPrice">
                    产地:<input type="text" name="goodsPlace"  class="layui-input goodsPlace">
                    单位:<input type="text" name="unit" class="layui-input unit">
                </form>
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


<!-- 插入-->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <!--  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>-->
                <h4 class="modal-title" id="myModalLabel2">
                    添加商品
                </h4>
            </div>
            <div class="modal-body">
                <form id="insertForm" class="layui-form" lay-filter="insertForm">
                    <span id="tishi"></span><br>
                    商品编号:<input type="text" name="goodsNo" id="goodsNo" class="layui-input">
                    商品名:<input type="text" name="goodsName" id="goodsName" class="layui-input">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                    商品类型:<select id="goodstypeid" name="goodstypeid"></select><br>
                        </div>
                    </div><br>
                    商品大小:<input type="text" name="goodsSize" id="goodsSize" class="layui-input">
                    成本:<input type="text" name="proPrice" id="proPrice" class="layui-input">
                    销售价格:<input type="text" name="salePrice" id="salePrice" class="layui-input">
                    价格:<input type="text" name="srPrice" id="srPrice" class="layui-input">
                    产地:<input type="text" name="goodsPlace" id="goodsPlace" class="layui-input">
                    单位:<input type="text" name="unit" id="unit" class="layui-input">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeBtn">关闭
                </button>
                <button type="button" class="btn layui-btn layui-btn-disabled" disabled="disabled" id="btn">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div style="position: fixed; bottom: 20px;">
    当前是第<span id="currPage" ></span>页，共<span id="totalpage"></span>页，
    <button id="prevPage" class="layui-btn layui-btn-sm">上一页</button><button id="nextPage" class="layui-btn layui-btn-sm">下一页</button>
    每页<select id="pageSize">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
</select>条
</div>

</body>


</html>
<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功


        form.render();
    });
   $( function() {
      //  query();
       queryType();
    })
//插入商品验证
    $("#insertForm").on("input propertychange",".layui-input",function () {
    $("#insertForm .layui-input").each(function() {
        var t=$(this).val();


                if (t == "" || t == null) {
                    $("#btn").addClass("layui-btn-disabled");
                    $("#btn").prop("disabled", true);
                    return false;
                }
                 else {
                    $("#btn").removeClass("layui-btn-disabled");
                    $("#btn").prop("disabled", false);
                    $("#tishi").html("");
                }

    });
    });
               /*
    $("#insertForm").on("input propertychange","#goodsNo",function () {
        var goodsNo=$("#goodsNo").val();
        $.ajax({
            url:"goods/goodsNo",
            type:"post",
            data:{"goodsNo":goodsNo},
            dataType:"text",
            success:function (data) {
                if(data!="success") {
                    $("#btn").addClass("layui-btn-disabled");
                    $("#btn").prop("disabled", true);
                    $("#tishi").html("商品名已存在");
                    $("#tishi").css("color","red");
                }
            }
        })
    })
               */
   function queryType() {
       $.ajax({
           url:"goods/findGoodsType",
           type:"post",
           dataType:"json",
           success:function (data) {
               for (var i=0;i<data.length;i++){
                   var op="<option value="+data[i].goodsTypeId+">"+data[i].goodsTypeName+"</option>";
                   $("#goodstypeid").append(op);
                   $("#goodstypeid2").append(op);
               }

           }
       })

   }
   var dataPage;
    function query(pageNum,pageSize){
    $.ajax({
        url:"goods/selectGoods",
        type:"post",
        data:{"pageNum":pageNum,"pageSize":pageSize},
        dataType :"json",
        success:function (data) {
            $("#showSelect").html("");
            dataPage=data;
            var datelist=data.list;
            for(var i=0;i<datelist.length;i++){
                var t="<tr>";
                     t+="<td>"+datelist[i].goodsId+"</td>";
                     t+="<td>"+datelist[i].goodsNo+"</td>";
                     t+="<td>"+datelist[i].goodsName+"</td>";
                     t+="<td>"+datelist[i].goodsTypeName+"</td>";
                     t+="<td>"+datelist[i].goodsSize+"</td>";
                     t+="<td>"+datelist[i].proPrice+"</td>";
                      t+="<td>"+datelist[i].salePrice+"</td>";
                     t+="<td>"+datelist[i].srPrice+"</td>";
                     t+="<td>"+datelist[i].goodsPlace+"</td>";
                     t+="<td>"+datelist[i].unit+"</td>";
                     t+="<td><button class='bt  layui-btn layui-btn-lg update' data-toggle='modal' data-target='#myModal'>修改</button><button  class='bt  layui-btn layui-btn-lg' onclick='delStu("+datelist[i].goodsId+")'>删除</button></td>"
                     t+="</tr>";
                     $("#showSelect").append(t);

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
        }
    })
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



   $(function(){
       query(1,5);
       queryGoodsTypeName();
   })



   updateBtn.onclick=function(){
       if(confirm("确认修改?")) {
           $.ajax({
               url: "goods/updateGoods",
               type: "post",
               data: $("#updateForm").serialize(),
               dataType: "text",

               success: function (data) {

                   if (data == "success") {
                       alert("修改完毕");
                       query(1, 5);
                       $('#myModal').modal('hide');
                   } else {
                       alert("error");
                   }
               }
           })
       }
   }
   $("#showSelect").on("click",".update",function () {
       $(".goodsId").val($(this).parent().parent().children(0).html());
       $(".goodsNo").val($(this).parent().parent().find("td").eq(1).html());
       $(".goodsName").val($(this).parent().parent().find("td").eq(2).html());
       $(".goodsSize").val($(this).parent().parent().find("td").eq(4).html());
       $(".proPrice").val($(this).parent().parent().find("td").eq(5).html());
       $(".salePrice").val($(this).parent().parent().find("td").eq(6).html());
       $(".srPrice").val($(this).parent().parent().find("td").eq(7).html());
       $(".goodsPlace").val($(this).parent().parent().find("td").eq(8).html());
       $(".unit").val($(this).parent().parent().find("td").eq(9).html());
   })

   btn.onclick=function(){
       if(confirm("确认提交?")){
           var goodsNo=$("#goodsNo").val();
           $.ajax({
               url: "goods/goodsNo",
               type: "post",
               data: {"goodsNo": goodsNo},
               dataType: "text",
               success: function (data) {
                   if (data != "success") {
                      // $("#btn").addClass("layui-btn-disabled");
                     //  $("#btn").prop("disabled", true);
                       $("#tishi").html("商品编号重复");
                       $("#tishi").css("color", "red");
                       return false;
                   }
                   if(data=="success") {
                       $.ajax({
                           url: "goods/addGoods",
                           type: "post",
                           data: $("#insertForm").serialize(),
                           dataType: "text",
                           success: function (data) {
                               if (data == "success") {
                                   alert("提交完成");
                                   query(1, 5);
                                   $('#myModal2').modal('hide');
                               }
                           }
                       })
                   }
       }
       })
       }
    }
/*
    function updateStu(val){
       $.ajax({
           url:"student/update",
           type:"post",
           data:{"stuid":val},
           dataType:"json",

           success:function (data) {
               $("#updateForm").html("");

                   var i="学号：<input name='stuid' readonly='readonly' value='"+data[0].stuid+"'>";
                    i+="名字<input name='sname' value='"+data[0].sname+"'>";
                    i+="班级<input name='claid' value='"+data[0].claid+"'>";
                   $("#updateForm").append(i);
           }
       })
    }
    */
    function delStu(val) {
        if (confirm("确认删除?")) {
            $.ajax({
                url: "goods/delGoods",
                type: "post",
                data: {"goodsId": val},
                dataType: "text",
                success: function (data) {
                    if (data == "success") {

                        query(1, 5);
                    }
                }
            })
        }
    }
   closeBtn.onclick=function () {
       $("#insertForm").find('input[type=text],select,input[type=hidden]').each(function() {
           $(this).val('');

       });
   }

    selectBtn.onclick=function () {
        var goodsName=$("#queryGoodsName").val();
        var goodsTypeId=$("#queryGoodsTypeName").val();

            $.ajax({
                url: "goods/selectByCheck",
                type: "post",
                data: {
                    "goodsName": goodsName,
                    "goodsTypeId": goodsTypeId,
                    "pageNum": 1,
                    "pageSize": 5
                },
                dataType: "json",
                success: function (data) {
                    $("#showSelect").html("");
                    dataPage=data;
                    var datelist=data.list;
                    for(var i=0;i<datelist.length;i++){
                        var t="<tr>";
                        t+="<td>"+datelist[i].goodsId+"</td>";
                        t+="<td>"+datelist[i].goodsNo+"</td>";
                        t+="<td>"+datelist[i].goodsName+"</td>";
                        t+="<td>"+datelist[i].goodsTypeName+"</td>";
                        t+="<td>"+datelist[i].goodsSize+"</td>";
                        t+="<td>"+datelist[i].proPrice+"</td>";
                        t+="<td>"+datelist[i].salePrice+"</td>";
                        t+="<td>"+datelist[i].srPrice+"</td>";
                        t+="<td>"+datelist[i].goodsPlace+"</td>";
                        t+="<td>"+datelist[i].unit+"</td>";
                        t+="<td><button class='bt  layui-btn layui-btn-lg update' data-toggle='modal' data-target='#myModal'>修改</button><button  class='bt  layui-btn layui-btn-lg' onclick='delStu("+datelist[i].goodsId+")'>删除</button></td>"
                        t+="</tr>";
                        $("#showSelect").append(t);

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
                }
            })

    }
    function queryGoodsTypeName(){
        $.ajax({
            url:"goods/findGoodsType",
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
</script>