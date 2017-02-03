<%@page import="jums.UserDataBeans"
        import="jums.JumsHelper"
        import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession();
    UserDataBeans us=(UserDataBeans)hs.getAttribute("udb");
    boolean Judgment = true;//trueで提出
    boolean JudgYMD  = true;//trueで提出
    if(us.getName()!=""&&us.getYear()!=0&&us.getMonth()!=0&&us.getDay()!=0&&us.getTell()!=""&&us.getComment()!=""){
       Judgment = false;
    }
    if(us.getYear()!=0&&us.getMonth()!=0&&us.getDay()!=0){
       JudgYMD = false;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録確認画面</title>
    </head>
    <body bgcolor="#FFFFE0">
       <div><center><h1>登録　確認</h1></center>
        <%if(Judgment){out.print("<h2>※入力が不十分です!!</h2>");}%>
        名　前　:　<%if(us.getName()==""){out.print("　※　");}else{out.print(us.getName());}%><br>
        生年月日:　<%if(JudgYMD){out.print("　※　");}else{out.print(us.getYear()+"年　"+us.getMonth()+"月　"+us.getDay()+"日");}%><br>
        種　別　:　<%if(us.getType()==(1)){out.print("1.エンジニア");}else if(us.getType()==(2)){out.print("2.営業");}else{out.print("3.その他");}%><br>
        電話番号:　<%if(us.getTell()==""){out.print("　※　");}else{out.print(us.getTell());}%><br>
        自己紹介:　<%if(us.getComment()==""){out.print("　※　");}else{out.print(us.getComment());};%><br><br>
        <%if(Judgment){out.print("　登録画面に戻って下さい");}else{out.print("※上記の内容で登録します。よろしいですか？");}%><br>
<table>
   <tr>
      <td><form action="insertresult" method="POST">
            <input type="hidden" name="ac" value="<%= hs.getAttribute("ac")%>"><%//直リンク防止の記述%>
            <input type="submit" name="yes" value="　は い　" <%if(Judgment){out.print("disabled");}%> >
        </form></td>
        <td><form action="insert" method="POST">
            　<input type="submit" name="no" value="登録画面に戻る">
        </form></td>
   </tr>
</table>
    
        <br><br>
        <center><%=JumsHelper.getInstance().home()%></center></div>
    </body>
</html>
