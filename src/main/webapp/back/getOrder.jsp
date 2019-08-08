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
               <td>销售编号</td>
               <td>销售时间</td>
               <td>销售客户</td>
               <td>操作人</td>
               <td>说明</td>
               <td>订单状况</td>
               <td>销售总价</td>
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
</body>
</html>

<script>
    var dataPage;
     function getOrder(pages,pageSize){
             $.ajax({
                  url:"getOrders",
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
                             "<td><button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">提交</button>" +
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
</script>
