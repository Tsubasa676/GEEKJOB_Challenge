<%@page import="jums.JumsHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error</title>
    </head>
    <body bgcolor="#FFCCCC">
        エラーが発生しました(error.jsp)。以下の項目を確認してください。<br>
        <%=request.getAttribute("error")%><br><br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>