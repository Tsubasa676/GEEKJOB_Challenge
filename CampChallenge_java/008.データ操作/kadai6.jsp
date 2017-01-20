<%-- 
    Document   : kadai6
    Created on : 2017/01/20, 13:44:22
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>様々なhtmlタグを使ってみよう</title>
   </head>
   <body>
      <h2>課題６＜様々なhtmlタグを使ってみよう＞</h2>
      <a name="modoru"></a>
      <a href="#idou">ページの下に移動</a>

      <p style="line-height : 1700%;">行間の広さを決める<br>
         em指定：??em(1emが標準)<br>
         px指定：??px</p>
      <p style="line-height : 100px;">&lt;br&gt;はたくさん使うのは避け、line-heightなどで調整</p>
      
      <p><image src=https://dl.dropboxusercontent.com/u/39109715/100.png alt="100pxの画像"></p>
      <p>Doropboxから引っ張ってきてる</p>
      
       
      <p><a href="https://www.google.co.jp/">Google　へのリンク</a href></p>
      
      <ul>
        <Li>使ったことのあるPC
            <ul>
                <li>Win</li>
                <li>Mac</li>
            </ul>
        </Li>
        <Li>使ったことのある端末
            <ul>
                <li>iPhone</li>
                <li>iPad</li>
                <li>Android</li>
            </ul>
        </Li>
    </ul>
      
      <p><a name="idou">移動してきました。</a></p>
      <a href="#modoru">ページ上部に戻る</a>
      <p style="line-height : 1000%;"><font color=#1100aa>フォントの色を変える</font></p>
      <p style="line-height : 1000%;"><font color=#11ddaa>フォントの色を変える</font></p>
      <form action="./index.html" method="post">
      <input type="submit" value="index.htmlへ戻る" name="CSubmit">
      </form>
   </body>
</html>
