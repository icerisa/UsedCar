<%-- 
    Document   : login
    Created on : Jul 9, 2017, 6:59:14 PM
    Author     : yacth_Mon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="apple-touch-icon" sizes="76x76" href="/img/appleicon.png">
        <link rel="icon" type="/image/png" href="/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <title>KKP Used Car - ลงชื่อเข้าสู่ระบบ</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_login.css">
    </head>

    <body>
        <div class="login">
            <div class="login-header">
                <center><img class="sizeimg" src="https://lh3.googleusercontent.com/3JjQOPzBImsUhHC04mo2ZOkgNXzL2RmY6fB6S3WAveS3qqRnIHY8NFuqwmvKNx8rQA=w300"></center>
            </div>
            <div class="login-form">
                <form action="Login" method="post">
                <h3>บัญชีผู้ใช้:</h3>
                <input type="text" placeholder="กรอกบัญชีผู้ใช้" required name="username" /><br>
                <h3>รหัสผ่าน:</h3>
                <input type="password" required placeholder="กรอกรหัสผ่าน" name="password"/>
                <br>
                <a class="forget">ลืมรหัสผ่าน</a>
                <br><br>
                <input type="submit" value="เข้าสู่ระบบ" class="login-button"/>
                </form>
            </div>
        </div>
    </body>

</html>