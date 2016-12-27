<%-- 
    Document   : for文3
    Created on : 2016/12/27, 14:07:57
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   //変数
   int x = 0;
   //for文
   for (int i = 1; i<=100; i++){
      out.print(x+"に"+i+"を足すと");
      x=x+i;
      out.print(x+"<br>");
   }
%>