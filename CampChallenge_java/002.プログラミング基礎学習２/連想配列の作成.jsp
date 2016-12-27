<%-- 
    Document   : 連想配列の作成
    Created on : 2016/12/27, 14:09:21
    Author     : mbp13
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HashMap<String, String> f =
      new HashMap<String,String>();
   
      f.put("1","AAA");
      f.put("hello","world");
      f.put("soeda","33");
      f.put("20","20");
      
      out.print(f.get("1")+"<br>");
      out.print(f.get("hello")+"<br>");
      out.print(f.get("soeda")+"<br>");
      out.print(f.get("20")+"<br>");
      
      
%>