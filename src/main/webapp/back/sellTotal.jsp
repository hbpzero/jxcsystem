
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <base href="http://localhost:8080/jxcsystem/"></base>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"></link>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</head>
<body>





<%--<form id="myform">
    <fieldset>
        <legend>添加学生</legend>
        学号:<input id="stuid" name="stuid"/>
        姓名:<input id="sname" name="sname"/>
        班级:<select id="claid" name="claid"></select>
        <button id="btn">添加</button>

    </fieldset>

</form>--%>

<table class="table table-striped">
    <thead>
    <tr>
        <th>销售编号</th>
        <th>销售时间</th>
        <th>销售客户</th>
        <th>操作人</th>
        <th>说明</th>
        <th>订单状况</th>
        <th>销售总价</th>
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
                    修改审核信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform2">
                    <input class="selltoNo" name="selltoNo" placeholder="销售编号" readonly/><br/>
                    <input class="selltoTime" name="selltoTime" placeholder="销售时间"/><br/>
                    <input class="selltoClient" name="selltoClient" placeholder="销售客户" readonly/><br/>
                    <input class="selltoMan" name="selltoMan" placeholder="操作人" readonly/><br/>
                    <input class="selltoExplain" name="selltoExplain" placeholder="说明" readonly/><br/>
                    <%--<input class="selltoOrdSta" name="selltoOrdSta" placeholder="订单状况" /><br/>--%>

                    <input class="selltoOrdSta" name="selltoOrdSta" placeholder="订单状况" readonly value="已审核"/><br/>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateconfirm">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->


</body>
</html>
<script>
    $(function(){
        query(1,5);
        /*selectTal();*/
    })


    function selectTal(){
        $.ajax({
            url: "selectState",
            type: "post",
            dataType: "json",
            success: function (data) {

                for (var i = 0; i < data.length; i++) {
                    //option:value（提交到服务器），text(用户直观看到的)
                    var option = "<option value=" + data[i].state + ">" + data[i].state + "</option>";
                    $("#selltoOrdSta").append(option);
                    $("#myform2 select").append(option);
                }
            }
        });
    }


    var dataPage;
    function query(pages,pageSize){
        $.ajax({
            url:"selectTal",
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
                    tr+="<td>"+datelist[i].selltoNo+"</td>";
                    tr+="<td>"+datelist[i].selltoTime+"</td>";
                    tr+="<td>"+datelist[i].selltoClient+"</td>";
                    tr+="<td>"+datelist[i].selltoMan+"</td>";
                    tr+="<td>"+datelist[i].selltoExplain+"</td>";
                    tr+="<td>"+datelist[i].selltoOrdSta+"</td>";
                    tr+="<td>"+datelist[i].selltoPrices+"</td>";
                    tr+=
                        "<td><button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">修改</button>" +
                        "</td>";
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

        });

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


    function delStu(id) {
        $.ajax({
            url:"delStu",
            type:"post",
            //传递的是一个json字符串（所以是k-v的方式）
            data:{"id":id},
            dataType:"json",
            success:function (data) {
                query();
            }

        })


    }

    //点击修改时需要将数据填充到form中
    $("#mytbd").on("click",".update",function () {
        //节点
        $(".selltoNo").val($(this).parent().parent().find("td").eq(0).html());
        $(".selltoTime").val($(this).parent().parent().find("td").eq(1).html());
        $(".selltoClient").val($(this).parent().parent().find("td").eq(2).html());
        $(".selltoMan").val($(this).parent().parent().find("td").eq(3).html());
        $(".selltoExplain").val($(this).parent().parent().find("td").eq(4).html());
        /*$(".selltoOrdSta").val($(this).parent().parent().find("td").eq(5).html());*/
        $(".selltoPrices").val($(this).parent().parent().find("td").eq(6).html());


    })

    //点击确定修改按钮时，提交表单
    updateconfirm.onclick=function(){
        if(confirm("确认修改?")){
            $.ajax({
                url:"updateTal",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                dataType:"text",
                success:function(data){
                    if (data=="success") {
                        query();
                        $('#myModal').modal('hide');
                    }
                }
            })
        }
    }
</script>