<%-- 
    Document   : db4
    Created on : 2017/01/25, 13:07:48
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題１１</title>
   </head>
   <body>
      <h1>課題１１</h1>
      <p>< profileIDで指定したレコードの、profileID以外の要素をすべて上書きできるフォームを作成 ></p>
      <%
         request.setCharacterEncoding("UTF-8");
         Connection db_con       = null;
         PreparedStatement db_st = null;
         ResultSet db_data       = null;
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         String sql = "update profiles set name=?,tell=?,age=?,birthday=? where profilesID=?;";
         //入力データを受け取ります
         String n1 = request.getParameter("na1");
         String n2 = request.getParameter("na2");
         String na = n1+" "+n2;
         String t1 = request.getParameter("num1");
         String t2 = request.getParameter("num2");
         String t3 = request.getParameter("num3");
         String tel= t1+"-"+t2+"-"+t3;
         String to = request.getParameter("toshi");
         int toshi = Integer.parseInt(to);
         String b1 = request.getParameter("bir1");
         String b2 = request.getParameter("bir2");
         String b3 = request.getParameter("bir3");
         String bir= b1+"-"+b2+"-"+b3;
         
         try{
         String p = request.getParameter("db11");
         int id = Integer.parseInt(p);
         out.print("<p>★profileID『 "+id+" 』が入力されました</p>");
         out.print("お名前　『 "+na+" 』<br>");
         out.print("電話番号『 "+tel+" 』<br>");
         out.print("年齢　　『 "+toshi+" 』<br>");
         out.print("誕生日　『 "+bir+" 』<br><br>");
         out.print("現在DBに入っている情報を表示します。<br>");
         db_st   = db_con.prepareStatement("select * from profiles");
            db_data = db_st.executeQuery();
            while(db_data.next()){
               out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
                  +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
                  +"　誕生日："+db_data.getString("birthday")+"<br>");
            }
            
         out.print("<br>profilesID「"+id+"」のユーザーを選び、<br>DBに入っている情報を更新して表示します。<br>");
         db_st = db_con.prepareStatement(sql);
            db_st.setString(1,na);
            db_st.setString(2,tel);
            db_st.setInt(3,toshi);
            db_st.setString(4,bir);
            db_st.setInt(5,id);
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
            out.print("　<p>半角数字を入力してください！</p><br>");
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
