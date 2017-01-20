<%-- 
    Document   : kadai5C
    Created on : 2017/01/18, 15:14:43
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <h3>入力したデータが初期値になっているか？</h3>
      <br><br>
      
<%
   //受け取るパラメータの文字コード
   request.setCharacterEncoding("UTF-8");
   //入力したデータを受け取った
   String n = request.getParameter("tc5");
   String r = request.getParameter("sc5");
   String m = request.getParameter("mc5");
   //受け取ったデータを出力する
   out.print("入力されたデータを表示「 "+ n +" 」<br><br>");
   
   if(r.equals("1")){
      out.print("選択された性別を表示　「 男 」<br><br>");
   }else if(r.equals("2")){
      out.print("選択された性別を表示　「 女 」<br><br>");
   }else if(r.equals("3")){
      out.print("選択された性別を表示　「 他 」<br><br>");
   }else{
      out.print("選択された性別を表示　「 　 」<br><br>");
   }
   
   out.print("入力されたデータを表示「 "+ m +" 」<br><br><br>");

   //kadai5.jspで受け取る処理Sessionで
   session.setAttribute("name", n);
   session.setAttribute("gender", r);
   session.setAttribute("texta", m);
%>

      <form action="./kadai5.jsp" method="post">
         <div>
         <input type="submit" value="　戻って確認します　" name="btnSubmit" 
                style="width: 40%;font-size: 30px;background-color: yellowgreen">
         </div>
      </form>
   </body>
</html>
