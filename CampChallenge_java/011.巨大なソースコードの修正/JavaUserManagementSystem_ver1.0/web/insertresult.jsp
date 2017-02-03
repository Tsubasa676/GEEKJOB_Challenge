<%@page import="jums.UserDataBeans"
        import="jums.JumsHelper"
        import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession();
    UserDataBeans us=(UserDataBeans)hs.getAttribute("udb");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録結果画面</title>
    </head>
    <body bgcolor="#FFFFE0">
       <div><center><h1>登録　結果</h1></center>
        名　前　: <%out.print(us.getName());%><br>
        生年月日: <%out.print(us.getYear()+"年 "+us.getMonth()+"月 "+us.getDay()+"日");%><br>
        種　別　: <%out.print(us.getType());%><br>
        電話番号: <%out.print(us.getTell());%><br>
        自己紹介: <%out.print(us.getComment());%><br><br>
        以上の内容で登録しました。<br>
        <br>
    <center><%=JumsHelper.getInstance().home()%></center></div>
    </body>
</html>
