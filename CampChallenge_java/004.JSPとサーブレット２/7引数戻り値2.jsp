<%-- 
    Document   : 7引数戻り値2
    Created on : 2017/01/06, 15:14:38
    Author     : mbp13
--%>
<%--　引数・戻り値2 
　　　　一人だけ住所がnull　--%>
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
         user[0]=("");
         user[1]=("表示できません。");
         break;
   }
return user;
}
%>

<%
//表示設定
for (int j= 1;j<4;j++){
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