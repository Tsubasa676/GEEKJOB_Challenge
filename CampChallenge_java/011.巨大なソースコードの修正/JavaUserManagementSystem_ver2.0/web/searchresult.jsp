<%@page import="javax.servlet.http.HttpSession"
        import="jums.JumsHelper"
        import="jums.UserDataDTO"
        import="java.util.ArrayList"%>
<%
    JumsHelper jh = JumsHelper.getInstance();
    ArrayList<UserDataDTO>  al= (ArrayList<UserDataDTO>)session.getAttribute("resultData");
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS検索結果画面</title>
    </head>
    <body bgcolor="#f0fff0">
       <div><center><h1>検索結果</h1>
             <h3>編集するには名前をクリックして下さい</h3>
        <table border=5 style="background:#ffffff">
            <tr>
                <th>名 前</th>
                <th>生年月日</th>
                <th>種 別</th>
                <th>登 録 日 時</th>
            </tr>
            <%for(int i = 0; i<al.size(); i++){//ArrayList内の要素の数だけ回す%>
            <tr>
               <td align="center"><a href="ResultDetail?id=<%= al.get(i).getUserID()%>"><%= al.get(i).getName()%></a></td>
               <td><%= al.get(i).getBirthday()%></td>
               <td><%= jh.exTypenum(al.get(i).getType())%></td>
               <td><%= al.get(i).getNewDate()%></td>
            </tr>
            <%}%>
            <%if(al.size()==0){//null、見つからなかった時の処理%>
            <tr>
               <td align="center" colspan="4" bgcolor="#ee827c">
                  <br>
                  　※検索しましたが見つかりませんでした。 <br>
                  　※入力せず検索すると全件表示できます。 <br>
                  <br>
               </td>
            </tr>
            <%}%>
        </table>
            <br>
          <form action="Search" method="POST">
          <input type="submit" name="btnSubmit" value="検索し直す">
          </form>
            
          <br><br><%=jh.home()%></center>
       </div>
    </body>
</html>
