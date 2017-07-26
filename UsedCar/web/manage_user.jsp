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

        <!--        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->

        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" />        
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>

    <body>
        <jsp:include page="menu.jsp" />        
        <jsp:include page="modal.jsp" />
        <!-- Modal notification -->
        <div class="modal fade" id="notiModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="notiHead"><%=request.getAttribute("notiHead")%></h4>
                    </div>
                    <div class="modal-body">
                        <p id="notiMessage"><%=request.getAttribute("notiMessage")%></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="brand">KKP USED Car</div>
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
                                                </div>
                                                <script>
                                                    let resetMatch = false;
                                                    $("#resetPasswordForm input[name=username]").on('keyup', checkResetRequired)
                                                    $('#resetPasswordForm input[name=password],#resetPasswordForm input[name=passwordRetry]').on('keyup', function () {
                                                        if ($('#resetPasswordForm input[name=password]').val() == $('#resetPasswordForm input[name=passwordRetry]').val()) {
                                                            $('#message').html('Matching').css('color', 'green');
                                                            resetMatch = true;
                                                        } else {                                                            
                                                            $('#message').html('Not Matching').css('color', 'red');
                                                            resetMatch = false;
                                                        }
                                                        checkResetRequired();
                                                    });

                                                    function checkResetRequired() {
                                                        if (resetMatch) {                                                            
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
                                                </div>
                                                <div class="form-group">
                                                    <label>กรอกรหัสผ่าน</label>
                                                    <input type="text" name="password" class="form-control" placeholder="รหัสผ่าน">
                                                </div>
                                                <div class="form-group">
                                                    <label>ยืนยันรหัสผ่าน</label>
                                                    <input type="text" name="passwordRetry" class="form-control" placeholder="กรอกรหัสผ่านอีกครั้ง">
                                                    <div id='createFormMessage'></div>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            let createMatch = false;
                                            $("#createAccountForm input[name=username]").on('keyup', checkCreateRequired)
                                            $('#createAccountForm input[name=password], #createAccountForm input[name=passwordRetry]').on('keyup', function () {
                                                if ($('#createAccountForm input[name=password]').val() == $('#createAccountForm input[name=passwordRetry]').val()) {
                                                    $('#createFormMessage').html('Matching').css('color', 'green');
                                                    createMatch = true;
                                                } else {                                                    
                                                    $('#createFormMessage').html('Not Matching').css('color', 'red');
                                                    createMatch = false;
                                                }
                                                checkCreateRequired();
                                            });

                                            function checkCreateRequired() {
                                                if (createMatch) {
                                                    if ($("#createAccountForm input[name=username]").val() != "") {
                                                        $("#createAccountForm input[type=submit]").prop('disabled', false);
                                                        return;
                                                    }
                                                }
                                                $("#createAccountForm input[type=submit]").prop('disabled', true)
                                            }
                                        </script>
                                        <center><input type='submit' id='createSubmit'class='btn  btn-fill btn-info' name='confirm' value='ยืนยัน' disabled/></center>
                                    </form>
                                </div>


                                <div class="tab-pane" id="delete">
                                    <div class="row">
                                        <h4 class="info-text"> ลบบัญชีผู้ใช้ </h4>
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>กรอกบัญชีผู้ใช้</label>
                                                <input type="text" class="form-control" placeholder="บัญชีผู้ใช้">
                                            </div>
                                            <span>หากทำการลบบัญชี บัญชีจะไม่สามารถเข้าถึงได้อีกครั้ง กรุณาตรวจสอบอย่างละเอียดก่อนทำการลบ</span>
                                        </div>
                                    </div>
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

    <div class="footer">
        <p>Kiatnakin Bank</p>

    </div>

</body>

<!--   Core JS Files   -->

<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="js/gsdk-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="js/jquery.validate.min.js"></script>



</html>
