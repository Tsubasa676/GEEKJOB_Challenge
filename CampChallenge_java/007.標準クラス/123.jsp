<%-- 
    Document   : 123
    Created on : 2017/01/17, 11:55:17
    Author     : mbp13
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <h1>課題１〜３</h1>
   </body>
</html>
<%
   Date now = new Date();
   //課題１　2016年1月1日 0時0分0秒のタイムスタンプを作成し、表示してください。
   Calendar cal1 = Calendar.getInstance();
   cal1.set(2016,0,1,0,0,0);
   Date cal1past = cal1.getTime();
   out.print("課題１<br>2016年1月1日 0時0分0秒のタイムスタンプを表示<br>");
   out.print("TimeStamp型　"+cal1past.getTime()+"<br><br>");
   
   //課題２　現在の日時を「年-月-日 時:分:秒」で表示してください。
   SimpleDateFormat sdfnow = new SimpleDateFormat("yyyy年 MM月 dd日 HH時 : mm分 : ss秒");
   String sdatenow = sdfnow.format(now);//勝手にyyyyとかが置き換わる
   out.print("課題２<br>現在の日時を「年-月-日 時:分:秒」で表示<br>");
   out.print("現在の日時は　"+sdatenow+"<br><br>");
   
   //課題３　2016年11月4日 10時0分0秒のタイムスタンプを作成し、「年-月-日 時:分:秒」で表示してください。
   Calendar cal2 = Calendar.getInstance();
   cal2.set(2016,10,4,10,0,0);
   Date cal2past = cal2.getTime();
   SimpleDateFormat sdfcal2 = new SimpleDateFormat("yyyy年 MM月 dd日 HH時 : mm分 : ss秒");
   String sdatecal2 = sdfcal2.format(cal2.getTime());//勝手にyyyyとかが置き換わる
   out.print("課題３<br>2016年11月4日 10時0分0秒のタイムスタンプを作成し、「年-月-日 時:分:秒」で表示<br>");
   out.print("TimeStamp型　"+cal2past.getTime()+"<br>年-月-日 時:分:秒で表示にすると、"+sdatecal2+"<br><br>");
%>