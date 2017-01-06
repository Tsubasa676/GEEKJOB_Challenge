<%-- 
    Document   : 5戻り値2
    Created on : 2017/01/06, 10:53:49
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String getId(){
   return "1234567890";
}
String getName(){
   return "山田太郎";
}
String getUmare(){
   return "2000/01/01";
}
String getAddress(){
   return "日本：東京都";
}  
%>

<%
String id = getId();
String name = getName();
String umare = getUmare();
String add = getAddress();

out.print(name+"<br>"+umare+"<br>"+add);
   
%>