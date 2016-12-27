<%-- 
    Document   : クエリストリング
    Created on : 2016/12/27, 13:04:45
    Author     : mbp13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
    //クエリストリング
    String a1 = request.getParameter("gaku");
    String a2 = request.getParameter("kazu");
    String a3 = request.getParameter("syurui");
    //数字に変換
    int b1 = Integer.parseInt(a1);
    int b2 = Integer.parseInt(a2);
    int b3 = Integer.parseInt(a3);
    //商品種別
    if(b3==1){
        out.print("雑貨　を選びました。"+"<br>");
    }else if(b3==2){
        out.print("生鮮食品　を選びました。"+"<br>");
    }else{
        out.print("その他　を選びました。"+"<br>");
    }
    //一個あたりの値段
    out.print("一個あたりの値段は"+(b1/b2)+"でした。"+"<br>");
    //ポイント判定
    out.print("お買い上げ金額は"+b1+"円でしたので、");
    if(b1>=5000){
        out.print("５％のポイントがつきました。"+"<br>");
    }else if(b1>=3000){
        out.print("４％のポイントがつきました。"+"<br>");
    }else{
        out.print("ポイントはつきませんでした。"+"<br>");
    }
    
    
%>