<%-- 
    Document   : result
    Created on : Jul 9, 2017, 7:04:13 PM
    Author     : yacth_Mon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="apple-touch-icon" sizes="76x76" href="img/appleicon.png">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>ความสามารถในการผ่อนชำระค่างวด</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_result.css">
        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/css/business-casual.css" rel="stylesheet">

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material.indigo-pink.min.css">


    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="brand">KKP USED Car</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>


        <div class="container">
            <div class="row">
                <div class="box"><br>
                    <div class="col-lg-12 text-center">

                        <div class="borderContain">
                            <p class="topicStyle">ข้อมูลรถยนต์</p>
                            <table class="showresult">
                                <tr>
                                    <td class="colorTopic">Brand</td>
                                    <td>: Isuzu</td>
                                    <td class="colorTopic">Year</td>
                                    <td>: 2017</td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">Model</td>
                                    <td>: DMAX</td>
                                    <td class="colorTopic">ราคากลาง</td>
                                    <td>: 201,700</td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">SubModel</td>
                                    <td colspan="4">: Wagon 4dr ยาวมากมากมากมาก</td>

                                </tr>
                            </table>
                            <br>
                            <p class="topicStyle">ข้อมูลลูกค้า</p>
                            <table class="showresult">
                                <tr>
                                    <td class="colorTopic">ประวัติการชำระหนี้</td>
                                    <td>: Good Secured</td>
                                    <td class="colorTopic">รายได้ต่อเดือน</td>
                                    <td>: 20,000</td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">ภาระหนี้ต่อเดือน</td>
                                    <td colspan="4">: 10,000</td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">การยกเว้นผู้ค้ำประกัน</td>
                                    <td colspan="4">: ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 20,000 บาท หรือ ปรับ LTV<=80% เทอมไม่เกิน 60</td>
                                </tr>
                            </table>
                        </div>


                        <table class="containerTable">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container3 nope" colspan="3"><h1>ค่างวดต่อเดือน</h1></th>
                                </tr>
                                <tr>
                                    <th class="no"><h1>ยอดที่ต้องการกู้</h1></th>
                                    <th class="container2"><h1>48</h1></th>
                                    <th class="container2"><h1>60</h1></th>
                                    <th class="container2"><h1>72</h1></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>600,000 </td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td>500,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td>400,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>
                                <tr>
                                    <td>600,000 </td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td>500,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td>400,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>
                            </tbody>
                        </table>
                        <hr class="tagline">
                        <table class="containerTable">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container3 nope" colspan="3"><h1>รายได้ขั้นต่ำต่อเดือน</h1></th>
                                </tr>
                                <tr>
                                    <th class="no"><h1>ยอดที่ต้องการกู้</h1></th>
                                    <th class="container2"><h1>48</h1></th>
                                    <th class="container2"><h1>60</h1></th>
                                    <th class="container2"><h1>72</h1></th>
                                </tr>

                            </thead>
                            <tbody>
                                <tr>
                                    <td>600,000 </td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td>500,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td>400,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>
                                <tr>
                                    <td>600,000 </td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td>500,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td>400,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>
                            </tbody>
                        </table>
                        <hr class="tagline">
                        <table class="containerTable">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container3 nope" colspan="3"><h1>ภาระหนี้สูงสุดต่อเดือน</h1></th>
                                </tr>
                                <tr>
                                    <th class="no"><h1>ยอดที่ต้องการกู้</h1></th>
                                    <th class="container2"><h1>48</h1></th>
                                    <th class="container2"><h1>60</h1></th>
                                    <th class="container2"><h1>72</h1></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>600,000 </td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td>500,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td>400,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>
                                <tr>
                                    <td>600,000 </td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td>500,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td>400,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>
                            </tbody>
                        </table>
                        <hr class="tagline">
                        <table class="alignP">
                            <tr>
                                <td>ระบุยอดที่ต้องการกู้</td>
                                <td>:</td>
                                <td>
                                    <input type="number" class="want">
                                </td>
                                <td>
                                    <button class="button_cal">คำนวณ</button>
                                </td>
                            </tr>
                        </table>

                        <table class="containerTable2">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container2"><h1>48</h1></th>
                                    <th class="container2"><h1>60</h1></th>
                                    <th class="container2"><h1>72</h1></th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td class="container3"><span class="sizeme">ค่างวดต่อเดือน </span></td>
                                    <td>15,000 </td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                </tr>
                                <tr>
                                    <td class="container3"><span class="sizeme">รายได้ขั้นต่ำต่อเดือน </span></td>
                                    <td>14,000 </td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                </tr>
                                <tr>
                                    <td class="container3"><span class="sizeme">ภาระหนี้สูงสุดต่อเดือน </span></td>
                                    <td>13,000 </td>
                                    <td>12,000 </td>
                                    <td>11,000 </td>
                                </tr>

                            </tbody>
                        </table>
                        <hr class="dot">

                        <div class="row">
                            <div class="centerPoint">
                                <div class="col-lg-12">
                                    <p>หมายเหตุ</p>
                                    <ol class="hellolist">
                                        <li>ใช้กับรถ Core Brands, Marketable Brands และ Non-Marketable Brands เท่านั้น</li>
                                        <li>ภาระหนี้สูงสุดต้องไม่เกิน 85%</li>
                                        <li>อายุรถ 11 ปีขึ้นไป รับเฉพาะ Toyota, Honda, Isuzu, Mercedes Benz และ BMW เท่านั้น</li>
                                        <li>การคำนวนค่างวดอ้างอิงตารางดอกเบี้ยกลาง</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <a href="index.html"><input type="button" class="button_submit" value="ยืนยัน"></a>
                    </div>

                </div>

            </div>

        </div>

        <div class="footer">
            <p>Kiatnakin Bank</p>

        </div>
    </body>
</html>