<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    UserDataDTO udd = (UserDataDTO)request.getAttribute("resultData");
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMSユーザー情報詳細画面</title>
    </head>
    <body bgcolor="#f0fff0">
       <div><center><h1>詳細情報</h1>
        <table>
             <tr style="background:#ffffff">
               <td>名 前　　:　</td>
               <td><%= udd.getName()%></td>
             </tr>
             <tr>
               <td>生年月日 :</td>
               <td><%= udd.getBirthday()%></td>
             </tr>
             <tr style="background:#ffffff">
               <td>種 別　　:</td>
               <td><%= udd.getType()%></td>
             </tr>
             <tr>
               <td>電話番号 :</td>
               <td><%= udd.getTell()%></td>
             </tr>
             <tr style="background:#ffffff">
               <td>自己紹介 :</td>
               <td><%= udd.getComment()%></td>
             </tr>
             <tr>
               <td>登録日時 :</td>
               <td><%= udd.getNewDate()%></td>
             </tr>
          </table>
             <br>
    <table>
      
        <tr>
           <td><form action="Update" method="POST">
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="hidden" name="uid"  value="<%= hs.getAttribute("uid")%>">
        <input type="submit" name="update" value="変 更 す る" style="width:100px">
        </form></td>
           <td><form action="Delete" method="POST">　｜　
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="hidden" name="uid"  value="<%= hs.getAttribute("uid")%>">
        <input type="submit" name="delete" value="削 除 す る" style="width:100px">
        </form></td>
        </tr>
    </table>
        <br><br>
        <%=jh.home()%></center>
       </div>
    </body>
</html>
