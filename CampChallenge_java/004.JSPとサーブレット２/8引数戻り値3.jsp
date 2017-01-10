<%-- 
    Document   : 8引数戻り値3
    Created on : 2017/01/10, 14:45:58
    Author     : mbp13
--%>
<%-- Integer limit=2を定義　ループ処理を抜ける --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String[] user = new String[4];
//id設定
String[] getUser(int id){
   switch(id){
      case 1:
         user[0]=("15");
         user[1]=("一郎");
         user[2]=("1991/01/01");
         user[3]=("東京都 A");
         break;
      case 2:
         user[0]=("15");
         user[1]=("二郎");
         user[2]=("1992/02/02");
         user[3]=(null);
         break;
      case 3:
         user[0]=("20");
         user[1]=("三郎");
         user[2]=("1993/03/03");
         user[3]=("東京都 C");
         break;
      default:
         user[0]=("ユーザーがいませんでした。");
         break;
   }
return user;
}
%>

<%
//Integer定義
Integer limit = 2;
//表示設定
for (int j= 1;j<=limit;j++){
   getUser(j);
//id除いて出力,nullはスキップ
for(int i = 1; i < 4; i++){
   if(user[i]==null){
      continue;
   }
   out.println(user[i]+"<br>");
}
}
%>