<%-- 
    Document   : 1if文
    Created on : 2016/12/27, 12:59:14
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
    //変数
    int x = 0;
    //代入
    x = 1;
    //if
    if(x==1){
        out.print("１です！");
    }else if(x==2){
        out.print("プログラミングキャンプ！");
    }else{
        out.print("その他です！");
    }
    
    
%>