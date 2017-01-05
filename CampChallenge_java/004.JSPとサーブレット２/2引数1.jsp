<%-- 
    Document   : 2引数1
    Created on : 2017/01/05, 16:26:10
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Integer getNum(Integer N){
   Integer num=0;
   if(N%2==0){
      num++;
   } 
   return num;
}
%>

<%
Integer Num=getNum(123456789);
if(Num==0){
   out.print("奇数");
}else if(Num==1){
   out.print("偶数");
}else{
   out.print("判定エラー");
}
%>