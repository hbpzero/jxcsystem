<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/29
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>销售申请</title>
    <base href="http://localhost:8080/jxcsystem/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js"></script>
</head>
<body>
<button id="submit">提交</button>
<form role="form" class="form-inline">
    <div class="form-group">
        <label for="selltoNo">销售编号</label>
        <input type="text" class="form-control" id="selltoNo" readonly>
    </div>
    <div class="form-group">
        <label for="selltoTime">销售时间</label>
        <input type="text" class="form-control" id="selltoTime" >
    </div>
    <div class="form-group">
        <label for="selltoClient">销售客户</label>
        <input type="text" class="form-control" id="selltoClient" >
    </div>
    <div class="form-group">
        <label for="selltoMan">操作人</label>
        <input type="text" class="form-control" id="selltoMan" value="${userInfo.userName}" readonly>
    </div>
    <div class="form-group">
        <label for="selltoExplain">说明</label>
        <input type="text" class="form-control" id="selltoExplain" >
    </div>
    <div class="form-group">
        <label for="selltoOrdSta">订单状况</label>
        <input type="text" class="form-control" id="selltoOrdSta" value="未审核" readonly>
    </div>
    <div class="form-group">
        <label for="selltoPrices">销售总价</label>
        <input type="text" class="form-control" id="selltoPrices" >
    </div>
</form>
<button id="btn">添加商品</button>
<table  class="table">
    <thead>
    <tr>

        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品类别</th>
        <th>商品规格</th>
        <th>采购单价</th>
        <th>销售单价</th>
        <th>建议零售价</th>
        <th>产地</th>
        <th>计量单位</th>
        <th>销售编号</th>
        <th>销售数量</th>
        <th>小计</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">


    </tbody>

</table>


</body>
</html>
<script>
    var num=0;//区分到底是第几行
    //点击添加商品时
    $("#btn").click(function(){
        var tr="<tr>"
        tr+="<td></td>";
        tr+="<td><select class='goodsName'><option>--选择商品--</option></select></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td><input size='3'></td>";
        tr+="<td>0</td>";

        tr+="<td><button class='btn'>删除</button></td>";
        tr+="</tr>";
        //新增的tr追加到
        $("#mytbd").append(tr)
        getGoods();
    });


    //动态读取商品信息
    var goodsinfo;
    function getGoods(){
        $.ajax({
            url:"selectGoods",
            //contextType:"application/json",
            type:"post",
            dataType:"json",
            success:function(data) {
                goodsinfo=data;
                //清空下拉框中的子元素

                for (var i in data) {
                    var option = "<option value='" + data[i].goodsNo + "'>" + data[i].goodsName + "</option>";
                    $("#mytbd .goodsName").eq(num).append(option);//当前行只会影响，不会影响其他行

                }
                num++;//每添一行num自增1

            }
        })
    }
    //因为下拉框时动态生成的，所有不能直接使用change,B必须使用事件绑定
    //下拉框改变时，将对应的商品信息查询出来记载到对应的td中
    $("#mytbd").on("change",".goodsName",function(){
        //循环进行匹配
        for(var i in goodsinfo){
            if($(this).val()==goodsinfo[i].goodsNo){
                //$(this).parent().prev().text();
                // $(this).parent().next().text(goodsinfo[i].typeName);
                $(this).parent().parent().children("td").eq(0).text(goodsinfo[i].goodsNo);
                $(this).parent().parent().children("td").eq(2).text(goodsinfo[i].goodsTypeName);
                $(this).parent().parent().children("td").eq(3).text(goodsinfo[i].goodsSize);
                $(this).parent().parent().children("td").eq(4).text(goodsinfo[i].proPrice);
                $(this).parent().parent().children("td").eq(5).text(goodsinfo[i].salePrice);
                $(this).parent().parent().children("td").eq(6).text(goodsinfo[i].srPrice);
                $(this).parent().parent().children("td").eq(7).text(goodsinfo[i].goodsPlace);
                $(this).parent().parent().children("td").eq(8).text(goodsinfo[i].unit);
                $(this).parent().parent().children("td").eq(9).text(goodsinfo[i].selltoNo);

            }

        }

    })

    //删除
    $("#mytbd").on("click",".btn",function(){
        if(confirm("是否删除?")) {
            $(this).parent().parent().remove();
            num--;
        }

    })

    $("#mytbd").on("keyup","input",function(){
        var proPrice= $(this).parent().prev().prev().prev().prev().prev().prev().text();
        var selldeNum= $(this).val();
        $(this).parent().next().text(proPrice*selldeNum);
    })



    //提交按钮
    $("#submit").click(function () {
        var selltoNo=$("#selltoNo").val();
        var selltoTime=$("#selltoTime").val();
        var selltoClient=$("#selltoClient").val();
        var selltoMan=$("#selltoMan").val();
        var selltoExplain=$("#selltoExplain").val();
        var selltoOrdSta=$("#selltoOrdSta").val();
        var selltoPrices=$("#selltoPrices").val();
        var goodsarr=new Array();
        $("#mytbd tr").each(function () {
            var goods=new Object();
            goods.goodsNo=$(this).children("td").eq(0).text();
            goods.selltoNo=selltoNo;
            goods.selldeNum=$(this).find("input").val();
            goods.selldeSub=$(this).children("td").eq(11).text();
            goodsarr.push(goods);

        })
        var jsonstr={"selltoNo":selltoNo,"selltoTime":selltoTime,"selltoClient":selltoClient,"selltoMan":selltoMan,"selltoExplain":selltoExplain,"selltoOrdSta":selltoOrdSta,"selltoPrices":selltoPrices,"goods":goodsarr}
        alert(JSON.stringify(jsonstr))
        $.ajax({
            url:"applyOrder",
            type:"post",
            contentType:"application/json",
            data:JSON.stringify(jsonstr),
            success:function(data){
                if(data=="true"){
                    alert("提交成功，等待审核");
                    $("#submit").prop("disabled",true);
                }
                else{
                    alert("提交失败");
                }

            }

        })
    })
    //页面加载时
    $(function(){
        $.ajax({
            url:"getNo",
            type:"post",
            dataType:"text",
            success:function(data){
                $("#selltoNo").val(data);
            }

        })

    })
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#selltoTime' //指定元素
        });
    });
</script>
