<%-- 
    Document   : db2
    Created on : 2017/01/24, 16:09:41
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題９</title>
   </head>
   <body>
      <h1>課題９</h1>
      <p><フォームからデータを挿入できる処理を構築してください。></p>
      <%
         request.setCharacterEncoding("UTF-8");
         Connection db_con       = null;
         PreparedStatement db_st = null;
         ResultSet db_data       = null;
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
         //出力します
         out.print("お名前　『 "+na+" 』<br>");
         out.print("電話番号『 "+tel+" 』<br>");
         out.print("年齢　　『 "+toshi+" 』<br>");
         out.print("誕生日　『 "+bir+" 』<br><br>");
         //データベース内の情報件数を入れる変数
         int dbc = 1;
         //insert文
         String sql = "INSERT INTO profiles values(?,?,?,?,?)";
         String no ="";
         //接続設定
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         
         if(n1.equals(no)||n2.equals(no)||t1.equals(no)||t2.equals(no)||t3.equals(no)){
            out.print("現在DBに入っている情報を表示します。<br>");
         db_st   = db_con.prepareStatement("select * from profiles");
         db_data = db_st.executeQuery();
         while(db_data.next()){
            out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
               +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
               +"　誕生日："+db_data.getString("birthday")+"<br>");
         }
            out.print("<p>★新たにデータを挿入するには<br>　「 H O M E 」　に戻って「全て」入力してください</p>");
         }else{
            try{
         //データベース内の情報件数を調べる
         db_st   = db_con.prepareStatement("select * from profiles");
         db_data = db_st.executeQuery();
         while(db_data.next()){
            dbc = dbc+1;
         }
         //out.print("　"+dbc+"がデータベース内の情報件数なので、<br>");//件数を得られたので+1して入力したユーザーのIDにする
         out.print("　"+na+"さんのprofilesIDは「"+(dbc+1)+"」になります。<br>");
         
         //int update1 = db_st.executeUpdate("insert into profiles() value(dbc,'%na%','%tel%','toshi','%bir%');");
         //int sql = db_st.executeUpdate("insert into profiles() value(?,?,?,?,?);");
         db_st = db_con.prepareStatement(sql);
         db_st.setInt(1,dbc);
         db_st.setString(2,na);
         db_st.setString(3,tel);
         db_st.setInt(4,toshi);
         db_st.setString(5,bir);
         db_st.executeUpdate();
         
         out.print("書き込みできたか確認します。<br>");
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
         }//else
         
      %>
      <form action="./index.html" method="post">
         <input type="submit" value="　H O M E　" name="btnSubmit">
      </form>
   </body>
</html>
