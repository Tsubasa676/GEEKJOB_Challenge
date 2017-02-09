<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper"
        import="jums.UserDataBeans" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    UserDataBeans udb = null;
    boolean reinput = false;
    if(request.getParameter("mode") != null && request.getParameter("mode").equals("REINPUT")){
        reinput = true;
        udb = (UserDataBeans)hs.getAttribute("udb");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body bgcolor="#f0fff0">
       <div><center><h1>JUMS 登録画面</h1>
    <form action="insertconfirm" method="POST">
       <table>
          <tr>
             <td>　名　前　:</td>
             <td><input type="text" name="name" value="<% if(reinput){out.print(udb.getName());}%>"></td>
          </tr>
          <tr>
             <td>生年月日　:</td>
             <td>
             <select name="year">
               <option value="">----</option>
               <% for(int i=1950; i<=2010; i++){ %>
               <option value="<%=i%>" <% if(reinput && udb.getYear() == i){out.print("selected = \"selected\"");}%>><%=i%></option>
               <% } %>
             </select>年
            <select name="month">
               <option value="">--</option>
               <% for(int i = 1; i<=12; i++){ %>
               <option value="<%=i%>" <% if(reinput && udb.getMonth() == i){out.print("selected = \"selected\"");}%>><%=i%></option>
               <% } %>
            </select>月
            <select name="day">
               <option value="">--</option>
               <% for(int i = 1; i<=31; i++){ %>
               <option value="<%=i%>"<% if(reinput && udb.getDay() == i){out.print("selected = \"selected\"");}%>><%=i%></option>
               <% } %>
            </select>日
             </td>
          </tr>
          <tr>
             <td>　種　別　:</td>
             <td>
               <% for(int i = 1; i<=3; i++){ %>
               <input type="radio" name="type" value="<%=i%>"<%if(reinput && udb.getType() == i){out.print("checked = \"checked\"");}%>><%=jh.exTypenum(i)%><br>
               <% } %>
             </td>
          </tr>
          <tr>
             <td>電話番号　:</td>
             <td><input type="text" name="tell" value="<% if(reinput){out.print(udb.getTell());}%>"></td>
          </tr>
          <tr>
             <td>自己紹介文:</td>
             <td></td>
          </tr>
       </table>
             <textarea name="comment" rows=10 cols=40 style="resize:none" wrap="hard"><% if(reinput){out.print(udb.getComment());}%></textarea><br><br>
        
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br><br><br>
        <%=jh.home()%></center>
       </div>
    </body>
</html>
