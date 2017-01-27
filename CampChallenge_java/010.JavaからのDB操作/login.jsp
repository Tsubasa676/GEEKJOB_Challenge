<%-- 
    Document   : login
    Created on : 2017/01/26, 16:21:09
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題１３login</title>
   </head>
   <body>
      <div>
         <center>
<%
      
   //受け取るパラメータの文字コード
   request.setCharacterEncoding("UTF-8");
   //セッションに関する処理
   if(session.isNew()){//セッションが管理されていない場合
      out.print("<h2>ユーザー名とパスワードを入力してください</h2>");
      %>
      <form action="./logmenu.jsp" method="post">
      <p><input type="text" name="user" value="" placeholder='ユーザー名' autofocus required></p>
      <p><input type='password' name="pass" value="" pattern="^[0-9A-Za-z]+$" placeholder='パスワード' required></p>
         <input type="submit" value="　ログイン　" name="btnSubmit">
      <%
   }else{//セッション何かしら入ると(nullや値)
      out.print("<h2>ユーザー名とパスワードを入力してください</h2>※ログインし直してください<br>");
      %>
      <form action="./logmenu.jsp" method="post">
      <p><input type="text" name="user" value="" placeholder='ユーザー名' autofocus required></p>
      <p><input type='password' name="pass" value="" pattern="^[0-9A-Za-z]+$" placeholder='パスワード' required></p>
         <input type="submit" value="　再ログイン　" name="btnSubmit">
         <%
   }
%>

   <br><br>
      <form action="./index.html" method="post">
         <input type="submit" value="　H O M E　" name="btnSubmit">
      </form>
         </center>
      </div>
   </body>
</html>
