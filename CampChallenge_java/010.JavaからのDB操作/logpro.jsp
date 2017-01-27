<%-- 
    Document   : logpro
    Created on : 2017/01/26, 16:22:23
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題１３　一覧表示</title>
   </head>
   <body>
      <form action="./login.jsp" method="post">
         <input type="submit" value="　サインアウト　" name="btnSubmit">
      </form>
      <div>
         <center>
      <h1>DB内の商品を表示</h1>
      <%
         request.setCharacterEncoding("UTF-8");
         Connection        dc = null;
         PreparedStatement ds = null;
         ResultSet         dr = null;
         int count =0;
         
         try{
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         dc = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         ds   = dc.prepareStatement("select * from product13");
         dr = ds.executeQuery();
         out.print("</center>");
         while(dr.next()){
            count++;
            out.print("・Barcode："+dr.getString("barcode")+"　・商品名："+dr.getString("name")
               +"　・価格(税抜)："+dr.getString("value")+"　・商品分類："+dr.getString("classification")+"<br>");
         }
         out.print("<center>");
         out.print("<br>現在 "+count+"件の商品が登録されています。");
            dc.close();
            ds.close();
            dr.close();
         }catch(NumberFormatException e){
            out.print("　<p>正しく入力してください！</p><br>");
         }catch(SQLException e_sql){
         out.print("接続時にエラーが発生しました。e_sql："+e_sql.toString()+"<br>");
         }catch(Exception e){
         out.print("接続時にエラーが発生しました。e："+e.toString()+"<br>");
         }finally{//必ず実行される。
            if (dc!=null){
               try{
                  dc.close();//↓例外あった時用に必ずかく
               }catch (Exception e_con){
                  out.println(e_con.getMessage());
               }
            }
         }

      %>
      <br><br>
      <form action="./logmenu.jsp" method="post">
         <input type="submit" value="　登 録 へ　" name="btnSubmit">
      </form><br><br>
      <form action="./logmenu.jsp" method="post">
         <input type="submit" value="　メニュー　" name="btnSubmit">
      </form>
         </center>
      </div>
   </body>
</html>
