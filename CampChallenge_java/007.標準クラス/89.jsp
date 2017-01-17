<%-- 
    Document   : 89
    Created on : 2017/01/17, 13:56:11
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.text.*,java.io.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Java 標準クラス</title>
   </head>
   <body>
      <h1>課題８〜９</h1>
   </body>
</html>
<%
   File txt = new
   File(application.getRealPath("test1.txt"));
   //課題８　ファイルに自己紹介を書き出し、保存してください。
   FileWriter fw = new FileWriter(txt);
   fw.write("私の名前は「あくはら」です。");
   fw.close();
   FileWriter fwa = new FileWriter(txt,true);//１度しか使えないから何度も書くときは書き込み使う
   fwa.write("プログラミングを学んでいます。");
   fwa.close();
   
   //課題９　ファイルから自己紹介を読み出し、表示してください。
   FileReader fr = new FileReader(txt);
   BufferedReader br = new BufferedReader(fr);
   out.print(br.readLine()+" (test1.txt内の１行目を表示)<br>");//.text内の１行目表示(readLine()は実行毎に一行のみ表示)
   out.print(br.readLine()+" (test1.txt内の２行目を表示)<br>");//.text内の２行目表示・・・nullになるまで
   br.close();
%>