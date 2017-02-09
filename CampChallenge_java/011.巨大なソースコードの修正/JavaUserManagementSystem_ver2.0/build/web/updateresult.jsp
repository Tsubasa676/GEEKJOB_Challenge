<%@page import="jums.UserDataDTO"
        import="jums.UserDataBeans"
        import="jums.JumsHelper" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    //UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
    UserDataDTO udd = (UserDataDTO)request.getAttribute("resultData");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS更新結果画面</title>
    </head>
    <body bgcolor="#f5f5dc">
      <div><center><h1>JUMS 更新結果画面</h1>
        <table>
             <tr>
               <td>名前　　:</td>
               <td><%= udd.getName() %></td>
             </tr>
             <tr>
               <td>生年月日:</td>
               <td><%= udd.getBirthday()%></td>
             </tr>
             <tr>
               <td>種別　　:</td>
               <td><%= udd.getType() %></td>
             </tr>
             <tr>
               <td>電話番号:</td>
               <td><%= udd.getTell() %></td>
             </tr>
             <tr>
               <td>自己紹介:</td>
               <td><%= udd.getComment()%></td>
             </tr>
             <tr>
               <td>登録日時:</td>
               <td><%= udd.getNewDate()%></td>
             </tr>
          </table>
        <br>・以上の内容で登録し直しました！<br>
        <br><%=jh.home()%></center>
      </div>
    </body>
</html>
