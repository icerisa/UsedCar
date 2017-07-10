<%-- 
    Document   : testjsp
    Created on : Jul 6, 2017, 1:24:52 AM
    Author     : yacth_Mon
--%>
<% 
    String data = (String)request.getAttribute("testData");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your data is</h1>
        <%=data%>
    </body>
</html>
