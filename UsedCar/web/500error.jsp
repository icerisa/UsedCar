

<%@page import="model.Calculator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>That's so bad :(</h1>
        <h3>You though it was success but it's error.</h3>
        <% String message = (String)request.getAttribute("Message");
            Exception e = (Exception)request.getAttribute("Exception");
            out.println("Message : " + message + "<br><br>");
            out.println("Exception : " + e +"<br>");
        %>
    </body>
</html>
