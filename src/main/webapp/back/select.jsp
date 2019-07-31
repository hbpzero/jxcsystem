<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <base href="http://localhost:8080/jxcsystem/">
    <title>查找</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"></link>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<table class="table table-hover">
    <thead>
    <tr>
        <th>供应商ID</th>
        <th>供应商编号</th>
        <th>名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>地址</th>
        <th>邮箱</th>
        <th>开户账户</th>
        <th>开户账号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">
    </tbody>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改供应商信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform2">
                    <input class="vendorId" name="vendorId" placeholder="供应商ID" readonly/><br/>
                    <input class="vendorNo" name="vendorNo" placeholder="供应商编号"/><br/>
                    <input class="vendorName" name="vendorName" placeholder="名称"/><br/>
                    <input class="contact" name="contact" placeholder="联系人"/><br/>
                    <input class="contactPhone" name="contactPhone" placeholder="联系电话"/><br/>
                    <input class="vendorAddress" name="vendorAddress" placeholder="地址"/><br/>
                    <input class="vendorPostbox" name="vendorPostbox" placeholder="邮箱"/><br/>
                    <input class="vendorBank" name="vendorBank" placeholder="开户账户"/><br/>
                    <input class="vendorBankId" name="vendorBankId" placeholder="开户账号"/><br/>

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
</div>
<script>
    $(function(){
        query();
    })
    function query(){
        $.ajax({
            url:"query",
            type:"post",
            dataType:"json",
            success:function(data) {
                $("#mytbd").html("");
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr>"

                    tr += "<td>" + data[i].vendorId + "</td>";
                    tr += "<td>" + data[i].vendorNo + "</td>";
                    tr += "<td>" + data[i].vendorName + "</td>";
                    tr += "<td>" + data[i].contact + "</td>";
                    tr += "<td>" + data[i].contactPhone + "</td>";
                    tr += "<td>" + data[i].vendorAddress + "</td>";
                    tr += "<td>" + data[i].vendorPostbox + "</td>";
                    tr += "<td>" + data[i].vendorBank + "</td>";
                    tr += "<td>" + data[i].vendorBankId + "</td>";
                    tr +="<td><button onclick=delVen("+data[i].vendorId+") type=\"button\" class='btn btn-primary btn-lg ' >删除</button>" +
                        "<button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">修改</button>" +
                        "</td>";
                    tr += "</tr>";
                    $("#mytbd").append(tr);

                }
            }

        });
    }
    function delVen(val){
        $.ajax({
            url:"delstu",
            type:"post",
            data:{"vendorId":val},
            dataType:"json",
            success:function(data){
                //重新执行一次查询，刷新页面
                query();
            }
        })
    }
    $("#mytbd").on("click",".update",function(){
        //节点
        $(".vendorId").val($(this).parent().parent().find("td").eq(0).html());
        $(".vendorNo").val($(this).parent().parent().find("td").eq(1).html());
        $(".vendorName").val($(this).parent().parent().find("td").eq(2).html());
        $(".contact").val($(this).parent().parent().find("td").eq(3).html());
        $(".contactPhone").val($(this).parent().parent().find("td").eq(4).html());
        $(".vendorAddress").val($(this).parent().parent().find("td").eq(5).html());
        $(".vendorPostbox").val($(this).parent().parent().find("td").eq(6).html());
        $(".vendorBank").val($(this).parent().parent().find("td").eq(7).html());
        $(".vendorBankId").val($(this).parent().parent().find("td").eq(8).html());
    })
    // 点击确认修改按钮时，提交表单
    updateconfirm.onclick=function(){
        if(confirm("确认修改?")){
            $.ajax({
                url:"updates",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                dataType:"json",
                success:function(data){
                    query();
                    $('#myModal').modal('hide');
                }
            })
        }
    }

</script>


</body>

</html>
