<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/1
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="http://localhost:8080/jxcsystem/"></base>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <td>出库总单编号</td>
        <td>出库时间</td>

        <td>操作人</td>
        <td>发货单位</td>
        <td>出库订单状态</td>

        <td>操作</td>
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
                        出库详情
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="myform2">
                        <input class="outtoNo" name="outtoNo" placeholder="出库总单编号" readonly/><br/>
                        <input class="outtoTime" name="outtoTime" placeholder="出库时间"/><br/>
                        <input class="outtoMan" name="outtoMan" placeholder="操作人" readonly/><br/>
                        <input class="outtoShiUnit" name="outtoShiUnit" placeholder="发货单位" readonly/><br/>
                        <input class="outtoAuResult" name="outtoAuResult" placeholder="出库订单状态" readonly value="已出库"/><br/>
                        <%--<input class="selltoOrdSta" name="selltoOrdSta" placeholder="订单状况" /><br/>--%>




                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="updateconfirm">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
</body>
</html>

<script>
    
    /*function getWHTnum() {
        $.ajax({

            url:"selectWHTotal",
            type:"post",
            dataType:"json",
            success:function (data) {
                var WHTnum=data;
            }
        })
    }*/
    
    
    
    var dataPage;
    function getOrder(pages,pageSize){
        $.ajax({
            url:"selectOuttotal",
            type:"post",
            dataType:"json",
            data:{"pageNum":pages,"pageSize":pageSize},
            success:function(data){
                //每次加载之前清空表格中的内容
                $("#mytbd").html("");
                dataPage=data;
                var datelist=data.list;
                for(var i in datelist){

                    var tr="<tr>"
                    tr+="<td>"+datelist[i].outtoNo+"</td>";
                    tr+="<td>"+datelist[i].outtoTime+"</td>";
                    tr+="<td>"+datelist[i].outtoMan+"</td>";
                    tr+="<td>"+datelist[i].outtoShiUnit+"</td>";
                    tr+="<td>"+datelist[i].outtoAuResult+"</td>";

                    tr+=
                        "<td><button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">出库</button>" +
                        "</td>";
                    tr+="</tr>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);

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
        getOrder(dataPage.nextPage,$("#pageSize").val());
    })
    $("#prevPage").click(function(){
        //将上一页的页码传到服务器
        getOrder(dataPage.prePage,$("#pageSize").val());
    })

    $("#pageSize").change(function(){
        getOrder(dataPage.pageNum,$("#pageSize").val());

    })



    $(function(){
        getOrder(1,5);
    })

    //点击修改时需要将数据填充到form中
    $("#mytbd").on("click",".update",function () {
        //节点
        $(".outtoNo").val($(this).parent().parent().find("td").eq(0).html());
        $(".outtoTime").val($(this).parent().parent().find("td").eq(1).html());
        $(".outtoMan").val($(this).parent().parent().find("td").eq(2).html());
        $(".outtoShiUnit").val($(this).parent().parent().find("td").eq(3).html());
        $(".selltoExplain").val($(this).parent().parent().find("td").eq(4).html());
        /*$(".selltoOrdSta").val($(this).parent().parent().find("td").eq(5).html());*/


    })

    function OutSellState(outtoNo){
        $.ajax({
            url:"updateOutSellState",
            type:"post",
            data:{"selltoNo":outtoNo},
            dataType:"json",
            sueecss:function (data) {

            }
        })
    }

    //点击确定修改按钮时，提交表单
    updateconfirm.onclick=function(){
        outSellNo=$("#myform2").find("input").eq(0).val();
        if(confirm("确认修改?")){
            $.ajax({
                url:"updateOuttotal",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                dataType:"text",
                success:function(data){
                    if(data=="success") {
                        OutSellState(outSellNo);
                        alert(outSellNo);
                        getOrder(1, 5);
                        $('#myModal').modal('hide');
                    }
                    }
            })
        }
    }




</script>
