<%-- 
    Document   : for文1
    Created on : 2016/12/27, 14:07:40
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   //変数
   int x = 8;
   //for文
   for (int i = 1; i<=20; i++){
      x=x*8;
      out.print("８に８を"+i+"回掛ると"+x+"<br>");
   }


%>