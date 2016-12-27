<%-- 
    Document   : switch文2
    Created on : 2016/12/27, 14:07:24
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   char x = 'あ';
   String messa = "";
   switch(x){
      case 'A':
         messa = "英語";
         break;
      case 'あ':
         messa = "日本語";
         break;
      default:
         messa = "";
         break;
   }
   out.print(messa);



%>