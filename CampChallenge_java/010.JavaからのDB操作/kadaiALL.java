/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc10;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mbp13
 */
public class kadaiALL extends HttpServlet {

   /**
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
    * methods.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      
      PrintWriter out = response.getWriter();
      
      Connection db_con       = null;
      PreparedStatement db_st = null;
      ResultSet db_data       = null; 
           
      try{
         out.print("DBに接続を試みます。<br><br>");
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         //課題２
         //「テーブルの作成とinsert」で作成したテーブルに自由なメンバー情報を格納する処理を構築
         int update1 = db_st.executeUpdate("insert into profiles() value(4,'佐藤 清','012-0987-6543',19,'2005-08-01');");
         out.print("課題２：自由なメンバー情報を格納しました。<br><br>");
         
         //課題３
         //テーブルの作成とinsert」で作成したテーブルからSELECT*により全件取得して全情報を表示
         db_st   = db_con.prepareStatement("select * from profiles");
         db_data = db_st.executeQuery();
         while(db_data.next()){
            out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
               +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
               +"　誕生日："+db_data.getString("birthday")+"<br>");
         }
         out.print("課題３：全情報を表示しました。<br><br>");
         
         //課題４
         //「テーブルの作成とinsert」で作成したテーブルからprofileID=1の情報を取得して情報を表示
         db_st  = db_con.prepareStatement("select * from profiles where profilesID = ?");
         db_st.setInt(1,1);
         db_data= db_st.executeQuery();
         while(db_data.next()){
            out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
               +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
               +"　誕生日："+db_data.getString("birthday")+"<br>");
         }
         out.print("課題４：profileID=1の情報を表示しました。<br><br>");
         
         //課題５
         //nameに「茂」を含む情報を取得し、画面に取得した情報を表示してください
         db_st  = db_con.prepareStatement("select * from profiles where name LIKE ?");
         db_st.setString(1,"茂");
         db_data= db_st.executeQuery();
         while(db_data.next()){
            out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
               +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
               +"　誕生日："+db_data.getString("birthday")+"<br>");
         }
         out.print("課題５：nameに「茂」を含む情報を表示しました。<br><br>");
         
         //課題６
         //「テーブルへ情報を格納」でINSERTしたレコードを指定して削除、SELECT*で結果を表示
         int delete1 = db_st.executeUpdate("delete from profiles where profilesID=4;");
         db_st   = db_con.prepareStatement("select * from profiles");
         db_data = db_st.executeQuery();
         while(db_data.next()){
            out.print("ID："+db_data.getString("profilesID")+"　名前："+db_data.getString("name")
               +"　電話："+db_data.getString("tell")+"　年齢："+db_data.getString("age")
               +"　誕生日："+db_data.getString("birthday")+"<br>");
         }
         out.print("課題６：insertしたレコードを削除しました。<br><br>");
         
         //課題７
         //profileID=1のnameを「松岡 修造」に、ageを48に、birthdayを1967-11-06に更新
         int update2 =  db_st.executeUpdate("update profiles set name='松岡 修造',age=48,birthday='1967-11-06' where profilesID=1;");
         out.print("課題７：profileID=1の情報を更新しました。<br><br>");
         
         
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
               out.print("finally try"+"<br>");
            }catch (Exception e_con){
               out.println(e_con.getMessage());
               out.print("finally catch"+"<br>");
            }
         }
      }
   }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   /**
    * Handles the HTTP <code>GET</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      processRequest(request, response);
   }

   /**
    * Handles the HTTP <code>POST</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      processRequest(request, response);
   }

   /**
    * Returns a short description of the servlet.
    *
    * @return a String containing servlet description
    */
   @Override
   public String getServletInfo() {
      return "Short description";
   }// </editor-fold>

}
