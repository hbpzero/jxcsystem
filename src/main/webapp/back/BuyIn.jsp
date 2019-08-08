<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <base href="http://localhost:8080/jxcsystem/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<form role="form" class="form-inline">
    <div class="form-group">
        <label for="purtoNo">流水号</label>
        <input type="text" class="form-control" id="purtoNo" readonly>
    </div>
    <div class="form-group">
        <label for="purtoTime">申请日期</label>
        <input type="date" class="form-control" id="purtoTime" >
    </div>
    <div class="form-group">
        <label for="purtoAppMan">申请人</label>
        <input type="text" class="form-control" id="purtoAppMan" value="${user.userName}" readonly>
    </div>
    <div class="form-group">
        <label for="purtoAppDep">申请部门</label>
        <input type="text" class="form-control" id="purtoAppDep" value="采购部门" >
    </div>
    <div class="layui-form-item layui-form-text"style="">
        <label for="purtoExplain" class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" id="purtoExplain"></textarea>
        </div>
    </div>
</form>

<button id="btn">添加商品</button>
<table class="table">
    <caption></caption>
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品类型</th>
        <th>商品规格</th>
        <th>采购单价</th>
        <th>计量单位</th>
        <th>采购数量</th>
        <th>小计</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">
    </tbody>
</table>
<button id="submit">提交订单</button>
</body>
<script>
    $(function () {
        getday();
        getRandomNo();
    })



    var goodsinfo;//存放商品信息
    var num=0;//区分到底是第几行
    //点击添加商品时
    $("#btn").click(function(){
        var tr="<tr>"
        tr+="<td></td>";
        tr+="<td><select class='goodsname'><option>--选择商品--</option></select></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td><input id='purdeNum' class='num' value='0'></td>";
        tr+="<td>0</td>";
        tr+="<td><button class='btn'>删除</button></td>";
        tr+="</tr>";
        //新增的tr追加到
        $("#mytbd").append(tr)
        getGoods()
    });
    $("#submit").click(function () {
        var purtoNo=$("#purtoNo").val();
        var purtoAppDep=$("#purtoAppDep").val();
        var purtoAppMan=$("#purtoAppMan").val();
        var purtoTime=$("#purtoTime").val();
        var purtoExplain=$("#purtoExplain").val();
        var goods=new Array();
        var purtoPrices=0
        $("#mytbd tr").each(function () {
            var good=new Object();
            good.goodsNo=$(this).find("td").eq(0).text();
            good.purtoNo=$("#purtoNo").val();
            good.purdeNum=$(this).find("input").val();
            good.purdeSub=$(this).find("td").eq(7).text();
            purtoPrices=parseFloat(purtoPrices)+parseFloat(good.purdeSub);
            goods.push(good);
        })
        var jsonstr={"purtoNo":purtoNo,"purtoAppDep":purtoAppDep,"purtoAppMan":purtoAppMan,"purtoTime":purtoTime,"purtoPrices":purtoPrices,"purtoExplain":purtoExplain,"goods":goods};
       // alert(JSON.stringify(jsonstr));
        if(confirm("确认提交?")){
            $.ajax({
                url: "pur/addPur",
                type: "post",
                contextType:"application/json",
                contentType : 'application/json',
                data: JSON.stringify(jsonstr),
                dataType: "text",
                success:function (data) {
                    if (data=="true"){
                        alert("提交成功,等待审核");
                        getRandomNo();
                        $("#mytbd").html("");
                        num=0;
                    } else{
                        alert("失败");
                    }

                }
            })
        }
    })
    function getGoods(){
        $.ajax({
            url:"goods/selectGoods",
            type:"post",
            dataType:"json",
            success:function(data) {
                goodsinfo=data.list;
                //清空下拉框中的子元素


                for (var i=0;i<data.list.length;i++) {
                    var option = "<option value='" + data.list[i].goodsNo + "'>" + data.list[i].goodsName + "</option>";
                    $("#mytbd .goodsname").eq(num).append(option);//当前行只会影响，不会影响其他行

                }
                num++;//每添一行num自增1

            }
        })
    }
    $("#mytbd").on("change",".goodsname",function(){
        //循环进行匹配
        for(var i in goodsinfo){
            if($(this).val()==goodsinfo[i].goodsNo){
                //$(this).parent().prev().text();
                // $(this).parent().next().text(goodsinfo[i].typeName);
                $(this).parent().parent().children("td").eq(0).text(goodsinfo[i].goodsNo);
                $(this).parent().parent().children("td").eq(2).text(goodsinfo[i].goodsTypeName);
                $(this).parent().parent().children("td").eq(3).text(goodsinfo[i].goodsSize);
                $(this).parent().parent().children("td").eq(4).text(goodsinfo[i].proPrice);
                $(this).parent().parent().children("td").eq(5).text(goodsinfo[i].unit);
            }

        }

    })


    $("#mytbd").on("keyup",".num",function(){
        // alert($(this).parent().parent().children("td").eq(4).text());
        // alert($(this).val());
       var price=$(this).parent().parent().children("td").eq(4).text();
       var number=$(this).val();
       var totalprice= $("#purtoPrices").val();
       var sub=price*number;
       $(this).parent().parent().children("td").eq(7).text(sub);
       var total=parseFloat(sub)+parseFloat(totalprice)
       //$("#purtoPrices").val(total);


    })
    // $("#mytbd").on("change",".price",function(){
    //     // alert($(this).parent().parent().children("td").eq(4).text());
    //     // alert($(this).val());
    //     var totalprice=$("#purtoPrices").val();
    //     var newprice=$(this).val()
    //     var total=totalprice+newprice
    //     $("#purtoPrices").val(total);
    //
    // })

    //删除
    $("#mytbd").on("click",".btn",function(){
        if(confirm("是否删除?")) {
            // var totalprice= $("#purtoPrices").val();
            // var price=$(this).parent().parent().children("td").eq(7).text();
            // var total=parseFloat(totalprice)-parseFloat(price);
            // $("#purtoPrices").val(total);
            $(this).parent().parent().remove();
            num--;
        }

    })
    function getday() {
        var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + "-" + (month) + "-" + (day);
        $('#purtoTime').val(today);
    }
    function getRandomNo() {
        var random_no = "";
        var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var year =time.getFullYear()
        random_no+=year+month+day;
        for (var i = 0; i < 6; i++)
        {
            random_no += Math.floor(Math.random() * 10);
        }
        $('#purtoNo').val(random_no);

    }
</script>
</html>
