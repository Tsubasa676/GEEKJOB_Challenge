<%-- 
    Document   : db1
    Created on : 2017/01/23, 16:05:50
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題８</title>
   </head>
   <body>
      <h1>課題８</h1>
      <p><検索用のフォームを用意し、名前の部分一致で検索＆表示する処理を構築してください。></p>
      <% //index.htmlにて文字を入力してからの処理
         request.setCharacterEncoding("UTF-8");
         Connection db_con       = null;
         PreparedStatement db_st = null;
         ResultSet db_data       = null; 
         String one = request.getParameter("one");//index.htmlから文字列取得して
         String os ="";//「one」の頭の一文字を切り取る
         int co = 1;//カウンター
         if(one.equals("")){
            out.print("<p>HOMEに戻り、入力してください。</p>");
         }else{
            char[] charArray = one.toCharArray();
            for (int i =0;i<1;i++) {//入力された文字列の最初のみ取得してString型に戻す
            char on = charArray[i];
            os = String.valueOf(on);
            }
            out.print("<p>『 "+os+" 』を検索、表示します。</p>");
         try{
         out.print("<br><br>");
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         db_st  = db_con.prepareStatement("select * from profiles where name LIKE ?");
         db_st.setString(1,"%"+os+"%");
         db_data= db_st.executeQuery();
         while(db_data.next()){
            co = co+1;
            out.print(co+"人目の name に『 "+os+" 』を含む情報を表示します<br>");
            out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
               +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
               +"　誕生日："+db_data.getString("birthday")+"<br><br>"); 
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
