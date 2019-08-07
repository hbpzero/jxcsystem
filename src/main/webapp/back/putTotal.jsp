<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="http://localhost:8080/jxcsystem/">
    <link  rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css" >
    <script  src="js/jquery.min.js"></script>
    <script  src="js/bootstrap.min.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body>
<form class="layui-form">
    <div class="layui-input-inline">
    入库订单编号:<input name="puttoNo" type="text" class="layui-input" id="puttoNo" readonly="readonly">
    </div>
    <div class="layui-input-inline">
    入库时间:<input type="text" name="puttoTime" class="layui-input" id="puttoTime" readonly="readonly">
    </div>
    <div class="layui-input-inline">
    操作人:<input type="text" name="puttoMan" class="layui-input" value="${user.userName}" readonly="readonly" id="puttoMan">
    </div>

    <div class="layui-inline">
        <div class="layui-input-inline">
        仓库地址:<select id="warehouseAddress" name="warehouseAddress"></select>
    </div>
    </div>
</form>
<button id="puttoBtn" class="layui-btn">添加商品</button>

<table class="table table-striped">
    <thead>
    <tr>

        <th width="5%" >商品编号</th>
        <th width="10%" >商品名</th>
        <th  width="5%">商品类型</th>
        <th width="5%">商品大小</th>
        <th width="5%">产地</th>
        <th width="5%">单位</th>
        <th width="5%">数量</th>
        <th width="5%">操作<th>

    </tr>
    </thead>

    <tbody id="showSelect">

    </tbody>
</table>
<button id="upload" class="layui-btn layui-btn-disabled" disabled="disabled">提交</button><button id="again" class="layui-btn layui-btn-disabled" disabled="disabled">继续</button>

</body>
<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
    $(function () {
        $.ajax({
            url:"putto/selectWarehouse",
            type:"post",
            dataType:"json",
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    var option="<option value='"+data[i].wareAddress+"'>"+data[i].wareAddress+"</option>";
                    $("#warehouseAddress").append(option);
                }
            }
        })
    })
    var count=0;//计算行数
    $("#puttoBtn").click(function () {
        var th="<tr>";
        th+="<td></td>";
        th+="<td><select class='goodsName'><option>--选择商品--</option></select></td>";
        th+="<td></td>";
        th+="<td></td>";
        th+="<td></td>";
        th+="<td></td>";
        th+="<td><div class=\"layui-input-inline\"><input class='productCount layui-input' name='putdeNum'></div></td>";
        th+="<td><button class='delBtn  layui-btn'>删除</button></td>";
        th+="</tr>";
        $("#showSelect").append(th);
        findGoods();
        $("#upload").addClass("layui-btn-disabled");//新增行，禁用提交按钮
        $("#upload").prop("disabled",true);
    });
    //加载商品列表
    var goodsInfo;
    function findGoods(){
        $.ajax({
            url:"goods/Sgoods",
            contextType:"application/json",
            type:"post",
            dataType:"json",
            success:function (data) {
                goodsInfo=data;

                for(var i in data){
                   // var goodsNo;
                   // $("#showSelect tr").each(function () {
                    //    goodsNo=$(this).children("td").eq(0).text();
                   //     if(goodsNo!=data[i].goodsNo){
                        var op = "<option value='" + data[i].goodsNo + "'>" + data[i].goodsName + "</option>";
                        $("#showSelect .goodsName").eq(count).append(op);

                     //     }

                    //})
                }count++;


            }
        })
    }

    $("#showSelect").on("change",".goodsName",function () {
        for(var i in goodsInfo){
            if($(this).val()==goodsInfo[i].goodsNo){
                $(this).parent().parent().children("td").eq(0).text(goodsInfo[i].goodsNo);
                $(this).parent().parent().children("td").eq(2).text(goodsInfo[i].goodsTypeName);
                $(this).parent().parent().children("td").eq(3).text(goodsInfo[i].goodsSize);
                $(this).parent().parent().children("td").eq(4).text(goodsInfo[i].goodsPlace);
                $(this).parent().parent().children("td").eq(5).text(goodsInfo[i].unit);

            }
          //  $("#upload").removeClass("layui-btn-disabled");
          //  $("#upload").prop("disabled",false);
        }
    });
    $("#getName").click(function () {
        var puttoNo=$("#puttoNo").val();
        alert(puttoNo);
    })


    //上传
    var goodsArray=new Array();
    $("#upload").click(function () {
        var puttoNo=$("#puttoNo").val();
        var puttoTime=$("#puttoTime").val();
        var puttoMan=$("#puttoMan").val();
        var warehouseAddress=$("#warehouseAddress").val();
        var goodsArray=new Array();
        $("#showSelect tr").each(function () {
            var goods=new Object();
            goods.goodsNo=$(this).children("td").eq(0).text();
            goods.puttoNo=puttoNo;
            goods.warehouseAddress=warehouseAddress;
            goods.putdeNum=$(this).find('input').val();
          //  goods.purdeSub=$(this).children("td").eq(10).text();
           // purtoPrices+=parseFloat($(this).children("td").eq(10).text());
            goodsArray.push(goods);
        })
        var jsonArray={"puttoNo":puttoNo,"puttoTime":puttoTime,"puttoMan":puttoMan,"goodsArray":goodsArray};
        <!-- alert(JSON.stringify(jsonArray)); -->
        if(confirm("确定添加?")) {
            $.ajax({
                url: "putto/puttoGoods",
                type: "post",
                data: JSON.stringify(jsonArray),
                contentType: "application/json",
                success: function (data) {
                    if (data == "success") {
                        alert("提交完成");
                        $("#puttoBtn").addClass("layui-btn-disabled");
                        $("#upload").addClass("layui-btn-disabled");
                        $(".delBtn").addClass("layui-btn-disabled");
                        $(".delBtn").prop("disabled", true);
                        $("#again").removeClass("layui-btn-disabled");
                        $("#puttoBtn").prop("disabled", true);
                        $("#upload").prop("disabled", true);
                        $("#again").prop("disabled", false);
                        // window.location.reload();
                    }
                }
            })
        }
    })
/*
    $("#showSelect").on("input propertychange",".productCount",function () {
        var c=$(this).val();
        //数量输入框不为空时提交按钮改为可用
        if(c!=""){
            $("#upload").removeClass("layui-btn-disabled");
            $("#upload").prop("disabled",false);
        }else{
            $("#upload").addClass("layui-btn-disabled");
            $("#upload").prop("disabled",true);
        }
    })
*/
    $("#showSelect").on("input propertychange",".productCount",function () {
        $("#showSelect .productCount").each(function () {
            var c=$(this).val();
            if(c==""||c==null){
                $("#upload").addClass("layui-btn-disabled");
                $("#upload").prop("disabled",true);
              //  throw BreakException;
                return false;
            } else
                $("#upload").removeClass("layui-btn-disabled");
                $("#upload").prop("disabled", false);
        })
        //数量输入框不为空时提交按钮改为可用
    })

    $("#again").click(function () {
        window.location.reload();
    })
    //删除商品
    $("#showSelect").on("click",".delBtn",function () {
        if(confirm("确定删除?")){
            $(this).parent().parent().remove();
            //验证剩下的输入框；
            $("#showSelect .productCount").each(function () {
                var c=$(this).val();
                if(c==""||c==null){
                    $("#upload").addClass("layui-btn-disabled");
                    $("#upload").prop("disabled",true);
                    //  throw BreakException;
                    return false;
                } else
                    $("#upload").removeClass("layui-btn-disabled");
                $("#upload").prop("disabled", false);
            })

            count--;
        }
    })

    //流水号
$(function () {
    $.ajax({
        url:"putto/getCount",
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
            url:"putto/getTime",
            type:"post",
            dataType:"text",
            success:function (data) {
                $("#puttoTime").val(data);
            }
        })
    })
</script>

</html>
