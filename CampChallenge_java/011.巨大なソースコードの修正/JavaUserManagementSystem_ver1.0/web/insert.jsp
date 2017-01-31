<!-- 課題１、５ -->
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%
    request.setCharacterEncoding("UTF-8");
    HttpSession hs = request.getSession();
    String years = (String)hs.getAttribute("year");
    String months= (String)hs.getAttribute("month");
    String days  = (String)hs.getAttribute("day");
    String tyeps = (String)hs.getAttribute("type");
    int yeari ;
    int monthi;
    int dayi  ;
    int tyepi ;
    if(years==null||months==null||days==null||tyeps==null){
      //初回アクセス時のString型nullをint型にできないエラー回避
       yeari   = 0;
       monthi  = 0;
       dayi    = 0;
       tyepi = 3;//デフォルトで選択されるように設定
    }else{
        yeari   = Integer.parseInt(years);
        monthi  = Integer.parseInt(months);
        dayi    = Integer.parseInt(days);
        tyepi   = Integer.parseInt(tyeps);
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
       <h1>JUMS登録画面</h1>
       <h3>※以下、全ての項目を入力してください。</h3>
    <form action="insertconfirm" method="POST">
        名前:
        <input type="text" name="name" value="<% if(hs.getAttribute("name")==null){out.print("");}else{out.print(hs.getAttribute("name"));}%>">
        <br><br>

        生年月日:　
        <select name="year">
            <option value="0">----</option>
            <%
            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>" <%if(i==yeari){%>selected<%}%> ><%=i%></option>
            <% } %>
        </select>年
        <select name="month">
            <option value="0">--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>" <%if(i==monthi){%>selected<%}%> ><%=i%></option>
            <% } %>
        </select>月
        <select name="day">
            <option value="0">--</option>
            <%
            for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>" <%if(i==dayi){%>selected<%}%> ><%=i%></option>
            <% } %>
        </select>日
        <br><br>
<table>
   <tr>
      <td>種別:　</td>
      <td>
        <input type="radio" name="type" value="1" <%if(tyepi==1){%>checked<%}%> > エンジニア<br>
        <input type="radio" name="type" value="2" <%if(tyepi==2){%>checked<%}%> > 営 業　<br>
        <input type="radio" name="type" value="3" <%if(tyepi==3){%>checked<%}%> > そ の 他<br></td>
   </tr>
</table><br>
        
        電話番号:
        <input type="text" name="tell" value="<% if(hs.getAttribute("tell")==null){out.print("");}else{out.print(hs.getAttribute("tell"));}%>">
        <br><br>

        自己紹介文
        <br>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><% if(hs.getAttribute("comment")==null){out.print("");}else{out.print(hs.getAttribute("comment"));}%></textarea><br><br>
        
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="登録確認画面へ">
    </form>
        <br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
