<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="img/appleicon.png">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>จัดการบัญชีผู้ใช้</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet" type="text/css">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min1.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" />        
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>

    <body>
        <jsp:include page="menu.jsp" />        
        <jsp:include page="modal.jsp" />        
        <div class="brand">T-ratecar</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>


        <!--   Big container   -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2" >

                    <!--      Wizard container        -->
                    <div class="wizard-container">
                        <div class="card wizard-card" data-color="azzure" id="wizard" >

                            <!--        You can switch ' data-color="azzure" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                            <div class="wizard-header">
                                <h3 style="font-size: 22pt">
                                    <b>จัดการบัญชีผู้ใช้</b> <br>

                                </h3>
                            </div>
                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#reset" data-toggle="tab">รีเซ็ตรหัสผ่าน</a></li>
                                    <li><a href="#create" data-toggle="tab">สร้างบัญชีผู้ใช้</a></li>
                                    <li><a href="#delete" data-toggle="tab">ลบบัญชีผู้ใช้</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">


                                <div class="tab-pane" id="reset">
                                    <form action="Manage_user" method="POST" id='resetPasswordForm'>
                                        <input type="hidden" name='target' value='resetPassword'>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h4 class="info-text">รีเซ็ตรหัสผ่าน</h4>
                                            </div>
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <div class="form-group">
                                                    <label>กรอกบัญชีผู้ใช้</label>
                                                    <input type="text" class="form-control" id="resetPasswordUsername" name='username' placeholder="บัญชีผู้ใช้">
                                                </div>
                                                <div class="form-group">
                                                    <label>กรอกรหัสผ่าน</label>
                                                    <input type="password" id='resetPassword' name="password" class="form-control" placeholder="รหัสผ่าน"  >
                                                </div>
                                                <div class="form-group">
                                                    <abel>ยืนยันรหัสผ่าน</label>
                                                        <input type="password" id='resetConfirmPassword' name='passwordRetry' class="form-control" placeholder="กรอกรหัสผ่านอีกครั้ง"  >
                                                        <div id='message'></div>
                                                        <div id='messagePassword'></div>
                                                </div>
                                                <script>
                                                    let passwordResetMatch = false;
                                                    let passwordResetLegth = false;
                                                    $("#resetPasswordForm input[name=username]").on('keyup', checkResetRequired)
                                                    $('#resetPasswordForm input[name=password],#resetPasswordForm input[name=passwordRetry]').on('keyup', function () {
                                                        if ($(this).val() !== '') {
                                                            if ($('#resetPasswordForm input[name=password]').val() === $('#resetPasswordForm input[name=passwordRetry]').val()) {
                                                                $('#message').html('Matching').css('color', 'green').show().fadeOut(1000);
                                                                passwordResetMatch = true;
                                                            } else {
                                                                $('#message').html('Not Matching').css('color', 'red').show();
                                                                passwordResetMatch = false;
                                                            }
                                                        } else {
                                                            $('#message').html('กรุณากรอกรหัสผ่าน').css('color', 'red').show();
                                                        }
                                                        //check length atlest 8 chatacter
                                                        if ($(this).val().length < 8) {
                                                            $('#messagePassword').html('รหัสผ่านต้องมากกว่า 8 ตัว').css('color', 'red').show();
                                                            passwordResetLegth = false;
                                                        } else {
                                                            $('#messagePassword').html('รหัสผ่านต้องมากกว่า 8 ตัว').css('color', 'green').show().fadeOut(1000);
                                                            passwordResetLegth = true;
                                                        }
                                                        checkResetRequired();
                                                    });

                                                    function checkResetRequired() {
                                                        if (passwordResetMatch && passwordResetLegth) {
                                                            if ($("#resetPasswordForm input[name=username]").val() != "") {
                                                                $("#resetPasswordForm input[type=submit]").prop('disabled', false);
                                                                return;
                                                            }
                                                        }
                                                        $("#resetPasswordForm input[type=submit]").prop('disabled', true)
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                        <center><input type='submit' id='resetPasswordSubmit'class='btn  btn-fill btn-info' name='confirm' value='ยืนยัน' disabled/></center>
                                    </form>
                                </div>


                                <div class="tab-pane" id="create">
                                    <h4 class="info-text">สร้างบัญชีผู้ใช้ </h4>
                                    <form action="Manage_user" method="POST" id='createAccountForm'>
                                        <input type="hidden" name='target' value='createAccount'>
                                        <div class="row">
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <div class="form-group">
                                                    <label>กรอกบัญชีผู้ใช้</label>
                                                    <input type="text" i name="username" class="form-control" placeholder="บัญชีผู้ใช้">
                                                    <div id='createFormUserMessage'></div>
                                                </div>
                                                <div class="form-group">
                                                    <label>ประเภทบัญชี</label>
                                                    <select name="userType">
                                                        <option value="1">Dealer</option>
                                                        <option value="0">Admin</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>ชื่อ</label>
                                                    <input type="text" class="form-control" name="firstname" maxlength="20" value="" >
                                                </div>
                                                <div class="form-group">
                                                    <label>นามสกุล</label>
                                                    <input type="text" class="form-control" name="surname" maxlength="50"  value="">
                                                </div>
                                                <div class="form-group">
                                                    <label>E-Mail</label>
                                                    <input type="email" class="form-control" name="email" maxlength="50" value="" >
                                                    <div id="emailMessage"></div>
                                                </div>
                                                <div class="form-group">
                                                    <label>เบอร์โทรศัพท์ติดต่อ</label>
                                                    <input type="tel" class="form-control" name="phone" maxlength="10" value="" >
                                                </div>
                                                <div class="form-group">
                                                    <label>กรอกรหัสผ่าน</label>
                                                    <input type="password" name="password" class="form-control" placeholder="รหัสผ่าน">
                                                </div>
                                                <div class="form-group">
                                                    <label>ยืนยันรหัสผ่าน</label>
                                                    <input type="password" name="passwordRetry" class="form-control" placeholder="กรอกรหัสผ่านอีกครั้ง">
                                                    <div id='createFormPasswordMessage'></div>
                                                    <div id='createFormPasswordMessageLength'></div>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            let usernameCreateLength = false;
                                            let passwordCreateMatch = false;
                                            let passwordCreateLength = false;
                                            let emailValidateCreate = false;

                                            $("#createAccountForm input[name=username]").on('keyup', function () {
                                                if ($(this).val().length < 8) {//check length atlest 8 chatacter
                                                    $('#createFormUserMessage').html('Username ต้องจำนวนมากกว่า 8 ตัวอักษร').css('color', 'red').show();
                                                    usernameCreateLength = false;
                                                } else {
                                                    if (!usernameCreateLength)
                                                        $('#createFormUserMessage').html('Username ต้องจำนวนมากกว่า 8 ตัวอักษร').css('color', 'green').show().fadeOut(1000);
                                                    usernameCreateLength = true;
                                                }
                                                checkCreateRequired();
                                            });

                                            $("#createAccountForm input[name=username]").keypress(function (event) {
                                                var ew = event.which;
                                                if (48 <= ew && ew <= 57)
                                                    return true;
                                                if (65 <= ew && ew <= 90)
                                                    return true;
                                                if (97 <= ew && ew <= 122)
                                                    return true;
                                                return false;
                                            }); //accept only english and number                                            

                                            $('#createAccountForm input[name=password], #createAccountForm input[name=passwordRetry]').on('keyup', function () {
                                                if ($('#createAccountForm input[name=password]').val() === $('#createAccountForm input[name=passwordRetry]').val()) {
                                                    $('#createFormPasswordMessage').html('Matching').css('color', 'green').show().fadeOut(1000);
                                                    passwordCreateMatch = true;
                                                } else {
                                                    $('#createFormPasswordMessage').html('Not Matching').css('color', 'red').show();
                                                    passwordCreateMatch = false;
                                                }
                                                //check length atlest 8 chatacter
                                                if ($(this).val().length < 8) {
                                                    $('#createFormPasswordMessageLength').html('รหัสผ่านต้องมากกว่า 8 ตัว').css('color', 'red').show();
                                                    passwordCreateLength = false;
                                                } else {
                                                    if (!passwordCreateLength)
                                                        $('#createFormPasswordMessageLength').html('รหัสผ่านต้องมากกว่า 8 ตัว').css('color', 'green').show().fadeOut(1000);
                                                    passwordCreateLength = true;
                                                }
                                                checkCreateRequired();
                                            });

                                            $("#createAccountForm input[name=email]").on('keyup',function () {
                                                if (isEmail($(this).val())) {
                                                    if (!emailValidateCreate)
                                                        $("#emailMessage").html('Email ที่กรอกไม่ถูกต้อง').css('color', 'green').show().fadeOut(1000);
                                                    emailValidateCreate = true;
                                                } else {
                                                    $("#emailMessage").html('Email ที่กรอกไม่ถูกต้อง').css('color', 'red').show();
                                                    emailValidateCreate = false;
                                                }
                                                checkCreateRequired();
                                            });

                                            function checkCreateRequired() {
                                                if (passwordCreateMatch && passwordCreateLength && usernameCreateLength && emailValidateCreate) {
                                                    if ($("#createAccountForm input[name=username]").val() !== "") {
                                                        $("#createAccountForm input[type=submit]").prop('disabled', false);
                                                        return;
                                                    }
                                                }
                                                $("#createAccountForm input[type=submit]").prop('disabled', true)
                                            }

                                            function isEmail(email) {
                                                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                                return regex.test(email);
                                            }

                                            $("#createAccountForm").submit(function () {
                                                $("#createAccountForm :input").each(function () {
                                                    if ($(this).attr('type') !== "submit") {
                                                        if ($(this).val() === "") {
                                                            $(this).val("-"); // assign - for empty input
                                                        }
                                                    }
                                                });
                                            });
                                        </script>
                                        <center><input type='submit' id='createSubmit'class='btn  btn-fill btn-info' name='confirm' value='ยืนยัน' disabled/></center>
                                    </form>
                                </div>


                                <div class="tab-pane" id="delete">
                                    <form action="Manage_user" method="POST" id='deleteAccountForm'>
                                        <input type="hidden" name='target' value='deleteAccount'>
                                        <div class="row">
                                            <h4 class="info-text"> ลบบัญชีผู้ใช้ </h4>
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <div class="form-group">
                                                    <label>กรอกบัญชีผู้ใช้</label>
                                                    <input type="text" name="username" class="form-control" placeholder="บัญชีผู้ใช้">
                                                </div><div class="form-group">
                                                    <label>ยืนยันรหัสผ่าน</label>
                                                    <input type="password" name="confirmPassword" class="form-control" placeholder="กรุณายืนยันการลบด้วยพาสเวิร์ดของคุณเอง">
                                                </div>
                                                <div>หากทำการลบบัญชี บัญชีจะไม่สามารถเข้าถึงได้อีกครั้ง กรุณาตรวจสอบอย่างละเอียดก่อนทำการลบ</div><br>
                                            </div>
                                        </div>
                                        <script>
                                            $("#deleteAccountForm input[name=username]").on('keyup', function () {
                                                if ($(this).val() !== "") {
                                                    $("#deleteAccountForm input[type=submit]").prop('disabled', false)
                                                } else {
                                                    $("#deleteAccountForm input[type=submit]").prop('disabled', true)
                                                }
                                            })
                                        </script>
                                        <center><input type='submit' id='createSubmit'class='btn  btn-fill btn-info' name='confirm' value='ยืนยัน' disabled/></center>
                                    </form>
                                </div>


                            </div>
                            <div class="wizard-footer">

                                <div class="clearfix"></div>
                            </div>                            
                        </div>
                    </div> <!-- wizard container -->
                </div>
            </div> <!-- row -->
        </div> <!--  big container -->


    </div>

    <jsp:include page="/footer.jsp" />

</body>

<!--   Core JS Files   -->

<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="js/gsdk-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="js/jquery.validate.min.js"></script>



</html>
