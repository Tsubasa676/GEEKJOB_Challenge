<%-- 
    Document   : 6引数戻り値１
    Created on : 2017/01/06, 11:42:24
    Author     : mbp13
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
//ArrayListをimportしてる場合のjava記述
ArrayList<String>user = new ArrayList<>();
//id受け取り処理
ArrayList getUser(int id){
   switch(id){
      case 10:
         user.add("10");
         user.add("一郎");
         user.add("1991/01/01");
         user.add("東京都　A区");
         break;
      case 15:
         user.add("15");
         user.add("二郎");
         user.add("1992/02/02");
         user.add("東京都　B区");
         break;
      case 20:
         user.add("20");
         user.add("三郎");
         user.add("1993/03/03");
         user.add("東京都　C区");
         break;
      default:
         user.add("ユーザーがいませんでした。");
   }
return user;
}
%>

<%
//id設定
int id=(10);
getUser(id);
//id除いて出力
for(int i=1;i<user.size();i++){
out.print(user.get(i) +"<br>");
//なんども表示されないようにループ離脱
if(i==3){
   break;
}
}
%>