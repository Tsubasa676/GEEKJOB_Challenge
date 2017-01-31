<!--課題１、４-->
<%@page import="jums.JumsHelper"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録確認画面</title>
    </head>
    <body bgcolor="#FFFFE0">
         <h1>登録確認</h1>
    <% 
      //職別の数字表記を文字表記に変更
      String tyeps  = (String)hs.getAttribute("type");
      int tyepi   = Integer.parseInt(tyeps);
      //未入力を求めるための処理
      int namex = 0 ;
      int yearx = 0 ;
      int tellx = 0 ;
      int commentx =0;
      if(!hs.getAttribute("name").equals("")){ 
         namex=1;
      }
      if(!hs.getAttribute("year").equals("0")&&!hs.getAttribute("month").equals("0")&&!hs.getAttribute("day").equals("0")){ 
         yearx=1;
      }
      if(!hs.getAttribute("tell").equals("")){ 
         tellx=1;
      }
      if(!hs.getAttribute("comment").equals("")){ 
         commentx=1;
      }
    if(namex==0||yearx==0||tellx==0||commentx==0){ %>
         <h3>
    <% if(namex == 0){ %>
         ・名前
    <% }if(yearx==0){ %>
         ・生年月日
    <% }if(tellx == 0){ %>
         ・電話番号
    <% }if(commentx == 0){ %>
         ・自己紹介
    <% } %>
         が未入力です。</h3>
         <h2>登録画面へ戻り、入力して下さい。</h2>
    <%}else if(namex==1&&yearx==1&&tellx==1&&commentx==1){ %>
        名前　　:<%= hs.getAttribute("name")%><br>
        生年月日:<%= hs.getAttribute("year")+"年"+hs.getAttribute("month")+"月"+hs.getAttribute("day")+"日"%><br>
        種別　　:<%if(tyepi==1){out.print(" エンジニア");}else if(tyepi==2){out.print(" 営 業　");}else{out.print(" そ の 他");}%><br>
        電話番号:<%= hs.getAttribute("tell")%><br>
        自己紹介:<%= hs.getAttribute("comment")%><br><br>
        上記の内容で登録します。よろしいですか？<br>
<table>
   <tr>
      <td>
        <form action="insertresult" method="POST">
            <input type="submit" name="yes" value=" は い ">
        </form></td>
    <% }else{%>
      <h2>予期せぬエラーが発生しました。<br>登録画面へ戻り、入力して下さい。</h2>
    <% }%>
      <td><form action="insert" method="POST">
            <input type="submit" name="no" value=" 戻 る ">
        </form></td> 
   </tr>
</table>
        <br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
