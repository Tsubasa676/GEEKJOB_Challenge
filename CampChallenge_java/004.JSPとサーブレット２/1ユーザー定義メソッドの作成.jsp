<%-- 
    Document   : 1ユーザー定義メソッドの作成
    Created on : 2017/01/05, 14:44:03
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

%>
<%
// 名前、生年月日、自己紹介を３行。１０回
   String name = getMyName();
   String berth = getMyBerth();
   String date = getMyDate();
for(int i=0;i<10;i++){
   out.print(name+"<br>");
   out.print(berth+"<br>");  
   out.print(date+"<br>");   
}


%>
