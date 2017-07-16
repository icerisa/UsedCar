<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Brand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="apple-touch-icon" sizes="76x76" href="img/appleicon.png">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Bootstrap Core CSS -->
        <title>KKP Used Car - ความสามารถในการผ่อนชำระค่างวดรถยนต์</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business-casual.css">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->        
    </head>

    <body>      
        <jsp:include page="/menu.jsp" />
        <div class="brand">KKP USED Car</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>
        <div class="container">
            <form action="Calculate" method="get">
                <div class="row">
                    <div class="box">
                        <div class="col-lg-12 text-center">
                            <div id="carousel-example-generic" class="carousel slide">
                                <!-- Indicators -->
                                <ol class="carousel-indicators hidden-xs">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img class="img-responsive img-full" src="img/car1.jpg" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive img-full" src="img/car2.jpg" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="img-responsive img-full" src="img/car3.jpeg" alt="">
                                    </div>
                                </div>

                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                    <span class="icon-prev"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                    <span class="icon-next"></span>
                                </a>
                            </div>
                            <br>
                            <h2 class="brand-name">ข้อมูลรถยนต์</h2>
                            <hr class="tagline-divider">
                            <table class="alignP">
                                <td>Grade Tent</td>
                                <td>:</td>
                                <td>
                                    <select id="gradeTent" name="gradeTent">
                                        <% Map<Integer, String> gradeTents = (Map<Integer, String>) request.getAttribute("GradeTents");
                                            for (Map.Entry<Integer, String> gradeTent : gradeTents.entrySet()) {
                                                out.println("<option value='" + gradeTent.getKey() + "'>" + gradeTent.getValue() + "</option>");
                                            }
                                        %>           
                                    </select>
                                </td>
                                </tr>
                                <tr>
                                    <td>Brand</td>
                                    <td>:</td>
                                    <td>
                                        <select id="brand" name="brandId">
                                            <option value="">choose options</option>
                                            <!--                                            <option value="isuzu">Isuzu</option>
                                                                                        <option value="jaguar">Jaguar</option>-->
                                            <% ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("Brands");
                                                for (Brand b : brands) {
                                                    out.println("<option value='" + b.getId() + "'>" + b.getBrandName() + "</option>");
                                                }%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Model</td>
                                    <td>:</td>
                                    <td>
                                        <select id="model" name="model">
                                            <option value="">choose options</option>
                                            <option value="dmax" style="display: none">D-Max</option>
                                            <option value="elf">ELF</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Year</td>
                                    <td>:</td>
                                    <td>
                                        <select id="year" name="year">
                                            <option value="2017">2017</option>
                                            <option value="2016">2016</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Sub Model</td>
                                    <td>:</td>
                                    <td>
                                        <select id="sub_model" name="sub_model">
                                            <option value="wagon_da" >Wagon 4dr 7st Auto 6sp RWD 1.9DCT (DA)</option>
                                            <option value="wagon_dvd">Wagon 4dr 7st Auto 6sp RWD 1.9DCT (DVD)</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>ราคากลาง</td>
                                    <td>:</td>
                                    <td>
                                        <input type="text" value="2323" name="middle_price" id="middle_price" readonly class="kk_mid">
                                    </td>
                                </tr>
                            </table>

                            <h2 class="brand-name">ข้อมูลลูกค้า</h2>
                            <hr class="tagline-divider">
                            <table class="alignP">
                                <tr>
                                    <td>ประวัติการชำระหนี้</td>
                                    <td>:</td>
                                    <td>
                                        <select name="NCB" >
                                            <% Map<Integer, String> NCBs = (Map<Integer, String>) request.getAttribute("NCBs");
                                                for (Map.Entry<Integer, String> ncb : NCBs.entrySet()) {
                                                    out.println("<option value='" + ncb.getKey() + "'>" + ncb.getValue() + "</option>");
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>รายได้ต่อเดือน</td>
                                    <td>:</td>
                                    <td>
                                        <input type="number" name="income">
                                    </td>
                                </tr>

                                <tr>
                                    <td>ภาระหนี้ต่อเดือน</td>
                                    <td>:</td>
                                    <td>
                                        <input type="number" name="debt">
                                    </td>
                                </tr>

                            </table>
                            <br>
                            <input type="submit" class="button_submit" value="ยืนยัน">
                        </div>
                    </div>
            </form>
        </div>


        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Script to Activate the Carousel -->
        <script>
            $('.carousel').carousel({
                interval: 5000 //changes the speed
            })
        </script> 
        <script>
            $(document).ready(function () {
                $('#brand').change(function () {
                    $.ajax({
                        type: 'POST',
                        data: {brandId: $(this).val()},
                        url: 'InputData', // send brandId to get all model from brandId
                        success: function (data) {
                            $('#model').html(data) //receive data to model
                            $('#year').html("");
                            $('#sub_model').html("");
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#model').change(function () {
                    $.ajax({
                        type: 'POST',
                        data: {carModel: $(this).val()},
                        url: 'InputData', // send carModel to get all year from carModel
                        success: function (data) {
                            $('#year').html(data);
                            $('#sub_model').html("");
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#year').change(function () {
                    $.ajax({
                        type: 'POST',
                        data: {year: $(this).val(), carModel: $('#model').val()},
                        url: 'InputData', // send carModel and year to get all sub_models
                        success: function (data) {
                            $('#sub_model').html(data);
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#sub_model').change(function () {
                    $.ajax({
                        type: 'POST',
                        data: {pkOfSubModel: $('#sub_model').val()},
                        url: 'InputData',
                        success: function (data) {
                            $('#middle_price').val(data);
                        }
                    })
                })
            })
        </script>
        <div class="footer">
            <p>Kiatnakin Bank</p>
        </div>
    </body>

</html>