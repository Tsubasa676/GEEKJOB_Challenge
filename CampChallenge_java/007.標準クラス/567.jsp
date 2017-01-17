<%-- 
    Document   : 567
    Created on : 2017/01/17, 13:44:44
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Java 標準クラス</title>
   </head>
   <body>
      <h1>課題５、６、７</h1>
   </body>
</html>
<%
   //課題５　自分の氏名について、バイト数と文字数を取得して、表示してください。
   String name = "あくはら";
   out.print("課題５<br>自分の氏名について、バイト数と文字数を取得して表示<br>");
   out.print(name+" のバイト数は "+name.getBytes().length+"、文字数は "+name.length()+"<br><br>");
   
   //課題６　自分のメールアドレスの「@」以降の文字を取得して、表示してください。
   String ma = "uo50srfm@gmail.com";
   out.print("課題６<br>自分のメールアドレスの「@」以降の文字を取得して表示<br>「@」以降は "+ma.substring(8)+"<br><br>");
   
   //課題７　文章の「I」⇒「い」に、「U」⇒「う」に入れ替える処理を作成し、結果を表示してください。
   //　　　　「きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます」
   String bun = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
   String bun2=bun.replace("I","い");
   out.print("課題７<br>文章の「I」⇒「い」に、「U」⇒「う」に入れ替える処理を作成し結果を表示<br>");
   out.print("元の文「きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます」<br>結果　　");
   out.print(bun2.replace("U","う")+"<br><br>");
   
%>