<%-- 
    Document   : 配列の作成
    Created on : 2016/12/27, 14:08:45
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   //配列
   String a[]={"10","100","soeda","hayashi","-20","118","END"};
   //出力
   for(int i =0; i<a.length;i++){
      out.print(a[i]+" ");
   }
%>