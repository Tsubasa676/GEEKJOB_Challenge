<%-- 
    Document   : oct
    Created on : 2017/01/18, 10:34:35
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>oct.jsp</title>
   </head>
   <body>
      <h2>submitボタン＞ページ移動oct.jspページが表示された</h2>
<%
   //受け取るパラメータの文字コード
   request.setCharacterEncoding("UTF-8");
   //データの受け取り
   String n = request.getParameter("txtName");
   //String c = request.getParameter("chkTest");
   String r = request.getParameter("rdo1");
   //String b = request.getParameter("btnTest");
   //String l = request.getParameter("cmbList");
   String m = request.getParameter("mulText");
   String s = request.getParameter("btnSubmit");
   out.print("入力されたデータを表示「 "+n+"」<br>");
   out.print("選択された性別を表示　「 "+r+"」<br>");
   out.print("入力されたデータを表示「 "+m+"」<br>");
   out.print("　表示が終わりました。<br>");
   
   //sess.jspへのログイン日時を取得
   HttpSession hs = request.getSession(true);
   out.print("<br>sess.jspへの最後のログインは、"+hs.getAttribute("LastLogin")+"でした<br>");
%>
<br><br>
      <form action="./index.html" method="post">
      <input type="submit" value="index.htmlへ戻る" name="CSubmit">
      </form>
   </body>
</html>

