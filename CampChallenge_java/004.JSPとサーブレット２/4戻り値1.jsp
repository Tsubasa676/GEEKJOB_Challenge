<%-- 
    Document   : 4戻り値1
    Created on : 2017/01/06, 10:31:42
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String getMyName(){
   return("あくはらつばさ");
}
String getMyBerth(){
   return("1994/3/4");
}
String getMyDate(){
   return("プログラミングの勉強中");
}
boolean getMyTF(){
   return true;
}
%>
<%
// 名前、生年月日、自己紹介を３行。１０回
   String name = getMyName();
   String berth = getMyBerth();
   String date = getMyDate();
//boolean
   boolean tf = getMyTF();

for(int i=0;i<10;i++){
   out.print(name+"<br>");
   out.print(berth+"<br>");  
   out.print(date+"<br>");   
}
//判定
if(tf==true){
   out.print("<br>"+"この処理は正しく実行できました。");
}else{
   out.print("<br>"+"正しく実行できませんでした。");
}
%>