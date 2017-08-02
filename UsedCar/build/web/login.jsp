<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="apple-touch-icon" sizes="76x76" href="/img/appleicon.png">
        <link rel="icon" type="/image/png" href="/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <title>T-ratecar - ลงชื่อเข้าสู่ระบบ</title>

        <script src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_login.css">
    </head>

    <body>
        <div class="login">
            <div class="login-header">
                <center><img class="sizeimg" src="img/unnamed.png"></center>
            </div>
            <div class="login-form">
                <!--Notification-->
                <!-- Success -->
                <% String successMessage = (String)request.getAttribute("successMessage");
                    if (successMessage != null && !successMessage.isEmpty()) {%>
                <div class="alert alert-success alert-dismissable fade in">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <%out.println(successMessage);%>
                </div>
                <%}%>
                <!-- Danger -->
                <% String dangerMessage = (String)request.getAttribute("dangerMessage");
                    if (dangerMessage != null && !dangerMessage.isEmpty()) {%>
                <div class="alert alert-danger alert-dismissable fade in">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <%out.println(dangerMessage);%>
                </div>
                <%}%>                
                <!--Notification-->
                <form action="Login" method="post">
                    <h3>บัญชีผู้ใช้:</h3>
                    <input type="text" placeholder="กรอกบัญชีผู้ใช้" name="username" required/><br>
                    <h3>รหัสผ่าน:</h3>
                    <input type="password" placeholder="กรอกรหัสผ่าน" name="password" required/>
                    <br>
                    <!--<a class="forget">ลืมรหัสผ่าน</a>-->
                    <br><br>
                    <input type="submit" value="เข้าสู่ระบบ" class="login-button"/>
                </form>
            </div>
        </div>
    </body>

</html>