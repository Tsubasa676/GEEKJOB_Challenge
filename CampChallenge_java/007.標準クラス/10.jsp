<%-- 
    Document   : 10
    Created on : 2017/01/17, 17:07:56
    Author     : mbp13
--%>

<%@page import="java.util.*,java.text.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Java 標準クラス</title>
   </head>
   <body>
      <h2>１つJavaの標準クラスを選び、実際にロジックを作成してみる。</h2>
      ①処理の経過を書き込むログファイルを作成する。<br>
      ②処理の開始、終了のタイミングで、ログファイルに開始・終了の書き込みを行う。<br>
      ③書き込む内容は、「日時　状況（開始・終了）」の形式で書き込む。<br>
      ④最後に、ログファイルを読み込み、その内容を表示してください。
      <h1>課題７「文字の入れ替え」を選択</h1>
   </body>
</html>
<%
   //log1ファイルの用意
   File txt = new
   File(application.getRealPath("log1.txt"));
   FileReader fr = new FileReader(txt);
   BufferedReader br = new BufferedReader(fr);
   
   //日時取得用意
   Date date = new Date();
   Calendar ca = Calendar.getInstance();
   ca.setTime(date);
   int yy = ca.get(Calendar.YEAR);
   int MM = ca.get(Calendar.MONTH)+1;
   int dd = ca.get(Calendar.DAY_OF_MONTH);
   int HH = ca.get(Calendar.HOUR);
   int mm = ca.get(Calendar.MINUTE);
   int ss = ca.get(Calendar.SECOND);
   //log1ファイルへ開始の書き込み
   FileWriter fw = new FileWriter(txt);
   BufferedWriter bw = new BufferedWriter(fw);
   fw.write("処理開始"+dd+"日"+HH+"時"+mm+"分"+ss+"秒");
   fw.close();
   
   //課題７の実行
   String bun = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
   String bun2=bun.replace("I","い");
   out.print("文章の「I」⇒「い」に、「U」⇒「う」に入れ替える処理を作成し結果を表示<br>");
   out.print("元の文「きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます」<br>結果　　");
   out.print(bun2.replace("U","う")+"<br><br>");
   
   //log1ファイルへ終了の書き込み
   Calendar ca2 = Calendar.getInstance();
   ca2.setTime(date);
   int ss2 = ca2.get(Calendar.SECOND);
   FileWriter fwa = new FileWriter(txt,true);//１度しか使えないから何度も書くときは書き込み使う
   fwa.write("処理終了"+dd+"日"+HH+"時"+mm+"分"+ss2+"秒");
   fwa.close();

   //log1ファイルから読み込み
   String str;
   while((str=br.readLine())!=null){
      out.print(str);
   }






%>