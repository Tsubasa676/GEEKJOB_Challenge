<%-- 
    Document   : db3
    Created on : 2017/01/25, 11:45:01
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題１０</title>
   </head>
   <body>
      <h1>課題１０</h1>
      <p>< profileIDで指定したレコードを削除する ></p>
      <%
         request.setCharacterEncoding("UTF-8");
         Connection db_con       = null;
         PreparedStatement db_st = null;
         ResultSet db_data       = null;
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         String sql = "delete from profiles where profilesID=?;";
         
         try{
            //入力されたIDの数値
            String p = request.getParameter("de");
            int id = Integer.parseInt(p);
            out.print("<p>★『 "+id+" 』が入力されました</p>");
            //DB
            out.print("現在DBに入っている情報を表示します。<br>");
            db_st   = db_con.prepareStatement("select * from profiles");
            db_data = db_st.executeQuery();
            while(db_data.next()){
               out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
                  +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
                  +"　誕生日："+db_data.getString("birthday")+"<br>");
            }
            out.print("<br>profilesID「"+id+"」を削除して、<br>現在DBに入っている情報を表示します。<br>");
            db_st = db_con.prepareStatement(sql);
            db_st.setInt(1,id);
            db_st.executeUpdate();
            db_st   = db_con.prepareStatement("select * from profiles");
            db_data = db_st.executeQuery();
            while(db_data.next()){
               out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
                  +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
                  +"　誕生日："+db_data.getString("birthday")+"<br>");
            }

            db_con.close();
            db_st.close();
            db_data.close();
         }catch(NumberFormatException e){
            out.print("　<p>半角数字を入力してください！</p>");
         }catch(SQLException e_sql){
         out.print("接続時にエラーが発生しました。e_sql："+e_sql.toString()+"<br>");
         }catch(Exception e){
         out.print("接続時にエラーが発生しました。e："+e.toString()+"<br>");
         }finally{//必ず実行される。
            if (db_con!=null){
               try{
                  db_con.close();//↓例外あった時用に必ずかく
               }catch (Exception e_con){
                  out.println(e_con.getMessage());
               }
            }
         }
      
      %>
      <form action="./index.html" method="post">
         <input type="submit" value="　H O M E　" name="btnSubmit">
      </form>
   </body>
</html>
