<%-- 
    Document   : db5
    Created on : 2017/01/25, 13:44:37
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題１２</title>
   </head>
   <body>
      <h1>課題１２</h1>
      <p>< 入力した名前、年齢、誕生日を使った複合検索 ></p>
      <%
         request.setCharacterEncoding("UTF-8");
         Connection        dc = null;
         PreparedStatement ds = null;
         ResultSet         dr = null;
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         dc = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         String sql = "";
         //select文の分岐用変数
         int name12 = 0 ;
         int toshi12 = 0 ;
         int bir12 = 0 ;
         //カウント用変数
         int co =0;
         //入力データを受け取ります
            String na = request.getParameter("na12");
            if(na.equals("")){
               name12 = 0;
            }else{
               name12 = 1;
            }
            String  t = request.getParameter("toshi2");
            int    to;
            if(t.equals("999")){
               to=999;//無効化
               toshi12=0;
            }else{
               to = Integer.parseInt(t);
               toshi12=1;
            }
            String b1 = request.getParameter("bir12");
            String b2 = request.getParameter("bir22");
            String b3 = request.getParameter("bir32");
            String bir;
            if(!b1.equals("9999")&&!b2.equals("99")&&!b3.equals("99")){
               bir = b1+"-"+b2+"-"+b3;
               bir12 = 1 ;
            }else if(b3.equals("99")&&!b1.equals("9999")&&!b2.equals("99")){
               bir = b1+"-"+b2;
               bir12 = 1 ;
            }else if(b2.equals("99")&&!b1.equals("9999")){
               bir = b1;
               bir12 = 1 ;
            }else if(b2.equals("99")&&b3.equals("99")&&!b1.equals("9999")){
               bir = b1;
               bir12 = 1 ;
            }else if(b1.equals("9999")&&!b2.equals("99")||b1.equals("9999")&&!b3.equals("99")){
               bir="年を除く検索はできません";
               bir12 = 0 ;
            }else{
               bir ="";
               bir12 = 0 ;
            }

         try{
            out.print("お名前　『 "+na+" 』<br>");
            if(to==999){
               out.print("年齢　　『   』<br>");
            }else{
               out.print("年齢　　『 "+to+" 』<br>");
            }
            out.print("誕生日　『 "+bir+" 』<br>");
            out.print("<p>からの検索結果を表示します。</p>");
            
            //select文の分岐用変数を元にselect文を決めます。
            if(name12==1&&toshi12==1&&bir12==1){
               sql = "select * from profiles where name like ? and age like ? and birthday like ?;";
               ds = dc.prepareStatement(sql);
               ds.setString(1,"%"+na+"%");
               ds.setInt(2,to);
               ds.setString(3,"%"+bir+"%");
            }else if(name12==1&&toshi12==1&&bir12==0){
               sql = "select * from profiles where name like ? and age like ?";
               ds = dc.prepareStatement(sql);
               ds.setString(1,"%"+na+"%");
               ds.setInt(2,to);
            }else if(name12==1&&toshi12==0&&bir12==0){
               sql = "select * from profiles where name like ?";
               ds = dc.prepareStatement(sql);
               ds.setString(1,"%"+na+"%");
            }else if(name12==1&&toshi12==0&&bir12==1){
               sql = "select * from profiles where name like ? and birthday like ?;";
               ds = dc.prepareStatement(sql);
               ds.setString(1,"%"+na+"%");
               ds.setString(2,"%"+bir+"%");
            }else if(name12==0&&toshi12==1&&bir12==1){
               sql = "select * from profiles where age like ? and birthday like ?;";
               ds = dc.prepareStatement(sql);
               ds.setInt(1,to);
               ds.setString(2,"%"+bir+"%");
            }else if(name12==0&&toshi12==1&&bir12==0){
               sql = "select * from profiles where age like ?;";
               ds = dc.prepareStatement(sql);
               ds.setInt(1,to);
            }else if(name12==0&&toshi12==0&&bir12==1){
               sql = "select * from profiles where birthday like ?;";
               ds = dc.prepareStatement(sql);
               ds.setString(1,"%"+bir+"%");
            }else{
               sql = "select * from profiles;";
               ds = dc.prepareStatement(sql);
               out.print("<p>何も入力されていないので全て表示します。</p>");
            }
            dr = ds.executeQuery();
            while(dr.next()){
               co++;
               out.print("ID："+dr.getString("profilesID")+"　名前："+dr.getString("name")
                  +"　電話："+dr.getString("tell")+"　年齢："+dr.getString("age")
                  +"　誕生日："+dr.getString("birthday")+"<br>");
            }
            if(co==0){
               out.print("<p>検索するにはHOMEから入力する必要があります。</p>");
            }else{
               out.print("<p>結果："+co+"人見つかりました。</p>");
            }
            dc.close();
            ds.close();
            dr.close();
         }catch(NumberFormatException e){
            out.print("　<p>入力してください！</p><br>");
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
   </body>
</html>
