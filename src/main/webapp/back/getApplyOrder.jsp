<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/1
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售出库</title>
    <base href="http://localhost:8080/jxcsystem/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js"></script>
</head>
<body>
<!-- 已经销售完成的订单读取过来 -->
<div class="panel panel-default">
    <div class="panel-heading">销售单</div>
    <div class="panel-body">
      <table class="table">
            <thead>
              <th>销售编号</th>
              <th>销售时间</th>
              <th>销售客户</th>
              <th>操作人</th>
              <th>说明</th>
              <th>订单状况</th>
              <th>销售总价</th>
            <th>操作</th>
            </thead>
          <tbody id="mytbd"></tbody>
      </table>
    </div>
</div>
<hr/>
<div class="panel panel-default">
  <div class="panel-body">
      <button id="submit">提交</button>
      <form role="form" class="form-inline">
          <div class="form-group">
              <label for="outtoNo">流水号</label>
              <input type="text" class="form-control" id="outtoNo" readonly>
          </div>
          <div class="form-group">
              <label for="outtoTime">出库日期</label>
              <input type="text" class="form-control" id="outtoTime" >
          </div>
          <div class="form-group">
              <label for="outtoMan">操作人</label>
              <input type="text" class="form-control" id="outtoMan" value="${userInfo.userName}" readonly>
          </div>
          <div class="form-group">
              <label for="outtoShiUnit">发货单位</label>
              <input type="text" class="form-control" id="outtoShiUnit" >
          </div>
          <div class="form-group">
              <label for="outtoAuResult">出库订单状态</label>
              <input type="text" class="form-control" id="outtoAuResult" value="待出库" readonly>
          </div>

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
                  <th>实际销售数量</th>
                  <th>仓库编号</th>
                  <th>操作</th>

              </tr>
              </thead>
              <tbody id="mytbd3">


              </tbody>

          </table>

      </form>

  </div>

</div>




<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
              <table class="table">
                   <thead>
                      <tr>
                          <th>商品编号</th>
                          <th>商品名称</th>
                          <th>销售编号</th>
                          <th>销售数量</th>
                          <th>验收数量</th>
                          <th>操作</th>
                      </tr>

                   </thead>
                  <tbody id="mytbd2"></tbody>

              </table>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭

                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>

</html>
<script>
    function selectSell(){

     $.ajax({
          url:"getApplySuccessOrder",
           type:"post",
           dataType:"json",
          success:function(data){
           for(var i in data) {
               var tr = "<tr>"
               tr += "<td>"+data[i].selltoNo+"</td>"
               tr += "<td>"+data[i].selltoTime+"</td>"
               tr += "<td>"+data[i].selltoClient+"</td>"
               tr += "<td>"+data[i].selltoMan+"</td>"
               tr += "<td>"+data[i].selltoExplain+"</td>"
               tr += "<td>"+data[i].selltoOrdSta+"</td>"
               tr += "<td>"+data[i].selltoPrices+"</td>"
               tr += "<td><button class='btn btn-sm getDetaiOrder' data-toggle='modal' data-target='#myModal' >查看订单详情</button></td>"
               tr += "</tr>";
               $("#mytbd").append(tr);
           }
           }
     })
    }

     function selectWarehouse(){
         $.ajax({
             url: "getwarehouse",
             type: "post",
             dataType: "json",
             success: function (data) {

                 for (var i = 0; i < data.length; i++) {
                     //option:value（提交到服务器），text(用户直观看到的)
                     var option = "<option value=" + data[i].warehouseId + ">" + data[i].wareAddress + "</option>";
                     $("#getwarehouse").append(option);

                 }
             }
         });
     }


   //点击查看你详情时,查询当前订单具体的信息
     var goodsinfo;
     $("#mytbd").on("click",".getDetaiOrder",function(){
           $.ajax({
                url:"detailSuccessOrder",
                type:"post",
                data:{"selltoNo":$(this).parent().parent().children("td").eq(0).text()},
               dataType:"json",
                 success:function(data){
                     $("#mytbd2").empty();
                     goodsinfo=data;
                    for(var i in data){
                          var tr="<tr>"
                            tr+="<td>"+data[i].goodsNo+"</td>"
                         tr+="<td>"+data[i].goodsName+"</td>"
                        tr+="<td>"+data[i].selltoNo+"</td>"
                        tr+="<td>"+data[i].selldeNum+"</td>"
                         tr+="<td><input size='3'/></td>"
                        tr+="<td><button class='btn btn-xs btnAdd'>确认</button></td>"
                           tr+="</tr>"
                        $("#mytbd2").append(tr);

                    }
                     $("#mytbd3 tr").each(function(){
                         var goodsNo=$(this).children("td").eq(0).text();
                         var selltoNo=$(this).children("td").eq(9).text();
                         $("#mytbd2 tr").each(function(){
                             var goodsNo2=$(this).children("td").eq(0).text();
                             var selltoNo2=$(this).children("td").eq(2).text();
                             if(goodsNo==goodsNo2 && selltoNo==selltoNo2){
                                 $(this).find("button").prop("disabled",true)
                             }

                         })

                     })

                 }

           })

     })

  //点击确认按钮将商品信息添加到入库单中
  $("#mytbd2").on("click",".btnAdd",function(){
      $("#mytbd3").empty();
      for(var i in goodsinfo){

           if(goodsinfo[i].goodsNo==$(this).parent().parent().children("td").eq(0).text()){
                 var tr="<tr>"
                  tr+="<td>"+goodsinfo[i].goodsNo+"</td>"
               tr+="<td>"+goodsinfo[i].goodsName+"</td>"
               tr+="<td>"+goodsinfo[i].goodsTypeName+"</td>"
               tr+="<td>"+goodsinfo[i].goodsSize+"</td>"
               tr+="<td>"+goodsinfo[i].proPrice+"</td>"
               tr+="<td>"+goodsinfo[i].salePrice+"</td>"
               tr+="<td>"+goodsinfo[i].srPrice+"</td>"
               tr+="<td>"+goodsinfo[i].goodsPlace+"</td>"
               tr+="<td>"+goodsinfo[i].unit+"</td>"
               tr+="<td>"+goodsinfo[i].selltoNo+"</td>"
               tr+="<td>"+goodsinfo[i].selldeNum+"</td>"
               tr+="<td>"+$(this).parent().prev().find("input").val()+"</td>"
               tr+="<td><select  id='getwarehouse' class='getwarehouse'></select></td>"
               tr+="<td><button class='btn'>删除</button></td>";
                  tr+="</tr>";
                 $("#mytbd3").append(tr);
                 $(this).prop("disabled",true);


           }

      }
      selectWarehouse();
  })



     //提交按钮
     $("#submit").click(function () {
         var outtoNo=$("#outtoNo").val();
         var outtoTime=$("#outtoTime").val();
         var outtoMan=$("#outtoMan").val();
         var outtoShiUnit=$("#outtoShiUnit").val();
         var outtoAuResult=$("#outtoAuResult").val();

         var goodsarr=new Array();
         $("#mytbd3 tr").each(function () {
             var goods=new Object();
             goods.goodsNo=$(this).children("td").eq(0).text();
             goods.outtoNo=outtoNo;
             goods.warehouseId=$(this).find("select").val();
             goods.outdeActNum=$(this).children("td").eq(11).text();
             goods.outdeNum=$(this).children("td").eq(10).text();
             goodsarr.push(goods);


         })

         $.ajax({
             url:"selectWHTotal",
             type:"post",
             dataType:"json",
             success:function (data) {
                 for (var i in data){
                     if (goodsarr[i].outdeActNum < data[i].wGoodsNum){
                         alert("超出库存");
                     }else {
                         var num=data[i].wGoodsNum-goodsarr[i].outdeActNum;
                         updatewGoodsNum(num);
                     }
                 }

             }
         })

         function updatewGoodsNum(num) {

             $.ajax({
                 url:"updatewGoodsNum",
                 type:"post",
                 dataType:"json",
                 success:function (data) {


                 }
             })

         }
         var jsonstr={"outtoNo":outtoNo,"outtoTime":outtoTime,"outtoMan":outtoMan,"outtoShiUnit":outtoShiUnit,"outtoAuResult":outtoAuResult,"goods":goodsarr}
         /*alert(JSON.stringify(jsonstr))*/
         $.ajax({
             url:"applyOrderOuttotal",
             type:"post",
             contentType:"application/json",
             data:JSON.stringify(jsonstr),
             success:function(data){
                 if(data=="true"){
                     alert("提交成功，等待审核");
                     $("#submit").prop("disabled",true);
                     /*getNoOuttotal();*/
                 }
                 else{
                     alert("提交失败");
                 }

             }

         })
     })


    //页面加载时
     $(function(){
         /*getNoOuttotal();*/
         selectSell();
     })

    function getNoOuttotal(){

    $.ajax({
        url:"getNoOuttotal",
        type:"post",
        dataType:"text",
        success:function(data){
            $("#outtoNo").val(data);
        }

    })
    }


    layui.use('laydate', function(){
         var laydate = layui.laydate;

         //执行一个laydate实例
         laydate.render({
             elem: '#outtoTime' //指定元素
         });
     });
</script>