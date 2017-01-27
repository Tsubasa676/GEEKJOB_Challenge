<%-- 
    Document   : logreg
    Created on : 2017/01/27, 10:19:37
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>課題１３ 登録</title>
   </head>
   <body>
      <form action="./login.jsp" method="post">
         <input type="submit" value="　サインアウト　" name="btnSubmit">
      </form>
      <div>
         <center>
      <h1>DB内に商品を登録</h1>
      <%
         request.setCharacterEncoding("UTF-8");
         Connection        dc = null;
         PreparedStatement ds = null;
         ResultSet         dr = null;
         int count =0;
         String bas = request.getParameter("ba");
         String name = request.getParameter("na");
         String vas = request.getParameter("va");
         String clas = request.getParameter("fi");
         if(bas.equals("")||name.equals("")||vas.equals("")||clas.equals("選択")){
            bas = "例外を";
            vas = "発生させる";
         }
         String sql= "INSERT INTO product13 values(?,?,?,?)";
         try{
         int bar = Integer.parseInt(bas);
         int val = Integer.parseInt(vas);
         out.print("バーコード："+bar+"<br>商品名："+name+"<br>商品価格："+val+"<br>商品分類："+clas+"<br>を登録しました。<br>");
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         dc = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         
         ds = dc.prepareStatement(sql);
         ds.setInt(1,bar);
         ds.setString(2,name);
         ds.setInt(3,val);
         ds.setString(4,clas);
         ds.executeUpdate();

         ds   = dc.prepareStatement("select * from product13");
         dr = ds.executeQuery();
         while(dr.next()){
            count++;
         }
         out.print("<br>現在 "+count+"件の商品が登録されています。");
         
            dc.close();
            ds.close();
            dr.close();
         }catch(NumberFormatException e){
            out.print("<p>４項目正しく入力してください！</p><br>");
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
      <form action="./logmenu.jsp" method="post">
         <input type="submit" value="　メニュー　" name="btnSubmit">
      </form>
         </center>
      </div>
   </body>
</html>
