<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS変更画面</title>
    </head>
    <body bgcolor="#f5f5dc">
       <div><center><h1>JUMS 変更画面</h1>
    <form action="UpdateResult" method="POST">
       <table>
          <tr>
             <td>名前　　:</td>
             <td><input type="text" name="name" placeholder='名前を入力して下さい' style="width:125px" autofocus></td>
          </tr>
          <tr>
             <td>生年月日:</td>
             <td>
                <select name="year">
                     <option value="">----</option>
                     <% for(int i=1950; i<=2010; i++){ %>
                     <option value="<%=i%>" ><%=i%></option>
                     <% } %>
                 </select>年
                 <select name="month">
                     <option value="">--</option>
                     <% for(int i = 1; i<=12; i++){ %>
                     <option value="<%=i%>" ><%=i%></option>
                     <% } %>
                 </select>月
                 <select name="day">
                     <option value="">--</option>
                     <% for(int i = 1; i<=31; i++){ %>
                     <option value="<%=i%>"><%=i%></option>
                     <% } %>
                 </select>日
             </td>
          </tr>
          <tr>
             <td>種別　　:</td>
             <td>
                <% for(int i = 1; i<=3; i++){ %>
                <input type="radio" name="type" value="<%=i%>"><%=jh.exTypenum(i)%><br>
                <% } %>
             </td>
          </tr>
          <tr>
             <td>電話番号:</td>
             <td><input type="text" name="tell" placeholder='電話番号を入力して下さい' style="width:125px">
             </td>
          </tr>
          <tr>
             <td>自己紹介文:</td>
             <td></td>
          </tr>
       </table>
        <textarea name="comment" rows=7 cols=40 style="resize:none" wrap="hard" placeholder='自己紹介文を入力して下さい'></textarea>
        <br><br>
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="hidden" name="uid"  value="<%= hs.getAttribute("uid")%>">
        <input type="submit" name="btnSubmit" value="変更を確定する" style="width:100px">
    </form>
      <br>
    <form action="ResultDetail?id=<%= hs.getAttribute("uid") %>" method="POST">
      <input type="submit" name="NO" value="戻　る" style="width:100px">
    </form>
        <br><br>
        <%=jh.home()%></center>
       </div>
    </body>
</html>
