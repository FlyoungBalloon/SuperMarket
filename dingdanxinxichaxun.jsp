<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dingdanxinxichaxun.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
	   .table1{
	          border-collapse:collapse;         /* 合并相邻边框 */
	          border:#cc0000 3px solid;
	          text-align:center;
	          width:78%;
	   }
	   .table1 td{
	          border:#cc0000 1px solid;
	          height:40px;
	   }
	   .table1 th{
	          border:#cc0000 1px solid;
	   }
	   .table1 tbody tr:hover{
	          background:#fef0f5;
	          font-weight:bold;
	   }
</style>
  </head>
  
  <body>
  
  <center><b><h1>查询货物订单记录</h1></b><table class="table1">
  <tr><th>订单编号</th>
      <th>商品名称</th>
      <th>供应商</th>
      <th>单价</th>
      <th>数量</th>
      <th>总价</th>
      <th>进货日期</th>
      <th>退货日期</th>
      <th>交接人员</th>
      <th>备注</th>
      <th>财务清算</th>
   </tr>
  
   <% String driver="sun.jdbc.odbc.JdbcOdbcDriver";
       String url="jdbc:odbc:chaoshi";
       request.setCharacterEncoding("GBK");
       String sql=null;
       String condition=request.getParameter("condition");     //  获取查看页面POST的condition信息
       String name=request.getParameter("name");               //  获取查看页面post信息,传递到name
       try{
       Class.forName(driver);
       }
       catch(ClassNotFoundException e){
       System.err.println("ClassNotFoundException:"+e.getMessage());
       }
       try{
       Connection con=DriverManager.getConnection(url);
       System.out.println("数据库访问初始化");
       Statement stmt=con.createStatement();
       if(condition.equals("mingcheng")){
      // if("name"(true))
       sql="SELECT * FROM ruku WHERE mingcheng LIKE '%"+name+"%'";
        out.println("商品名查询");
       }
       if(condition.equals("bianhao")){
       sql="SELECT * FROM ruku WHERE bianhao LIKE '%"+name+"%'";
       out.println("订单编号查询");
       
       }
       if(condition.equals("gongyingshang")){
       sql="SELECT * FROM ruku WHERE gongyingshang LIKE '%"+name+"%'";
       out.println("供应商查询");
       
       }
       ResultSet r=stmt.executeQuery(sql);
       System.out.println("执行查询");
       while(r.next()){
         /* int ID=r.getInt("ZD"); */
         
     %>
             <tr><td><%=r.getString("bianhao") %></td>
                <td><%=r.getString("mingcheng") %></td>
                <td><%=r.getString("gongyingshang") %></td>
                <td><%=r.getDouble("danjia") %></td>
                <td><%=r.getDouble("shuliang") %></td>
                <td><%=r.getDouble("zongjia") %></td>
                <td><%=r.getString("jinhuo") %></td>
                <td><%=r.getString("tuihuo") %></td>
                <td><%=r.getString("renyuan") %></td>
                <td><%=r.getString("beizhu") %></td>
                <td><%=r.getString("caiwu") %></td>
            </tr>
             </body>
           </html>
  <%     }

           r.close();
           stmt.close();
           con.close();
           System.out.println("数据库访问结束");
           }catch(SQLException e){
           e.printStackTrace();
           }
   %></table>
 <center><a href="chakanshangpin.jsp">返回查询</a></center>
