<%-- 
    Document   : sess
    Created on : 2017/01/18, 14:25:09
    Author     : mbp13
--%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <h2>sess.jspページ(session)</h2>
      
<%
   //初回
   Date time = new Date();
   HttpSession hs = request.getSession(true);
   hs.setAttribute("LastLogin", time.toString());
   //ログイン日時をoct.jspページにて確認できる。
%>
   <form action="./oct.jsp" method="post">
   <input type="submit" value="sess.jspへのログイン日時を確認する" name="CSubmit">
   </form>
   <form action="./index.html" method="post">
   <input type="submit" value="index.htmlへ戻る" name="CSubmit">
   </form>

   </body>
</html>
