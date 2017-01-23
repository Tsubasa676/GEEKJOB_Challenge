/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc10;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author mbp13
 */
public class dbaccess extends HttpServlet {

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
      //PreparedStatement db_st = null;
      //ResultSet db_data       = null; 
           
      try{
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db","root","root");
         //db_st  = db_con.prepareStatement("select * from user where age = ?");
         //db_st.setInt(1,24);
         //db_data= db_st.executeQuery();
         //while(db_data.next()){
         //   out.print(""+db_data.getString("name")+"<br>");
         //}
         
         db_con.close();
         out.print("corrected<br>");
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
   


   //<editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
