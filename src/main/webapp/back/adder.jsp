<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <base href="http://localhost:8080/jxcsystem/">
    <title>增加供应商</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"></link>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<form id="form1">
    <p>供应商ID：<input type="text" id="vendorId" name="vendorId"/></p>
    <p>供应商编号：<input type="text" id="vendorNo" name="vendorNo"/></p>
    <p>名称：<input type="text" id="vendorName" name="vendorName"/></p>
    <p>联系人：<input type="text" id="contact" name="contact"/></p>
    <p>联系电话：<input type="text" id="contactPhone" name="contactPhone"/></p>
    <p>地址：<input type="text" id="vendorAddress" name="vendorAddress"/></p>
    <p>邮箱：<input type="text" id="vendorPostbox" name="vendorPostbox"/></p>
    <p>开户银行：<input type="text" id="vendorBank" name="vendorBank"/></p>
    <p>开户账号：<input type="text" id="vendorBankId" name="vendorBankId"/></p>
    <p><button class="btn btn-success" id="btn">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-success" id="bt45">重写</button>
</form>
<script>
btn.onclick=function(){
$.ajax({
url:"addVendor",
type:"post",
data:$("#form1").serialize(),//将表单序列化提交，将表单中的数据全部提交
dataType:"json",
success:function(data){
    if(data=="true"){
        window.location.href="ma";
    }
}
})
}


</script>
</body>
</html>
