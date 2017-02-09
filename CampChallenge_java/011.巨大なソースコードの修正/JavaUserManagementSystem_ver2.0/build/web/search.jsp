<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper" %>
<%
   JumsHelper jh = JumsHelper.getInstance();
   HttpSession hs = request.getSession();
   //名前と生年月日と種別で検索する
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMSユーザー情報検索画面</title>
    </head>
    <body bgcolor="#f0fff0">
       <div><center><h1>検索画面</h1>
         <form action="SearchResult" method="POST">
<table>
   <tr>
      <td>名前　:　</td>
      <td><input type="text" name="name" placeholder='名前を入力して下さい' style="width:110px" autofocus></td>
   </tr>
   <tr>
      <td>生年　:　</td>
      <td>
         <select name="year">
            <option value="">----</option>
            <% for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>"><%=i%></option>
            <% } %>
         </select>年生まれ
      </td>
   </tr>
   <tr>
      <td>種別　:　</td>
      <td>
         <% for(int i = 1; i<=3; i++){ %>
         <input type="radio" name="type" value="<%=i%>"><%=jh.exTypenum(i)%><br>
         <% } %>
      </td>
   </tr>
</table>
      <br>
      <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
      <input type="submit" name="btnSubmit" value="　　検　索　す　る　　">
   </form>
      <br><br>
      <%=jh.home()%></center>
      </div>
   </body>
</html>
