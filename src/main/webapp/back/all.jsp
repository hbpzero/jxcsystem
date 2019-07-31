<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/18
  Time: 19:37
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
<div class="table-responsive">
    <table class="table">
        <caption></caption>
        <thead>
        <tr>
            <th>员工编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>身份证号</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>住址</th>
            <th>籍贯</th>
            <th>民族</th>
            <th>学历</th>
            <th>毕业院校</th>
            <th>银行卡号</th>
            <th>开户银行</th>
            <th>员工角色</th>
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
                        新员工信息
                    </h4>
                </div>
                <div class="modal-body" >
                    <form method="post" id="newUser" style="text-align: left">
                        员工编号:&nbsp&nbsp&nbsp<input type="text" name="userNo" id="userNo"><br/><br/>
                        姓名:&nbsp&nbsp&nbsp<input type="text" name="userName" id="userName"><br/><br/>
                        性别:&nbsp&nbsp&nbsp<select id="userSex" name="userSex" >
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select><br/><br/>
                        身份证号:&nbsp&nbsp&nbsp<input type="text" name="userIdCard" id="userIdCard"><br/><br/>
                        电话:&nbsp&nbsp&nbsp<input type="text" name="userPhone" id="userPhone"><br/><br/>
                        邮箱:&nbsp&nbsp&nbsp<input type="text" name="userPostbox" id="userPostbox"><br/><br/>

                        住址:&nbsp&nbsp&nbsp<input type="text" name="userAddress" id="userAddress"><br/><br/>
                        籍贯:&nbsp&nbsp&nbsp<input type="text" name="userPlace" id="userPlace"><br/><br/>
                        民族:&nbsp&nbsp&nbsp<input type="text" name="userNative" id="userNative"><br/><br/>
                        学历:&nbsp&nbsp&nbsp<input type="text" name="userEducation" id="userEducation"><br/><br/>
                        毕业院校:&nbsp&nbsp&nbsp<input type="text" name="userSchool" id="userSchool"><br/><br/>
                        银行卡号:&nbsp&nbsp&nbsp<input type="text" name="userBankId" id="userBankId"><br/><br/>
                        开户银行:&nbsp&nbsp&nbsp<input type="text" name="userBank" id="userBank"><br/><br/>
                        密码:&nbsp&nbsp&nbsp<input type="text" name="userPassword" id="userPassword"><br/><br/>
                        员工角色:&nbsp&nbsp&nbsp<select name="userRole" id="userRole"></select>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="addUser()">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                       编辑员工信息
                    </h4>
                </div>
                <div class="modal-body" >
                    <form method="post" id="editUser" style="text-align: left">
                        员工编号:&nbsp&nbsp&nbsp<input type="text" name="userNo" id="userNo2"><br/><br/>
                        姓名:&nbsp&nbsp&nbsp<input type="text" name="userName" id="userName2"><br/><br/>
                        性别:&nbsp&nbsp&nbsp<select id="userSex2" name="userSex" >
                        <option value="1">男</option>
                        <option value="0">女</option>
                        </select><br/><br/>
                        身份证号:&nbsp&nbsp&nbsp<input type="text" name="userIdCard" id="userIdCard2"><br/><br/>
                        电话:&nbsp&nbsp&nbsp<input type="text" name="userPhone" id="userPhone2"><br/><br/>
                        邮箱:&nbsp&nbsp&nbsp<input type="text" name="userPostbox" id="userPostbox2"><br/><br/>
                        住址:&nbsp&nbsp&nbsp<input type="text" name="userAddress" id="userAddress2"><br/><br/>
                        籍贯:&nbsp&nbsp&nbsp<input type="text" name="userPlace" id="userPlace2"><br/><br/>
                        民族:&nbsp&nbsp&nbsp<input type="text" name="userNative" id="userNative2"><br/><br/>
                        学历:&nbsp&nbsp&nbsp<input type="text" name="userEducation" id="userEducation2"><br/><br/>
                        毕业院校:&nbsp&nbsp&nbsp<input type="text" name="userSchool" id="userSchool2"><br/><br/>
                        银行卡号:&nbsp&nbsp&nbsp<input type="text" name="userBankId" id="userBankId2"><br/><br/>
                        开户银行:&nbsp&nbsp&nbsp<input type="text" name="userBank" id="userBank2"><br/><br/>
                        员工角色:&nbsp&nbsp&nbsp<select name="userRole" id="userRole2"></select>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="editUser()">
                        提交修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <button class="btn btn-primary btn-lg update" data-toggle="modal" data-target="#myModal" >新增员工 </button>

</div>

</body>
<script>
    //开头加载查询
    $(function () {
        query();
        queryClass();
    })
    //查询方法
    function query(){
        $.ajax({
            url: "user/queryAll",
            type: "post",
            dataType: "json",
            success: function (data) {
                //清空列表内容
                $("#mytbd").html("");
                for (var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].userNo+"</td>"
                    tr+="<td>"+data[i].userName+"</td>"
                    if(data[i].userSex==1){
                        tr+="<td>"+"男"+"</td>"
                    }else{
                        tr+="<td>"+"女"+"</td>"
                    }

                    tr+="<td>"+data[i].userIdCard+"</td>"
                    tr+="<td>"+data[i].userPhone+"</td>"
                    tr+="<td>"+data[i].userPostbox+"</td>"
                    tr+="<td>"+data[i].userAddress+"</td>"
                    tr+="<td>"+data[i].userPlace+"</td>"
                    tr+="<td>"+data[i].userNative+"</td>"
                    tr+="<td>"+data[i].userEducation+"</td>"
                    tr+="<td>"+data[i].userSchool+"</td>"
                    tr+="<td>"+data[i].userBankId+"</td>"
                    tr+="<td>"+data[i].userBank+"</td>"
                    tr+="<td>"+data[i].roleName+"</td>"

                    //button在点击时执行删除方法
                    tr+="<td><button type='button' class='btn btn-primary btn-lg' onclick=delUser("+data[i].userNo+")>删除</button><button class=\"btn btn-primary btn-lg\" data-toggle=\"modal\" data-target=\"#myModal2\" >编辑 </button></td>"
                    tr+="</tr>"
                    $("#mytbd").append(tr)

                }


            }
        })
    }
//删除员工
    function delUser(val) {
        if(confirm('确定要执行此操作吗?')){
            $.ajax({
                url: "user/del",
                type: "post",
                data:{"userNo":val},
                dataType: "text",
                success:function (data) {
                    if (data=="true"){
                        query()

                    }
                }
            })
        }

    }
//读取员工信息
    $("#mytbd").on("click",".update",function () {

        $("#editUser").find("input").eq(0).val($(this).parent().parent().find("td").eq(0).html());
        $("#editUser").find("input").eq(1).val($(this).parent().parent().find("td").eq(1).html());
        $("#editUser").find("input").eq(2).val($(this).parent().parent().find("td").eq(3).html());
        $("#editUser").find("input").eq(3).val($(this).parent().parent().find("td").eq(4).html());
        $("#editUser").find("input").eq(4).val($(this).parent().parent().find("td").eq(5).html());
        $("#editUser").find("input").eq(5).val($(this).parent().parent().find("td").eq(6).html());
        $("#editUser").find("input").eq(6).val($(this).parent().parent().find("td").eq(7).html());
        $("#editUser").find("input").eq(7).val($(this).parent().parent().find("td").eq(8).html());
        $("#editUser").find("input").eq(8).val($(this).parent().parent().find("td").eq(9).html());
        $("#editUser").find("input").eq(9).val($(this).parent().parent().find("td").eq(10).html());
        $("#editUser").find("input").eq(10).val($(this).parent().parent().find("td").eq(11).html());
        $("#editUser").find("input").eq(11).val($(this).parent().parent().find("td").eq(12).html());


    })

    //查询角色信息
    function queryClass() {
        $.ajax({
            url: "role/queryAll",
            type: "post",
            dataType: "json",
            success:function (data) {
               for (i=0;i<data.length;i++){
                   var content="<option value="+data[i].roleId+">"+data[i].roleName+"</option>"
                   $("#clazz").append(content)
                   $("#userRole").append(content)
                   $("#userRole2").append(content)
               }

            }
        })
    }
    //执行新增员工信息
    function addUser() {
        if(confirm("执行操作?")){
            $.ajax({
                url: "user/add",
                type: "post",
                data: $("#newUser").serialize(),
                dataType: "text",
                success:function (data) {
                    if (data=="true"){
                        query()
                        $('#myModal').modal('hide');
                    }
                }
            })
        }

    }
    //执行修改员工信息
    function editUser() {
        if(confirm("执行修改?")){
            $.ajax({
                url: "user/edit",
                type: "post",
                data: $("#editUser").serialize(),
                dataType: "text",
                success:function (data) {
                    if (data=="true"){
                        alert("修改成功");
                        $('#myModal2').modal('hide');
                        query();
                    }
                    if (data=="false"){
                        alert("修改失败");
                        $('#myModal2').modal('hide');
                        query();
                    }

                }
            })
        }
    }


</script>
</html>