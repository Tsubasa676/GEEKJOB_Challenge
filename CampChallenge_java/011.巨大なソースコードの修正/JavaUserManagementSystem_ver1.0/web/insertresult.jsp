<!-- 課題１、２、７ -->
<%@page import="jums.JumsHelper"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession();
    //職別の数字表記を文字表記に変更
    String tyeps  = (String)hs.getAttribute("type");
    int tyepi   = Integer.parseInt(tyeps);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録結果画面</title>
    </head>
    <body bgcolor="#FFFFE0">
       <% if(!hs.getAttribute("name").equals("")
               &&!hs.getAttribute("year").equals("0")&&!hs.getAttribute("month").equals("0")&&!hs.getAttribute("day").equals("0")
               &&!hs.getAttribute("tell").equals("")&&!hs.getAttribute("comment").equals("")){ %>
        <h1>登録結果</h1><br>
        名前　　:<%= hs.getAttribute("name")%><br>
        生年月日:<%= hs.getAttribute("year")+"年"+hs.getAttribute("month")+"月"+hs.getAttribute("day")+"日"%><br>
        種別　　:<%if(tyepi==1){out.print(" エンジニア");}else if(tyepi==2){out.print(" 営 業　");}else{out.print(" そ の 他");}%><br>
        電話番号:<%= hs.getAttribute("tell")%><br>
        自己紹介:<%= hs.getAttribute("comment")%><br>
        以上の内容で登録しました。<br><br><br>
        <%//セッションクリア
           session.invalidate();
        %>
        <% }else{ %>
        <h1>不正なアクセスです。</h1>
        <h3>登録画面へ戻ってください。</h3>
        <form action="insert" method="POST">
            <input type="submit" name="no" value="登録画面に戻る">
        </form><br><br><br>
        <% } %>
        <%=JumsHelper.getInstance().home()%>
        
    </body>
</html>
