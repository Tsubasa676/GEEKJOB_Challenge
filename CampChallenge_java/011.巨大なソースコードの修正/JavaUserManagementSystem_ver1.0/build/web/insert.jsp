<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper"
        import="jums.UserDataBeans"%>
<%
    HttpSession hs = request.getSession();
    //初アクセス時、値がnullなのでエラーが起こる
    UserDataBeans us = (UserDataBeans)hs.getAttribute("udb");
    boolean Judgment = true;
    if(us==null){
       us = new UserDataBeans();
       Judgment = false;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body bgcolor="#FFFFE0">
       <div><center><h1>JUMS 登録画面</h1></center>
       <h3>※以下、全ての項目を入力してください。</h3>
    <form action="insertconfirm" method="POST">
        名　前　:
        <input type="text" name="name" value="<%if(Judgment){out.print(us.getName());}%>" autofocus>
        <br><br>

        生年月日:
        <select name="year">
            <option value="0">----</option>
            <%
            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>" <%if(Judgment&&us.getYear()==i){%>selected<%}%> > <%=i%> </option>
            <% } %>
        </select>年
        <select name="month">
            <option value="0">--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>" <%if(Judgment&&us.getMonth()==i){%>selected<%}%> ><%=i%></option>
            <% } %>
        </select>月
        <select name="day">
            <option value="0">--</option>
            <%
            for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>" <%if(Judgment&&us.getDay()==i){%>selected<%}%> ><%=i%></option>
            <% } %>
        </select>日
        <br><br>
        
<table>
   <tr>
      <td>種　別　: </td>
      <td>
        <input type="radio" name="type" value="1" <%if(Judgment&&us.getType()==1){%>checked<%}%> > 1.エンジニア<br>
        <input type="radio" name="type" value="2" <%if(Judgment&&us.getType()==2){%>checked<%}%> > 2.営業<br>
        <input type="radio" name="type" value="3" <%if(Judgment==false||us.getType()!=1&&us.getType()!=2){%>checked<%}%> > 3.その他<br></td>
   </tr>
</table><br>

        電話番号:
        <input type="text" name="tell" value="<%if(Judgment){out.print(us.getTell());}%>">
        <br><br>

<table>
   <tr>
      <td>自　己<br>紹介文:</td>
      <td>
         <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%if(Judgment){out.print(us.getComment());}%></textarea>
      </td>
   </tr>
</table>
        <input type="hidden" name="ac" value="<%= hs.getAttribute("ac")%>"><%//直リンク防止の記述%>
        <input type="submit" name="btnSubmit" value=" 確認画面へ ">
    </form>
        <br>
        <center><%=JumsHelper.getInstance().home()%></center></div>
    </body>
</html>
