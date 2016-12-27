<%-- 
    Document   : 四則演算
    Created on : 2016/12/27, 12:47:25
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
    //変数・定数
    final int x = 11;
    int y = 5;
    //計算
    int a = x+y;
    int b = x-y;
    int c = x*y;
    int d = x/y;
    //出力
    out.print("xは"+x+"、ｙは"+y+"<br>");
    out.print(x+" + "+y+" ＝ "+a+"<br>");
    out.print(x+" - "+y+" ＝ "+b+"<br>");
    out.print(x+" × "+y+" ＝ "+c+"<br>");
    out.print(x+" ÷ "+y+" ＝ "+d+"<br>");
%>
