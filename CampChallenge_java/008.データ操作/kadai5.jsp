<%-- 
    Document   : kadai5
    Created on : 2017/01/18, 15:14:08
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <h2>課題５</h2>
      
<%
   //受け取るパラメータの文字コード
   request.setCharacterEncoding("UTF-8");
   //セッションに関する処理
   if(session.isNew()){//セッションが管理されていない場合
      out.print("※下記の各項目に入力してください。<br>");
      session.setAttribute("Una", "");
      session.setAttribute("Gen", "");
      session.setAttribute("Tex", "");
   }else{//セッション何かしら入ると(nullや値)
      out.print("入力されていたデータを表示しました。<br>");
      String Una = (String)session.getAttribute("name");
      String Gen = (String)session.getAttribute("gender");
      String Tex = (String)session.getAttribute("texta");
      session.setAttribute("Una", Una);
      session.setAttribute("Gen", Gen);
      session.setAttribute("Tex", Tex);
   }
%>

      <form action="./kadai5C.jsp" method="post" name="tc5">
         名前入力：
         <input type="text" name="tc5" value="<%out.println(session.getAttribute("Una"));%>"><br><br>
         性別選択：
         <input type="radio" value="1" name="sc5" <%if(session.getAttribute("Gen").equals("1")){%>checked<%}%> >男
         <input type="radio" value="2" name="sc5" <%if(session.getAttribute("Gen").equals("2")){%>checked<%}%> >女
         <input type="radio" value="3" name="sc5" <%if(session.getAttribute("Gen").equals("3")){%>checked<%}%> >他<br><br>
         趣味入力：
         <textarea rows="3" cols="30" name="mc5"><%out.println(session.getAttribute("Tex"));%></textarea><br><br>
         <input type="submit" value="　送　信　" name="btnSubmit"
                style="width: 40%;font-size: 30px;background-color: yellowgreen">
      </form>
         <br><br><br>
      <form action="./index.html" method="post">
      <input type="submit" value="index.htmlへ戻る" name="CSubmit">
      </form>
   </body>
</html>
