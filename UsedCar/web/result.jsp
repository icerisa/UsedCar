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
%>
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
                                    <td colspan="4">: <%=KKBook.getSubModelFromId(cal.getSub_modelId())%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">ราคากลาง</td>
                                    <td colspan="4">: <%=middle_price%></td>
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
                                    <td>: <%=cal.getIncome()%></td>
                                    <td class="colorTopic">ภาระหนี้ต่อเดือน</td>
                                    <td colspan="4">: <%=cal.getDept()%></td>
                                </tr>
                                <tr>
                                    <td class="colorTopic">การยกเว้นผู้ค้ำประกัน</td>
                                    <td colspan="4">: <%=pdpg.getDescription()%></td>
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
                                        <%  int maxTerm = pdpg.getMaxTerm();
                                            int rowToShow = 5; // บรรทัดที่จะให้โชว์ค่า Default = 5
                                            float maxLtv = pdpg.getMaxLTV();
                                            DecimalFormat df = new DecimalFormat("##,###,###,###");
                                            float rate48 = cal.getRate().getRate48() / 100f;
                                            float rate60 = cal.getRate().getRate60() / 100f;
                                            float rate72 = cal.getRate().getRate72() / 100f;
                                            double[] loan = new double[rowToShow], loan48 = null, loan60 = null, loan72 = null;// ประกาศค่าใว้รอ
                                            int[] atleastIncome48 = null, atleastIncome60 = null, atleastIncome72 = null;
                                            int[] highestDept48 = null, highestDept60 = null, highestDept72 = null;

                                            if (maxTerm >= 48) {
                                                loan48 = new double[rowToShow];//ถ้า Term มากกว่า 48 ค่อย new double[6] ให้
                                                atleastIncome48 = new int[rowToShow];// ประกาศ Array รายได้ขั้นต่ำ
                                                highestDept48 = new int[rowToShow];// ประกาศ Array ให้ภาระหนี้สูงสุด
                                                out.println("<th class='container2'><h1>48</h1></th>");
                                            }
                                            if (maxTerm >= 60) {
                                                loan60 = new double[rowToShow];//ถ้า Term มากกว่า 60 ค่อย new double[6] ให้
                                                atleastIncome60 = new int[rowToShow];// ประกาศ Array รายได้ขั้นต่ำ
                                                highestDept60 = new int[rowToShow];// ประกาศ Array ให้ภาระหนี้สูงสุด
                                                out.println("<th class='container2'><h1>60</h1></th>");
                                            }
                                            if (maxTerm >= 72) {
                                                loan72 = new double[rowToShow];//ถ้า Term มากกว่า 72 ค่อย new double[6] ให้
                                                atleastIncome72 = new int[rowToShow];// ประกาศ Array รายได้ขั้นต่ำ
                                                highestDept72 = new int[rowToShow];// ประกาศ Array ให้ภาระหนี้สูงสุด
                                                out.println("<th class='container2'><h1>72</h1></th>");
                                            }
                                        %>
                                </tr>
                            </thead>                            
                            <tbody>
                                <%  for (int i = 0; i < rowToShow; i++) { // คำนวณและแสดงค่าแต่ละ Row
                                        float currentLtv = (maxLtv - (5 * i)) / 100f;
                                        loan[i] = currentLtv * middle_price;
                                        out.println("<tr>");
                                        out.println("<td " + (i == 0 ? "id='maxLoan'" : "") + ">" + df.format(loan[i]) + "</td>");
                                        if (maxTerm >= 48) {
                                            if (loan48 != null) {
                                                loan48[i] = (rate48 * loan[i] * (48 / 12) + loan[i]) / 48f;
                                            }
                                            out.println("<td id='loan-48-" + i + "' value='" + loan48[i] + "'>" + df.format(loan48[i]) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            if (loan60 != null) {
                                                loan60[i] = (rate60 * loan[i] * (60 / 12) + loan[i]) / 60f;
                                            }
                                            out.println("<td id='loan-60-" + i + "' value='" + loan60[i] + "'>" + df.format(loan60[i]) + "</td>");
                                        }
                                        if (maxTerm >= 72) {
                                            if (loan72 != null) {
                                                loan72[i] = (rate72 * loan[i] * (72 / 12) + loan[i]) / 72f;
                                            }
                                            out.println("<td id='loan-72 -" + i + "' value='" + loan72[i] + "'>" + df.format(loan72[i]) + "</td>");
                                        }
                                        out.println("</tr>");
                                    }%>
                            </tbody>
                        </table>
                        <hr class="tagline">
                        <%if(cal.getIncome() == 0 || cal.getDept() == 0){%> 
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
                                        out.println("<td " + (i == 0 ? "id='maxLoan-2'" : "") + ">" + df.format(loan[i]) + "</td>");
                                        if (maxTerm >= 48) {
                                            if (atleastIncome48 != null) {
                                                atleastIncome48[i] = ((int) loan48[i]) * 2;
                                            }
                                            out.println("<td id='income-48-" + i + "' value='" + atleastIncome48[i] + "'>" + df.format(atleastIncome48[i]) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            if (atleastIncome60 != null) {
                                                atleastIncome60[i] = ((int) loan60[i]) * 2;
                                            }
                                            out.println("<td id='income-60-" + i + "' value='" + atleastIncome60[i] + "'>" + df.format(atleastIncome60[i]) + "</td>");
                                        }
                                        if (maxTerm >= 72) {
                                            if (atleastIncome72 != null) {
                                                atleastIncome72[i] = ((int) loan72[i]) * 2;
                                            }
                                            out.println("<td id='income-72 -" + i + "' value='" + atleastIncome72[i] + "'>" + df.format(atleastIncome72[i]) + "</td>");
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
                                        out.println("<td " + (i == 0 ? "id='maxLoan-3'" : "") + ">" + df.format(loan[i]) + "</td>");
                                        if (maxTerm >= 48) {
                                            if (highestDept48 != null) {
                                                highestDept48[i] = (int) ((atleastIncome48[i] * 0.85f) - loan48[i]);
                                                highestDept48[i] = (highestDept48[i] * 1000) / 100000 * 100; //ปัดเศษหลักร้อยทิ้ง
                                            }
                                            out.println("<td id='dept-48-" + i + "' value='" + highestDept48[i] + "'>" + df.format(highestDept48[i]) + "</td>");
                                        }
                                        if (maxTerm >= 60) {
                                            if (highestDept60 != null) {
                                                highestDept60[i] = (int) ((atleastIncome60[i] * 0.85f) - loan60[i]);
                                                highestDept60[i] = (highestDept60[i] * 1000) / 100000 * 100; //ปัดเศษหลักร้อยทิ้ง
                                            }
                                            out.println("<td id='dept-60-" + i + "' value='" + highestDept60[i] + "'>" + df.format(highestDept60[i]) + "</td>");
                                        }
                                        if (maxTerm >= 72) {
                                            if (highestDept72 != null) {
                                                highestDept72[i] = (int) ((atleastIncome72[i] * 0.85f) - loan72[i]);
                                                highestDept72[i] = (highestDept72[i] * 1000) / 100000 * 100; //ปัดเศษหลักร้อยทิ้ง
                                            }
                                            out.println("<td id='dept-72 -" + i + "' value='" + highestDept72[i] + "'>" + df.format(highestDept72[i]) + "</td>");
                                        }
                                        out.println("</tr>");
                                    }%>
                            </tbody>
                        </table>                        
                        <hr class="tagline">
                        <%}%>
                        <table class="alignP">
                            <tr>
                                <td>ระบุยอดที่ต้องการกู้</td>
                                <td>:</td>
                                <td>
                                    <input type="number" class="want" id="want">
                                </td>
                                <td>
                                    <button class="button_cal" onclick="doCalculate()">คำนวณ</button>
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

                            <tbody id="customLoan">

                            </tbody>
                        </table>
                        <!-- jQuery -->
                        <script src="js/jquery.js"></script>
                        <input type="hidden" id="maxTerm" value="<%=maxTerm%>">
                        <input type="hidden" id="rate48" value="<%=rate48%>">
                        <input type="hidden" id="rate60" value="<%=rate60%>">
                        <input type="hidden" id="rate72" value="<%=rate72%>">
                        <script>
                                        function doCalculate() {
                                            $.ajax({
                                                type: 'POST',
                                                data: {loanTotal: $("#want").val(), maxTerm: $("#maxTerm").val(), rate48: $("#rate48").val(), rate60: $("#rate60").val(), rate72: $("#rate72").val()},
                                                url: 'CalCustomLoan',
                                                success: function (data) {
                                                    $('#customLoan').html(data)
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