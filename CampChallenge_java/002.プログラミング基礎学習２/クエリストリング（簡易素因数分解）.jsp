<%-- 
    Document   : クエリストリング（簡易素因数分解）
    Created on : 2016/12/27, 14:09:58
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//クエリストリングを利用して、以下の処理を実現してください。
//簡易素因数分解のロジックを作成します。
//クエリストリングから渡された数値を1ケタの素数で可能な限り分解し、
//元の値と素因数分解の結果を表示するようにしてください。
//2ケタ以上の素数が含まれた数値の場合は、
//「元の値　1ケタの素因数　その他」と表記して、その他　に含んでください。

   //クエリストリング
   String xx = request.getParameter("x");
   //数字に変換
   int x = Integer.parseInt(xx);
   int a=0;
   int b=0;
   int c=0;
   int d=0;
   //出力
   out.print("元の値 "+x+"<br>");
   out.print("素因数分解すると"+"<br>");
   
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
   out.print("2が"+a+"、3が"+b+"、5が"+c+"、7が"+d+"、"+x+"でした。");
   
   
   
   
   
%>