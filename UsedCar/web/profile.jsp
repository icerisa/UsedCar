<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="img/appleicon.png">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>โปรไฟล์ส่วนตัว</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min1.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />



        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="css/demo.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material.indigo-pink.min.css">


    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="brand">KKP USED Car</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>


        <!--   Big container   -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2" >

                    <!--      Wizard container        -->
                    <div class="wizard-container">
                        <div class="card wizard-card" data-color="azzure" id="wizard" >
                            <form action="" method="">
                                <!--        You can switch ' data-color="azzure" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                                <div class="wizard-header">
                                    <h3 style="font-size: 22pt">
                                        <b>ข้อมูลส่วนตัว</b> <br>

                                    </h3>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-sm-10 col-sm-offset-1">
                                        <div class="form-group">
                                            <label>ชื่อบัญชีผู้ใช้งาน</label>
                                            <input type="text" class="form-control" value="srisamorn.kha" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>ชื่อ</label>
                                            <input type="text" class="form-control" value="ศรีสมร" >
                                        </div>
                                        <div class="form-group">
                                            <label>นามสกุล</label>
                                            <input type="text" class="form-control" value="ขจรกลิ่น">
                                        </div>
                                        <div class="form-group">
                                            <label>E-Mail</label>
                                            <input type="email" class="form-control" value="srisamorn@hotmail.com" >
                                        </div>
                                        <div class="form-group">
                                            <label>เบอร์โทรศัพท์ติดต่อ</label>
                                            <input type="tel" class="form-control" value="0818885555" >
                                        </div>
                                    </div>
                                </div>

                                <div class="wizard-footer">
                                    <center><input type='button' class='btn  btn-fill btn-info' name='confirm' value='ตกลง' /></center>
                                    <div class="clearfix"></div>
                                </div>
                            </form>
                        </div>
                    </div> <!-- wizard container -->
                </div>
            </div> <!-- row -->
        </div> <!--  big container -->
        <!--
            <div class="footer">
                <div class="container">
                     Kiatnakin Bank
                </div>
            </div>
        -->

    </div>

    <div class="footer">
        <p>Kiatnakin Bank</p>

    </div>

</body>

<!--   Core JS Files   -->
<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="js/gsdk-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="js/jquery.validate.min.js"></script>

</html>
