<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper"
        import="jums.UserDataBeans" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録結果画面</title>
    </head>
    <body bgcolor="#f0fff0">
       <div><center><h1>登録結果</h1><br>
             <table>
                <tr>
                   <td>
                     名前:<%= udb.getName()%><br>
                     生年月日:<%= udb.getYear()+"年"+udb.getMonth()+"月"+udb.getDay()+"日"%><br>
                     種別:<%= jh.exTypenum(udb.getType())%><br>
                     電話番号:<%= udb.getTell()%><br>
                     自己紹介:<%= udb.getComment()%><br>
                   </td>
                </tr>
             </table>
        <br>以上の内容で登録しました。<br><br><br>
        <%=jh.home()%></center>
       </div>
    </body>
</html>
