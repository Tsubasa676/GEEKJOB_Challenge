<%-- 
    Document   : switch文1
    Created on : 2016/12/27, 14:06:48
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   int x = 1;
   String messa = "";
   switch(x){
      case 1:
         messa = "one";
         break;
      case 2:
         messa = "two";
         break;
      default:
         messa = "想定外";
         break;
   }
   out.print(messa);



%>