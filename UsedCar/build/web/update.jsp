<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="img/appleicon.png">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>จัดการข้อมูล</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_update.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/business-casual.css" >
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material.indigo-pink.min.css">
        <script src="js/jquery.js"></script>
        <script type="text/javascript" src="js/function_update.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="brand">KKP USED Car</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-lg-12 text-center">
                        <h1 class="pdpg">จัดการข้อมูล</h1>

                        <div id='search-box'>

                            <select class="selectionM">
                                <option value="all">All</option>
                                <option value="grade">Grade Tent</option>
                                <option value="ncb_type">NCB Type</option>
                                <option value="ncb_name">NCB Name</option>
                                <option value="occupation">Occupation</option>
                                <option value="age">อายุรถ</option>
                                <option value="max_ltv">LTV สูงสุด</option>
                                <option value="max_term">Term ยาวสุด</option>
                                <option value="condition_ex">ยกเว้นผู้ค้ำรายได้</option>
                                <option value="description_ex">ผู้ค้ำ</option>
                            </select>
                            <input class='search-text' name='q' placeholder='ค้นหา' type='text'/>
                            <button id='search-button' type='submit'><span><i class="fa fa-search" aria-hidden="true"></i></span></button>

                        </div>

                        <div id="vn-click"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <!--<button class="add"><i class="fa fa-plus" aria-hidden="true"></i></button>-->

                        <div id="vn-info">
                            <div class="form_add">
                                <form>
                                    <table class="addData">
                                        <tr>
                                            <td>Grade Tent</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>Preferred</option>
                                                    <option>A</option>
                                                    <option>BCD</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>NCB Type</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>6</option>
                                                    <option>7</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>NCB Name</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>Good Secured</option>
                                                    <option>Good Unsecured</option>
                                                    <option>Not Found</option>
                                                    <option>Concern Unsecured</option>
                                                    <option>Concern Secured</option>
                                                    <option>Bad Unsecured</option>
                                                    <option>Bad Secured</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Occupation</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>Salary</option>
                                                    <option>Non Salary</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>อายุรถ</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>0-7</option>
                                                    <option>8-10</option>
                                                    <option>11+</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>LTV สูงสุด</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0" max="100">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Term ยาวสุด</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>48</option>
                                                    <option>60</option>
                                                    <option>72</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>ผู้ค้ำ</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>ยกเว้นผู้ค้ำประกันได้</option>
                                                    <option>ต้องมีผู้ค้ำประกัน</option>
                                                </select>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td>ยกเว้นผู้ค้ำรายได้</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>รายได้มากกว่า</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>LTV</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0" max="100">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Term</td>
                                            <td>:</td>
                                            <td>
                                                <select>
                                                    <option>48</option>
                                                    <option>60</option>
                                                    <option>72</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    </select>
                                    <button class="addme">เพิ่มข้อมูล</button>
                                </form>
                            </div>
                        </div>


                        <table class="rwd-table">
                            <tbody>
                                <tr>
                                    <th>Grade Tent</th>
                                    <th>NCB TYPE</th>
                                    <th>NCB Name</th>
                                    <th>Occupation</th>
                                    <th>อายุรถ</th>
                                    <th>LTV สูงสุด</th>
                                    <th>Term ยาวสุด</th>
                                    <th>ยกเว้นผู้ค้ำรายได้</th>
                                    <th>ผู้ค้ำ</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td data-th="Grade Tent">
                                        Preferred
                                    </td>
                                    <td data-th="NCB TYPE">
                                        1
                                    </td>
                                    <td data-th="NCB Name">
                                        Good2
                                    </td>
                                    <td data-th="Occupation">
                                        Salary
                                    </td>
                                    <td data-th="อายุรถ">
                                        0-7
                                    </td>
                                    <td data-th="LTV สูงสุด">
                                        100%
                                    </td>
                                    <td data-th="Term ยาวสุด">
                                        72
                                    </td>
                                    <td data-th="ยกเว้นผู้ค้ำรายได้">
                                        20,000
                                    </td>
                                    <td data-th="ผู้ค้ำ">
                                        ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 20,000 บาท หรือ ปรับ LTV<=80% เทอมไม่เกิน 60
                                    </td>
                                    <td>
                                        <div style="text-align:right;" >
                                            <a href="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td data-th="Grade Tent">
                                        Preferred
                                    </td>
                                    <td data-th="NCB TYPE">
                                        1
                                    </td>
                                    <td data-th="NCB Name">
                                        Good2
                                    </td>
                                    <td data-th="Occupation">
                                        Salary
                                    </td>
                                    <td data-th="อายุรถ">
                                        8-10
                                    </td>
                                    <td data-th="LTV สูงสุด">
                                        100%
                                    </td>
                                    <td data-th="Term ยาวสุด">
                                        72
                                    </td>
                                    <td data-th="ยกเว้นผู้ค้ำรายได้">
                                        20,000
                                    </td>
                                    <td data-th="ผู้ค้ำ">
                                        ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 20,000 บาท หรือ ปรับ LTV<=80% เทอมไม่เกิน 60
                                    </td>
                                    <td>
                                        <div style="text-align:right;" >
                                            <a href="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td data-th="Grade Tent">
                                        Preferred
                                    </td>
                                    <td data-th="NCB TYPE">
                                        1
                                    </td>
                                    <td data-th="NCB Name">
                                        Good2
                                    </td>
                                    <td data-th="Occupation">
                                        Salary
                                    </td>
                                    <td data-th="อายุรถ">
                                        8-10
                                    </td>
                                    <td data-th="LTV สูงสุด">
                                        100%
                                    </td>
                                    <td data-th="Term ยาวสุด">
                                        72
                                    </td>
                                    <td data-th="ยกเว้นผู้ค้ำรายได้">
                                        20,000
                                    </td>
                                    <td data-th="ผู้ค้ำ">
                                        ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 20,000 บาท หรือ ปรับ LTV<=80% เทอมไม่เกิน 60
                                    </td>
                                    <td>
                                        <div style="text-align:right;" >
                                            <a href="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td data-th="Grade Tent">
                                        Preferred
                                    </td>
                                    <td data-th="NCB TYPE">
                                        1
                                    </td>
                                    <td data-th="NCB Name">
                                        Good2
                                    </td>
                                    <td data-th="Occupation">
                                        Salary
                                    </td>
                                    <td data-th="อายุรถ">
                                        8-10
                                    </td>
                                    <td data-th="LTV สูงสุด">
                                        100%
                                    </td>
                                    <td data-th="Term ยาวสุด">
                                        72
                                    </td>
                                    <td data-th="ยกเว้นผู้ค้ำรายได้">
                                        20,000
                                    </td>
                                    <td data-th="ผู้ค้ำ">
                                        ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 20,000 บาท หรือ ปรับ LTV<=80% เทอมไม่เกิน 60
                                    </td>
                                    <td>
                                        <div style="text-align:right;" >
                                            <a href="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td data-th="Grade Tent">
                                        Preferred
                                    </td>
                                    <td data-th="NCB TYPE">
                                        1
                                    </td>
                                    <td data-th="NCB Name">
                                        Good2
                                    </td>
                                    <td data-th="Occupation">
                                        Salary
                                    </td>
                                    <td data-th="อายุรถ">
                                        8-10
                                    </td>
                                    <td data-th="LTV สูงสุด">
                                        100%
                                    </td>
                                    <td data-th="Term ยาวสุด">
                                        72
                                    </td>
                                    <td data-th="ยกเว้นผู้ค้ำรายได้">
                                        20,000
                                    </td>
                                    <td data-th="ผู้ค้ำ">
                                        ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 20,000 บาท หรือ ปรับ LTV<=80% เทอมไม่เกิน 60
                                    </td>
                                    <td>
                                        <div style="text-align:right;" >
                                            <a href="#"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>Kiatnakin Bank</p>
        </div>
    </body>
</html>