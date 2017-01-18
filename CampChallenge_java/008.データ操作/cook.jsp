<%-- 
    Document   : cook
    Created on : 2017/01/18, 11:09:27
    Author     : mbp13
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>8java データ操作</title>
   </head>
   <body>
      <h2>cook.jspページ(cookie)</h2>
      ログイン時の日時を取得した<br><br>

<%//課題３　クッキー
   Date time = new Date();
   //SimpleDateFormatクラス
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
   String sd = sdf.format(time);//勝手にyyyyとかが置き換わる
   out.print("現在の日時 "+sd+"<br><br>");
   
   //timeがString型に変更できないため、response.addCookie(cc3);でエラーが起きる
   String aaa =URLEncoder.encode(time.toString());
   //本来ならCookie cc3 = new Cookie("LastLogin",time.toString());
   Cookie cc3 = new Cookie("LastLogin",aaa.toString());
   response.addCookie(cc3);
   //クッキーが受け取るのは文字列だけ
   Cookie cs[]=request.getCookies();
   if(cs != null){
      for(int i=0;i<cs.length;i++){
         if(cs[i].getName().equals("LastLogin")){
            out.print("最後のログインは、"+cs[i].getValue()+"<br>");
            break;
         }
      }
   }
%>

   <form action="./index.html" method="post">
   <input type="submit" value="index.htmlへ戻る" name="CSubmit">
   </form>
   </body>
</html>
