<%-- 
    Document   : logmenu
    Created on : 2017/01/26, 16:22:53
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>課題１３loginmenu</title>
   </head>
   <body>
      <div>
         <center>
      <h1>商品登録と一覧表示</h1>
<%
   request.setCharacterEncoding("UTF-8");
   Connection        dc = null;
   PreparedStatement ds = null;
   ResultSet         dr = null;
   String user = request.getParameter("user");
   String pass = request.getParameter("pass");
   String sql = "";
   String password ="";
   try{
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      dc = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
      sql = "select * from user13 where name LIKE ?";
      ds = dc.prepareStatement(sql);
      ds.setString(1,user);
      dr = ds.executeQuery();
      while(dr.next()){
         out.print("ID："+dr.getString("userID")+"　名前："+dr.getString("name")
         +"　Pass："+dr.getString("pass"));
         password = dr.getString("pass");
      }
      //判定
      if(pass.equals(password)&&!user.equals("")&&!password.equals("")){
         %>
      </center>
      <form action="./login.jsp" method="post">
         <input type="submit" value="　サインアウト　" name="btnSubmit">
      </form>
      <center>
         <form action="./logreg.jsp" method="post">
      <p>Barcode：<input type="text"  maxlength='8' name="ba" value="" placeholder='8桁のバーコード'></p>
      <p>商 品 名：<input type="text" name="na" value="" placeholder='商 品 名'></p>
      <p> 価 格 ：<input type="text" name="va" value="" placeholder='価格（税抜）'></p>
      <p>商品分類：<select name="fi">
         <option value="選択" selected="">選択して下さい</option>
         <option value="日用品">日用品</option>
         <option value="野菜">野菜</option>
         <option value="果物">果物</option>
         <option value="生肉">生肉</option>
         <option value="鮮魚">鮮魚</option>
         <option value="菓子">菓子</option>
         <option value="飲料">飲料</option>
         <option value="冷凍食品">冷凍食品</option>
         <option value="その他">その他</option>
      </select></p><br>
         <input type="submit" value="　登 録 する　" name="Submit">
      </form><br>
      <form action="./logpro.jsp" method="post">
         <input type="submit" value="　一覧表示　" name="btnSubmit">
      </form>
      <br><br>
      <%
      }else{
         out.print("<p>ユーザー名とパスワードが違います。<BR>入力し直してください。</p><BR>");
%>
      <form action="./login.jsp" method="post">
         <input type="submit" value="　再ログインへ　" name="btnSubmit">
      </form><br><br>
<%
      }
      dc.close();
      ds.close();
      dr.close();
   }catch(NumberFormatException e){
            out.print("<p>正しく入力してください！</p><br>");
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
      <form action="./index.html" method="post">
         <input type="submit" value="　H O M E　" name="btnSubmit">
      </form>
         </center>
      </div>
   </body>
</html>
