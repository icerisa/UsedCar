<%@page import="java.text.DecimalFormat"%>
<%@page import="model.KKBook"%>
<%@page import="model.pdpg_used"%>
<%@page import="model.NCB"%>
<%@page import="model.Brand"%>
<%@page import="model.Calculator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Calculator cal = (Calculator) request.getAttribute("Calculator");
    pdpg_used pdpg = cal.getPdpg_used();
    long middle_price = cal.getMiddle_price();
    boolean inputIncomeAndDept = false;
    DecimalFormat df = new DecimalFormat("##,###,###,###");
    int income = cal.getIncome(), dept = cal.getDept();
    if (income > 0 && dept > 0) {
        inputIncomeAndDept = true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
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
        <jsp:include page="/menu.jsp" />
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
                                    <td>: <%=Brand.getBrandNameFromId(cal.getBrandId())%></td>
                                    <td class="colorTopic">Year</td>
                                    <td>: <%=cal.getYear()%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">Model</td>
                                    <td>: <%=cal.getModel()%></td>
                                    <td class="colorTopic">Month</td>
                                    <td>: <%=cal.getMonth()%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">SubModel</td>
                                    <td colspan="4">: <%=KKBook.getSubModelFromId(cal.getBookId())%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">ราคากลาง</td>
                                    <td colspan="4">: <%=df.format(middle_price)%></td>
                                </tr>
                            </table>
                            <br>
                            <p class="topicStyle">ข้อมูลลูกค้า</p>
                            <table class="showresult">
                                <tr>
                                    <td class="colorTopic">ประวัติการชำระหนี้</td>
                                    <td>: <%=cal.getNcb().getNCB_Name()%></td>
                                    <td class="colorTopic">อาชีพ</td>
                                    <td>: <%=cal.getOccupation()%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">รายได้ต่อเดือน</td>
                                    <td>: <%=df.format(cal.getIncome())%></td>
                                    <td class="colorTopic">ภาระหนี้ต่อเดือน</td>
                                    <td colspan="4">: <%=df.format(cal.getDept())%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">การยกเว้นผู้ค้ำประกัน</td>
                                    <td colspan="4">: <%=pdpg.getDescription()%></td>
                                </tr>
                            </table>
                        </div>
                        <% //Calculator
                            int maxTerm = pdpg.getMaxTerm();
                            int rowToShow = cal.getRowToShow();
                        %>

                        <table class="containerTable">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container3 nope" colspan="3"><h1>ค่างวดต่อเดือน</h1></th>
                                </tr>
                                <tr>
                                    <th class="no"><h1>ยอดที่ต้องการกู้</h1></th>
                                        <%
                                            if (maxTerm >= 48) {
                                                out.println("<th class='container2'><h1>48</h1></th>");
                                            }
                                            if (maxTerm >= 60) {
                                                out.println("<th class='container2'><h1>60</h1></th>");
                                            }
                                            if (maxTerm >= 72) {
                                                out.println("<th class='container2'><h1>72</h1></th>");
                                            }
                                        %>
                                </tr>
                            </thead>                            
                            <tbody>
                                <%  double[][] showDataLoan = new double[rowToShow][3];// [row][column]
                                    for (int i = 0; i < rowToShow; i++) { // คำนวณและแสดงค่าแต่ละ Row                                        
                                        out.println("<tr>");
                                        out.println("<td " + (i == 0 ? "id='maxLoan'" : "") + ">" + df.format(cal.getLoan(i)) + "</td>");
                                        double loan48 = cal.getLoan48(i);//ค่างวดต่อเดือนสำหรับ 48 Term
                                        double loan60 = cal.getLoan60(i);//ค่างวดต่อเดือนสำหรับ 60 Term
                                        double loan72 = cal.getLoan72(i);//ค่างวดต่อเดือนสำหรับ 72 Term
                                        if (maxTerm >= 48) {
                                            if (inputIncomeAndDept) {
                                                //showData = df.format(loan48[i]) : "-";
                                                if (income < cal.getAtleastIncome48(i)) { // ถ้ารายได้ที่ใส่เข้ามาน้อยกว่า รายได้ขั้นต่ำ
                                                    showDataLoan[i][0] = 0;
                                                } else if (((loan48 + dept) / (float) income) <= 0.85f) {
                                                    showDataLoan[i][0] = loan48;
                                                } else if (dept <= cal.getHighestDept48(i)) { // คำนวนแล้วมากกว่า 0.85 แต่ยอดน้อยกว่าหนี้สูสงุด
                                                    showDataLoan[i][0] = loan48;
                                                } else {
                                                    showDataLoan[i][0] = 0;
                                                }
                                            } else {
                                                showDataLoan[i][0] = loan48;
                                            }
                                            out.println("<td id='loan-48-" + i + "' value='" + loan48 + "'>" + df.format(showDataLoan[i][0]) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            if (inputIncomeAndDept) {
                                                //showData = df.format(loan60[i]) : "-";
                                                if (income < cal.getAtleastIncome60(i)) { // ถ้ารายได้ที่ใส่เข้ามาน้อยกว่า รายได้ขั้นต่ำ
                                                    showDataLoan[i][1] = 0;
                                                } else if (((loan60 + dept) / (float) income) <= 0.85f) {
                                                    showDataLoan[i][1] = loan60;
                                                } else if (dept <= cal.getHighestDept60(i)) { // คำนวนแล้วมากกว่า 0.85 แต่ยอดน้อยกว่าหนี้สูสงุด
                                                    showDataLoan[i][1] = loan60;
                                                } else {
                                                    showDataLoan[i][1] = 0;
                                                }
                                            } else {
                                                showDataLoan[i][1] = loan60;
                                            }
                                            out.println("<td id='loan-60-" + i + "' value='" + loan60 + "'>" + df.format(showDataLoan[i][1]) + "</td>");
                                        }
                                        if (maxTerm >= 72) {
                                            if (inputIncomeAndDept) {
                                                //showData = df.format(loan60[i]) : "-";
                                                if (income < cal.getAtleastIncome72(i)) { // ถ้ารายได้ที่ใส่เข้ามาน้อยกว่า รายได้ขั้นต่ำ
                                                    showDataLoan[i][2] = 0;
                                                } else if (((loan72 + dept) / (float) income) <= 0.85f) {
                                                    showDataLoan[i][2] = loan72;
                                                } else if (dept <= cal.getHighestDept72(i)) { // คำนวนแล้วมากกว่า 0.85 แต่ยอดน้อยกว่าหนี้สูสงุด
                                                    showDataLoan[i][2] = loan72;
                                                } else {
                                                    showDataLoan[i][2] = 0;
                                                }
                                            } else {
                                                showDataLoan[i][2] = loan72;
                                            }
                                            out.println("<td id='loan-72-" + i + "' value='" + loan72 + "'>" + df.format(showDataLoan[i][2]) + "</td>");
                                        }
                                        out.println("</tr>");
                                    }%>
                            </tbody>
                        </table>
                        <hr class="tagline">
                        <%if (cal.getIncome() == 0) {%> 
                        <table class="containerTable">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container3 nope" colspan="3"><h1>รายได้ขั้นต่ำต่อเดือน</h1></th>
                                </tr>
                                <tr>
                                    <th class="no"><h1>ยอดที่ต้องการกู้</h1></th>
                                        <%
                                            if (maxTerm >= 48) {
                                                out.println("<th class='container2'><h1>48</h1></th>");
                                            }
                                            if (maxTerm >= 60) {
                                                out.println("<th class='container2'><h1>60</h1></th>");
                                            }
                                            if (maxTerm >= 72) {
                                                out.println("<th class='container2'><h1>72</h1></th>");
                                            }
                                        %>
                                </tr>

                            </thead>
                            <tbody>
                                <%for (int i = 0; i < rowToShow; i++) { // print 6 row
                                        out.println("<tr>");
                                        out.println("<td " + (i == 0 ? "id='maxLoan-2'" : "") + ">" + df.format(cal.getLoan(i)) + "</td>");
                                        double atleastIncome48 = cal.getAtleastIncome48(i);
                                        double atleastIncome60 = cal.getAtleastIncome60(i);
                                        double atleastIncome72 = cal.getAtleastIncome72(i);
                                        if (maxTerm >= 48) {
                                            out.println("<td id='income-48-" + i + "' value='" + atleastIncome48 + "'>" + df.format(atleastIncome48) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            out.println("<td id='income-60-" + i + "' value='" + atleastIncome60 + "'>" + df.format(atleastIncome60) + "</td>");
                                        }
                                        if (maxTerm >= 72) {
                                            out.println("<td id='income-72 -" + i + "' value='" + atleastIncome72 + "'>" + df.format(atleastIncome72) + "</td>");
                                        }
                                        out.println("</tr>");
                                    }%>
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
                                        <%
                                            if (maxTerm >= 48) {
                                                out.println("<th class='container2'><h1>48</h1></th>");
                                            }
                                            if (maxTerm >= 60) {
                                                out.println("<th class='container2'><h1>60</h1></th>");
                                            }
                                            if (maxTerm >= 72) {
                                                out.println("<th class='container2'><h1>72</h1></th>");
                                            }
                                        %>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; i < rowToShow; i++) { // print 6 row
                                        out.println("<tr>");
                                        out.println("<td " + (i == 0 ? "id='maxLoan-3'" : "") + ">" + df.format(cal.getLoan(i)) + "</td>");
                                        double highestDept48 = cal.getHighestDept48(i);
                                        double highestDept60 = cal.getHighestDept60(i);
                                        double highestDept72 = cal.getHighestDept72(i);
                                        if (maxTerm >= 48) {
                                            out.println("<td id='dept-48-" + i + "' value='" + highestDept48 + "'>" + df.format(highestDept48) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            out.println("<td id='dept-60-" + i + "' value='" + highestDept60 + "'>" + df.format(highestDept60) + "</td>");
                                        }
                                        if (maxTerm >= 72) {

                                            out.println("<td id='dept-72 -" + i + "' value='" + highestDept72 + "'>" + df.format(highestDept72) + "</td>");
                                        }
                                        out.println("</tr>");
                                    }%>
                            </tbody>
                        </table>
                        <hr class="tagline">
                        <%} else { //กรอกรายได้ แต่ไม่กรอกหนี้%>
                        <table class="containerTable">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container3 nope" colspan="3"><h1>ภาระหนี้สูงสุดต่อเดือน</h1></th>
                                </tr>
                                <tr>
                                    <th class="no"><h1>ยอดที่ต้องการกู้</h1></th>
                                        <%
                                            if (maxTerm >= 48) {
                                                out.println("<th class='container2'><h1>48</h1></th>");
                                            }
                                            if (maxTerm >= 60) {
                                                out.println("<th class='container2'><h1>60</h1></th>");
                                            }
                                            if (maxTerm >= 72) {
                                                out.println("<th class='container2'><h1>72</h1></th>");
                                            }
                                        %>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; i < rowToShow; i++) { // print 6 row
                                        out.println("<tr>");
                                        out.println("<td " + (i == 0 ? "id='maxLoan-3'" : "") + ">" + df.format(cal.getLoan(i)) + "</td>");
                                        double highestDept48 = 0;
                                        double highestDept60 = 0;
                                        double highestDept72 = 0;
                                        if (maxTerm >= 48) {
                                            if (showDataLoan[i][0] > 0) {
                                                highestDept48 = income * 0.85f - showDataLoan[i][0];
                                            }
                                            out.println("<td id='dept-48-" + i + "' value='" + highestDept48 + "'>" + df.format(highestDept48) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            if (showDataLoan[i][1] > 0) {
                                                highestDept60 = income * 0.85f - showDataLoan[i][1];
                                            }
                                            out.println("<td id='dept-60-" + i + "' value='" + highestDept60 + "'>" + df.format(highestDept60) + "</td>");
                                        }
                                        if (maxTerm >= 72) {
                                            if (showDataLoan[i][2] > 0) {
                                                highestDept72 = income * 0.85f - showDataLoan[i][2];
                                            }
                                            out.println("<td id='dept-72 -" + i + "' value='" + highestDept72 + "'>" + df.format(highestDept72) + "</td>");
                                        }
                                        out.println("</tr>");
                                    }%>
                            </tbody>
                        </table>
                        <%}%>
                        <table class="alignP">
                            <tr>
                                <td>ระบุยอดที่ต้องการกู้</td>
                                <td>:</td>
                                <td>
                                    <input type="number" class="want" id="want" min="0">                                    
                                </td>
                                <td>
                                    <button class="button_cal" onclick="doCalculate()">คำนวณ</button>
                                </td>
                            </tr>
                        </table>
                        <span id="calMessage"></span>
                        <table class="containerTable2">
                            <thead>
                                <tr>
                                    <th class="nope"></th>
                                    <th class="container2"><h1>48</h1></th>
                                    <th class="container2"><h1>60</h1></th>
                                    <th class="container2"><h1>72</h1></th>
                                </tr>
                            </thead>

                            <tbody id="customLoan">

                            </tbody>
                        </table>
                        <!-- jQuery -->
                        <script src="js/jquery.js"></script>
                        <input type="hidden" id="maxTerm" value="<%=maxTerm%>">
                        <input type="hidden" id="rate48" value="<%=cal.getRate().getRate48()%>">
                        <input type="hidden" id="rate60" value="<%=cal.getRate().getRate60()%>">
                        <input type="hidden" id="rate72" value="<%=cal.getRate().getRate72()%>">
                        <script>
                                        function doCalculate() {
                                            $.ajax({
                                                type: 'POST',
                                                data: {loanTotal: $("#want").val(), maxTerm: $("#maxTerm").val(),
                                                    rate48: $("#rate48").val(), rate60: $("#rate60").val(), rate72: $("#rate72").val(),
                                                    income: <%=income%>, dept: <%=dept%>, maxLoan: <%=cal.getLoan(0)%>},
                                                url: 'CalCustomLoan',
                                                success: function (data) {
                                                    if (data == "Input Error") {
                                                        $("#calMessage").html("ยอดที่ท่านต้องการกู้ไม่เข้าเงื่อนไขของธนาคาร").css('color', 'red');;
                                                        $('#customLoan').html("");
                                                    } else {
                                                        $("#calMessage").html("");
                                                        $('#customLoan').html(data)
                                                    }
                                                }
                                            })
                                        }
                        </script>
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
                        <a href="Index"><input type="button" class="button_submit" value="ยืนยัน"></a>
                    </div>

                </div>

            </div>

        </div>

        <div class="footer">
            <p>Kiatnakin Bank</p>

        </div>
    </body>
</html>