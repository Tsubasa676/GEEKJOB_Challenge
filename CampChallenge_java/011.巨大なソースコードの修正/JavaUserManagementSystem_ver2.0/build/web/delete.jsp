<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    UserDataDTO udd = (UserDataDTO)request.getAttribute("resultData");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#faf0e6">
       <div><center><h1>削除確認</h1>
          <h3>以下の内容を削除します。<br><u>よろしいですか？</u></h3>
          <table>
             <tr>
               <td>名前　　:</td>
               <td> <%= udd.getName()%></td>
             </tr>
             <tr>
               <td>生年月日:</td>
               <td> <%= udd.getBirthday()%></td>
             </tr>
             <tr>
               <td>種別　　:</td>
               <td> <%= udd.getType()%></td>
             </tr>
             <tr>
               <td>電話番号:</td>
               <td> <%= udd.getTell()%></td>
             </tr>
             <tr>
               <td>自己紹介:</td>
               <td> <%= udd.getComment()%></td>
             </tr>
             <tr>
               <td>登録日時:</td>
               <td> <%= udd.getNewDate()%></td>
             </tr>
          </table>
    <br>
    <form action="DeleteResult" method="POST">
      <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
      <input type="hidden" name="uid"  value="<%= hs.getAttribute("uid")%>">
      <input type="submit" name="YES" value="は　い" style="width:100px">
    </form><br>
    <form action="ResultDetail?id=<%= hs.getAttribute("uid") %>" method="POST">
      <input type="submit" name="NO" value="戻　る" style="width:100px">
    </form>
          </center>
       </div>
    </body>
</html>
