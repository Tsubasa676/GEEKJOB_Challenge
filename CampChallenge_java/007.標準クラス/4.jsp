<%-- 
    Document   : 4
    Created on : 2017/01/17, 12:51:31
    Author     : mbp13
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Java 標準クラス</title>
   </head>
   <body>
      <h1>課題４</h1>
   </body>
</html>
<%
   //課題４　2015年1月1日 0時0分0秒と2015年12月31日 23時59分59秒の差（ミリ秒）を表示してください。
   Calendar c1 = Calendar.getInstance();
   c1.set(2015,0,1,0,0,0);
   Calendar c2 = Calendar.getInstance();
   c2.set(2015,11,31,23,59,59);
   Date cp1 = c1.getTime();
   Date cp2 = c2.getTime();
   out.print("2015年1月1日 0時0分0秒と2015年12月31日 23時59分59秒の差（ミリ秒）を表示<br>");
   out.print("差は　"+(cp1.getTime()-cp2.getTime())+"<br><br>");





%>