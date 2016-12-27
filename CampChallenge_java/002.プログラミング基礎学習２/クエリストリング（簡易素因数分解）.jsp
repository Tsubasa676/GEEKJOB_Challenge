<%-- 
    Document   : クエリストリング（簡易素因数分解）
    Created on : 2016/12/27, 14:09:58
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   //クエリストリング
   String xx = request.getParameter("x");
   //数字に変換
   int x = Integer.parseInt(xx);
   //変数
   int a=0;
   int b=0;
   int c=0;
   int d=0;
   //出力
   out.print("元の値 "+x+"<br>");
   out.print("素因数分解すると"+"<br>");
   //繰り返し
   while(x%2==0){
      x/=2;
      a++;		
   }
   while (x%3==0) {
      x/=3;
      b++; 
   }
   while (x%5==0) {
      x/=5;
      c++;
   }
   while (x%7==0) {
      x/=7;
      d++;
   }
   //出力判定
   if (x>1){
      out.print("2が"+a+"、3が"+b+"、5が"+c+"、7が"+d+"、"+"その他、でした。");
   }else{
      out.print("2が"+a+"、3が"+b+"、5が"+c+"、7が"+d+"、"+"でした。");
   }
   
   
   
   
   
   
%>