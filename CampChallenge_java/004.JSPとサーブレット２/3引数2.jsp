<%-- 
    Document   : 3引数2
    Created on : 2017/01/05, 17:16:49
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Integer getSample(Integer A,Integer B,boolean type){
   Integer sample=0;
   //２つ目のデフォルト数値が５
   B=5;
   //分岐
   if(type==true){
      sample=A*B;
      sample=sample*sample;
   }else if(type==false){
      sample=A*B;
   }
   return sample;
}
%>

<%
Integer Sample=getSample(123,5678,true);
out.print(Sample);
%>