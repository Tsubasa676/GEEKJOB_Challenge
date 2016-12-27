<%-- 
    Document   : while文
    Created on : 2016/12/27, 14:08:13
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   //変数
   int x = 1000;
   out.print(x+"を<br>");
   //while文
   while(x>100){
      x=x/2;
      out.print("2で割ると"+x+"<br>");
   }
   out.print("100以下になった。");
%>