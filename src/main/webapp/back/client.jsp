
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <base href="http://localhost:8080/jxcsystem/">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</head>
<body>
<!-- 模态框（Modal） -->
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改学生信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform2">
                    <fieldset>
                    学号:<input name="stuid" class="stuid" readonly/>
                    姓名:<input name="sname" class="sname" />
                        班级：<select name="claid"></select>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button id="updateconfirm" type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>--%>




<form id="myform">
    <fieldset>
        <legend>添加客户</legend>
        客户编号:<input id="cliNo" name="cliNo"/>
        名称:<input id="cliName" name="cliName"/>
        联系人:<input id="cliMan" name="cliMan"/>
        联系电话:<input id="cliPhone" name="cliPhone"/>
        地址:<input id="cliAddress" name="cliAddress"/>
        邮箱:<input id="cliPostbox" name="cliPostbox"/>
        开户银行:<input id="cliBank" name="cliBank"/>
        开户账号:<input id="cliBankId" name="cliBankId"/>

        <button id="btn">添加</button>

    </fieldset>

</form>

<table class="table table-striped">
    <thead>
    <tr>
        <th>客户ID</th>
        <th>客户编号</th>
        <th>名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>地址</th>
        <th>邮箱</th>
        <th>开户银行</th>
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
                    修改学生信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform2">
                    客户ID:<input class="cliId" name="cliId" readonly/><br/>
                    客户编号:<input class="cliNo" name="cliNo"/><br/>
                    名称:<input class="cliName" name="cliName"/><br/>
                    联系人:<input class="cliMan" name="cliMan"/><br/>
                    联系电话:<input class="cliPhone" name="cliPhone"/><br/>
                    地址:<input class="cliAddress" name="cliAddress"/><br/>
                    邮箱:<input class="cliPostbox" name="cliPostbox"/><br/>
                    开户银行:<input class="cliBank" name="cliBank"/><br/>
                    开户账号:<input class="cliBankId" name="cliBankId"/><br/>

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
        query();

    })




    //    添加客户
    btn.onclick=function () {
        $.ajax({
            url:"addClient",
            type:"post",
            data:$("#myform").serialize(),
            dataType:"json",
            success:function(data){
                query();
            }

        })
    }





    function query(){
        $.ajax({
            url:"selectClient",
            type:"post",
            dataType:"json",
            success:function(data){
                //每次加载之前清空表格中的内容
                $("#mytbd").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].cliId+"</td>";
                    tr+="<td>"+data[i].cliNo+"</td>";
                    tr+="<td>"+data[i].cliName+"</td>";
                    tr+="<td>"+data[i].cliMan+"</td>";
                    tr+="<td>"+data[i].cliPhone+"</td>";
                    tr+="<td>"+data[i].cliAddress+"</td>";
                    tr+="<td>"+data[i].cliPostbox+"</td>";
                    tr+="<td>"+data[i].cliBank+"</td>";
                    tr+="<td>"+data[i].cliBankId+"</td>";
                    tr+="<td><button onclick='delClient("+data[i].cliId+")' type=\"button\" class='btn btn-primary btn-lg ' >删除</button>" +
                        "<button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">修改</button>" +
                        "</td>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);
                }
            }

        });

    }
    function delClient(id) {
        $.ajax({
            url:"delClient",
            type:"post",
            //传递的是一个json字符串（所以是k-v的方式）
            data:{"id":id},
            dataType:"json",
            success:function(data){
                query();
            }

        })


    }

    //点击修改时需要将数据填充到form中
    $("#mytbd").on("click",".update",function () {
        //节点
        $(".cliId").val($(this).parent().parent().find("td").eq(0).html());
        $(".cliNo").val($(this).parent().parent().find("td").eq(1).html());
        $(".cliName").val($(this).parent().parent().find("td").eq(2).html());
        $(".cliMan").val($(this).parent().parent().find("td").eq(3).html());
        $(".cliPhone").val($(this).parent().parent().find("td").eq(4).html());
        $(".cliAddress").val($(this).parent().parent().find("td").eq(5).html());
        $(".cliPostbox").val($(this).parent().parent().find("td").eq(6).html());
        $(".cliBank").val($(this).parent().parent().find("td").eq(7).html());
        $(".cliBankId").val($(this).parent().parent().find("td").eq(8).html());
    })

    //点击确定修改按钮时，提交表单
    updateconfirm.onclick=function(){
        if(confirm("确认修改?")){
            $.ajax({
                url:"updateClient",
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