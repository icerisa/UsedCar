<%@page import="model.SaveInputData"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Brand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Bootstrap Core CSS -->
        <title>T-ratecar - ความสามารถในการผ่อนชำระค่างวดรถยนต์</title>

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
        <%
            SaveInputData save = (SaveInputData) session.getAttribute("SaveInputData");
        %>
        <div class="brand">T-ratecar</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>
        <div class="container">
            <form action="Calculate" method="POST" id="inputData">
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
                                        <% if (save == null) {
                                                Map<Integer, String> gradeTents = (Map<Integer, String>) request.getAttribute("GradeTents");
                                                for (Map.Entry<Integer, String> gradeTent : gradeTents.entrySet()) {
                                                    out.println("<option value='" + gradeTent.getKey() + "'>" + gradeTent.getValue() + "</option>");
                                                }
                                            } else {
                                                out.println(save.getGradeTent());
                                            }
                                        %>           
                                    </select>
                                    <input type="hidden" name="gradeTentRaw">
                                </td>
                                </tr>
                                <tr>
                                    <td>Brand</td>
                                    <td>:</td>
                                    <td>
                                        <select id="brand" name="brandId">                                            
                                            <% if (save == null) {%>
                                            <option value="">choose option</option>
                                            <%
                                                    ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("Brands");
                                                    for (Brand b : brands) {
                                                        out.println("<option value='" + b.getId() + "'>" + b.getBrandName() + "</option>");
                                                    }
                                                } else {
                                                    out.println(save.getBrandId());
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" name="brandIdRaw">
                                    </td>
                                </tr>

                                <tr>
                                    <td>Model</td>
                                    <td>:</td>
                                    <td>
                                        <select id="model" name="model">
                                            <% if (save == null) {%>
                                            <option value="">choose option</option>
                                            <%} else {
                                                    out.println(save.getModel());
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" name="modelRaw">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Year</td>
                                    <td>:</td>
                                    <td>
                                        <select id="year" name="year">
                                            <% if (save == null) {%>
                                            <option value="">choose option</option>
                                            <%} else {
                                                    out.println(save.getYear());
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" name="yearRaw">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Month</td>
                                    <td>:</td>
                                    <td>
                                        <select id="month" name="month">
                                            <% if (save == null) {%>
                                            <option value="">choose option</option>
                                            <%} else {
                                                    out.println(save.getMonth());
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" name="monthRaw">
                                    </td>
                                </tr>

                                <tr>
                                    <td>Sub Model</td>
                                    <td>:</td>
                                    <td>
                                        <select id="sub_model" name="sub_model">
                                            <% if (save == null) {%>
                                            <option value="">choose option</option>
                                            <%} else {
                                                    out.println(save.getSubModel());
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" name="sub_modelRaw">
                                    </td>
                                </tr>

                                <tr>
                                    <td>ราคากลาง</td>
                                    <td>:</td>
                                    <td>
                                        <input type="text" value="<%=save != null ? save.getMiddlePrice() : "-"%>" name="middle_price_to_show" id="middle_price_to_show" readonly class="kk_mid">
                                        <input type="hidden" value="<%=save != null ? save.getMiddlePrice() : "-"%>" name="middle_price" id="middle_price">
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
                                        <select name="NCB" id="NCB">
                                            <% if (save == null) {
                                                    Map<Integer, String> NCBs = (Map<Integer, String>) request.getAttribute("NCBs");
                                                    for (Map.Entry<Integer, String> ncb : NCBs.entrySet()) {
                                                        out.println("<option value='" + ncb.getKey() + "'>" + ncb.getValue() + "</option>");
                                                    }
                                                } else {
                                                    out.println(save.getNCB());
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" name="NCBRaw">
                                    </td>
                                </tr>

                                <tr>
                                    <td>อาชีพ</td>
                                    <td>:</td>
                                    <td>
                                        <select id="occupation" name="occupation">
                                            <option value="Salary" <%=save != null ? save.getOccupation().equals("Salary") ? "selected" : "" : ""%>>Salary</option>
                                            <option value="Non Salary" <%=save != null ? save.getOccupation().equals("Non Salary") ? "selected" : "" : ""%> >Non Salary</option>
                                        </select> <br>                                        
                                    </td>
                                </tr>

                                <tr>
                                    <td>รายได้ต่อเดือน</td>
                                    <td>:</td>
                                    <td>
                                        <input type="number" name="income" min="0" value="<%=save != null ? save.getIncome() : "0"%>">
                                    </td>
                                </tr>

                                <tr>
                                    <td>ภาระหนี้ต่อเดือน</td>
                                    <td>:</td>
                                    <td>
                                        <input type="number" name="debt" min="0" value="<%=save != null ? save.getDept() : "0"%>">
                                    </td>
                                </tr>

                                <tr>
                                    <td>ผู้ค้ำประกัน</td>
                                    <td>:</td>
                                    <td>
                                        <select id="guarantee" name="guarantee">
                                            <option value="0" <%=save!=null? save.getGuarantee()==0? "selected":"":""%>>ไม่มี</option>
                                            <option value="1" <%=save!=null? save.getGuarantee()==1? "selected":"":""%>>มี</option>                                            
                                        </select>  
                                    </td>
                                </tr>

                            </table>

                            <div class="row">
                                <div class="col-lg-12 warning_me">
                                    <h6>หมายเหตุ</h6>
                                    <li>Salary = พนักงานเงินเดือนที่มีเอกสารแสดงรายได้/ข้าราชการ/พนักงานรัฐวิสาหกิจ</li>
                                    <li>Non Salary = พนักงานประจำที่ไม่มีเอกสารแสดงรายได้/เกษตรกร/เจ้าของกิจการ/อาชีพอิสระ/อื่นๆ</li>
                                </div>
                            </div>
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
            //gradeTent brandId model year month sub_model NCB [Raw]
            $("#inputData").submit(function () {
                $('form#inputData :input').each(function () {
                    if (["gradeTent", "brandId", "model", "year", "month", "sub_model", "NCB"].indexOf($(this).attr("name")) > -1) {
                        //if name is in list then
                        //find element from it name + Raw ex year will find yearRaw and put html code in it
                        $('form#inputData input[name="' + $(this).attr("name") + 'Raw"]').val($(this).html());
                    }
                });
            });
            $(document).ready(function () {
                $('#gradeTent').change(function () {
                    let selectedValue = $(this).val();
                    $("select#gradeTent option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);
                    });
                })

                $('#brand').change(function () {
                    let selectedValue = $(this).val();
                    $("select#brand option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);
                    });
                    $.ajax({
                        type: 'POST',
                        data: {target: "getCarModel", brandId: $(this).val()},
                        url: 'InputData', // send brandId to get all model from brandId
                        success: function (data) {
                            $('#model').html(data) //receive data to model
                            $('#year').html("");
                            $('#month').html("");
                            $('#sub_model').html("");
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#model').change(function () {
                    let selectedValue = $(this).val();
                    $("select#model option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);

                    });
                    $.ajax({
                        type: 'POST',
                        data: {target: "getCarYear", carModel: $(this).val()},
                        url: 'InputData', // send carModel to get all year from carModel
                        success: function (data) {
                            $('#year').html(data);
                            $('#month').html("");
                            $('#sub_model').html("");
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#year').change(function () {
                    let selectedValue = $(this).val();
                    $("select#year option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);

                    });
                    $.ajax({
                        type: 'POST',
                        data: {target: "getCarMonth", year: $(this).val(), carModel: $('#model').val(), brandId: $('#brand').val()},
                        url: 'InputData', // send year carModel and brandId to get all months
                        success: function (data) {
                            $('#month').html(data);
                            $('#sub_model').html("");
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#month').change(function () {
                    let selectedValue = $(this).val();
                    $("select#month option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);

                    });
                    $.ajax({
                        type: 'POST',
                        data: {target: "getCarSubModel", year: $("#year").val(), carModel: $('#model').val(), month: $(this).val()},
                        url: 'InputData', // send year carModel and brandId to get all months
                        success: function (data) {
                            $('#sub_model').html(data);
                            $('#middle_price').val(0);
                        }
                    })
                })

                $('#sub_model').change(function () {
                    let selectedValue = $(this).val();
                    $("select#sub_model option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);

                    });
                    $.ajax({
                        type: 'POST',
                        data: {target: "getMiddlePrice", pkOfSubModel: $('#sub_model').val()},
                        url: 'InputData',
                        success: function (data) {
                            $('#middle_price').val(data);
                            $('#middle_price_to_show').val(data.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                        }
                    })
                })

                $("#NCB").change(function () {
                    let selectedValue = $(this).val();
                    $("select#NCB option").each(function () {
                        if ($(this).val() !== selectedValue)
                            $(this).attr("selected", false);
                        else
                            $(this).attr("selected", true);

                    });
                })

                $('#occupation').change(function () {
                    if ($(this).val() === "Salary")
                        $("#description").text("");
                    else if ($(this).val() === "Non Salary")
                        $("#description").text("");
                })
            }
            );



        </script>
        <jsp:include page="/footer.jsp" />
    </body>

</html>