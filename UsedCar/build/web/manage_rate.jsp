<%@page import="model.Rate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="img/appleicon.png">
        <link rel="icon" type="image/png" href="img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>จัดการข้อมูล Rate</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css_update.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">


        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/business-casual.css" >
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material.indigo-pink.min.css">
        <script src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>

        <script type="text/javascript" src="js/function_update.js"></script>        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <jsp:include page="modal.jsp" />
        <!-- Modal Edit -->
        <div class="modal fade" id="editModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="editHead">แก้ไขข้อมูล</h4>
                    </div>
                    <div class="modal-body" id="editBody">
                        <form action="RateControl" method="POST" id="editData"> <!--Method POST without target -->
                            <input type='hidden' name='target' value='edit'>
                            <input type="hidden" name="dataId">
                            <div class="form-group">
                                <table id="editTableData">
                                    <tr>
                                        <td>ผู้ค้ำประกัน</td>
                                        <td>:</td>
                                        <td id='editGuarantee'>
                                            <select name='guarantee' required>
                                                <option value='0'>ไม่มีผู้ค้ำ</option>
                                                <option value='1'>มีผู้ค้ำ</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Brand Type</td>
                                        <td>:</td>
                                        <td id='editBrandType'>
                                            <select name='brandType' required>
                                                <option value='1'>Marketable Brand</option>
                                                <option value='2'>Non Marketable Brand</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Car Year</td>
                                        <td>:</td>
                                        <td id='editCarYear'>
                                            <input type="number" min="0" name='carYear' required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Auto Type</td>
                                        <td>:</td>
                                        <td id='editAutoType'>
                                            <select name='autoType' required>
                                                <option value='100'>Sedan</option>
                                                <option value='101'>Other</option>
                                                <option value='102'>Pick Up</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Term</td>
                                        <td>:</td>
                                        <td id='editTerm'>
                                            <select name='term' required>
                                                <option value='48'>48</option>
                                                <option value='60'>60</option>
                                                <option value='72'>72</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Rate</td>
                                        <td>:</td>
                                        <td id='editRate'>
                                            <input type="number" min="0" max="100" name='rate' step='0.5'required>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="editCancel">ยกเลิก</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="editConfirm">แก้ไข</button>                        
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showEdit() {
                $("#editModal").modal("toggle");
            }
        </script>
        <% ArrayList<Rate> rates = (ArrayList<Rate>) request.getAttribute("Rates");%>
        <div class="brand">T-ratecar</div>        
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-lg-12 text-center">
                        <h1 class="pdpg">จัดการข้อมูล</h1>

                        <div id='search-box'>
                            <select class="selectionM" id="selectTopic">
                                <option value="All">All</option>
                                <option value="ผู้ค้ำประกัน">ผู้ค้ำประกัน</option>
                                <option value="Brand Type">Brand Type</option>
                                <option value="Car Year">ปีของรถ</option>
                                <option value="Auto Type">Auto Type</option>
                                <option value="Term">Term</option>
                                <option value="Rate (%)">Rate</option>
                            </select>
                            <input class='search-text' id='keyword' name='q' placeholder='ค้นหา' type='text'/>
                            <button id='search-button' type='submit' onclick='btnClickSearch()'><span><i class="fa fa-search" aria-hidden="true"></i></span></button>
                        </div>

                        <div id="vn-click"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <!--<button class="add"><i class="fa fa-plus" aria-hidden="true"></i></button>-->

                        <div id="vn-info">
                            <div class="form_add">
                                <form action="RateControl" method="POST">
                                    <input type='hidden' name='target' value="add">
                                    <table class="addData" id="addData">
                                        <tr>
                                            <td>ผู้ค้ำประกัน</td>
                                            <td>:</td>
                                            <td id='addGuarantee'>
                                                <select name='guarantee' required>
                                                    <option value='0'>ไม่มีผู้ค้ำ</option>
                                                    <option value='1'>มีผู้ค้ำ</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Brand Type</td>
                                            <td>:</td>
                                            <td id='addBrandType'>
                                                <select name='brandType' required>
                                                    <option value='1'>Marketable Brand</option>
                                                    <option value='2'>Non Marketable Brand</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Car Year</td>
                                            <td>:</td>
                                            <td id='addCarYear'>
                                                <input type="number" min="0" name='carYear' value='2000' required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Auto Type</td>
                                            <td>:</td>
                                            <td id='addAutoType'>
                                                <select name='autoType' required>
                                                    <option value='100'>Sedan</option>
                                                    <option value='101'>Other</option>
                                                    <option value='102'>Pick Up</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Term</td>
                                            <td>:</td>
                                            <td id='addTerm'>
                                                <select name='term' required>
                                                    <option value='48'>48</option>
                                                    <option value='60'>60</option>
                                                    <option value='72'>72</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Rate</td>
                                            <td>:</td>
                                            <td id='addRate'>
                                                <input type="number" min="0" max="100" name='rate' step='0.5'required>
                                            </td>
                                        </tr>
                                    </table>                                    
                                    <button class="addme">เพิ่มข้อมูล</button>
                                </form>
                            </div>
                        </div>


                        <table class="rwd-table">
                            <tbody id="data">
                                <tr>
                                    <th>ผู้ค้ำประกัน</th>
                                    <th>Brand Type</th>
                                    <th>Car Year</th>
                                    <th>Auto Type</th>
                                    <th>Term</th>
                                    <th>Rate (%)</th>
                                    <th></th>
                                </tr>
                                <% if (!rates.isEmpty()) {
                                        int count = 0;
                                        for (Rate rate : rates) {
                                            int rateId = rate.getRateId();
                                            out.println("<tr id='row" + ++count + "' data-id='" + rateId + "'>");
                                            out.println("<td data-th='ผู้ค้ำประกัน' data-raw='" + rate.getGuarantee() + "'>" + (rate.getGuarantee() == 0 ? "ไม่มีผู้ค้ำ" : "มีผู้ค้ำ") + "</td>");
                                            out.println("<td data-th='Brand Type' data-raw='" + rate.getBrandTypeId() + "'>"
                                                    + (rate.getBrandTypeId() == 1 ? "Marketable Brand" : "Non Marketable Brand") + "</td>"); // ID
                                            out.println("<td data-th='Car Year'>" + rate.getCarYear() + "</td>");
                                            int autoTypeId = rate.getAutoTypeId();
                                            String autoTypeName = autoTypeId == 100 ? "Sedan" : autoTypeId == 101 ? "Other" : "Pick Up";
                                            out.println("<td data-th='Auto Type' data-raw='" + autoTypeId + "'>" + autoTypeName + "</td>"); // ID
                                            out.println("<td data-th='Term'>" + rate.getTerm() + "</td>");
                                            out.println("<td data-th='Rate (%)'>" + rate.getRateNumber() + "</td>");
                                            out.println("<td data-th='action'>");
                                            out.println("<div style=\"text-align:right;\" >");
                                            out.println("<i style=\"cursor:pointer\" onClick='deleteData($(this).attr(\"data-id\"))' class=\"fa fa-trash\" aria-hidden=\"true\" data-id='" + rateId + "'></i>");
                                            out.println("<i style=\"cursor:pointer\" onClick='editRow($(this).attr(\"data-id\"))' class=\"fa fa-pencil\" aria-hidden=\"true\" data-id='" + rateId + "'></i>");
                                            out.println("</div>");
                                            out.println("</td>");
                                            out.println("</tr>");
                                        }
                                    }%>
                            </tbody>
                        </table>
                        <script>

                            function deleteData(id) {
                                $("#conHead").html("ยืนยันการลบข้อมูล");
                                $("#conMessage").html("คุณต้องการจะลบข้อมูลจริงๆหรือไม่");
                                $("#conConfirm").click(function () {
                                    $.ajax({
                                        type: 'POST', //send POST with target="delete"
                                        data: {target: "delete", dataId: id},
                                        url: 'RateControl',
                                        success: function () {
                                            $("#notiHead").html("Action Result");
                                            $("#notiMessage").html("การลบข้อมูลสำเร็จ");
                                            $("#notiModal").on("hidden.bs.modal", function (e) {
                                                window.location.href = "Manage_Rate";
                                            });
                                            showNoti();
                                        }
                                    });
                                });
                                showCon();
                            }

                            $("#keyword").keyup(function (e) {
                                if (e.keyCode === 13)
                                {
                                    btnClickSearch();
                                }
                            });
                            
                            function btnClickSearch() {
                                let topic = document.getElementById("selectTopic").value;
                                let keyword = document.getElementById("keyword").value;
                                if (topic === "All") {
                                    showAll();
                                } else {
                                    searchBy(topic, keyword);
                                }
                            }

                            function editRow(dataId) {
                                let row = getRowFromId(dataId);
                                if (row) {
                                    let inputs = document.getElementById("editData").elements;
                                    inputs["dataId"].value = dataId;
                                    for (let i = 0, col; col = row.cells[i]; i++) {
                                        let tempData = col.innerHTML;
                                        switch (col.getAttribute("data-th")) {
                                            case "ผู้ค้ำประกัน":
                                                setOption(inputs["guarantee"], tempData);
                                                break;
                                            case "Brand Type":
                                                setOption(inputs["brandType"], tempData);
                                                break;
                                            case "Car Year":
                                                inputs["carYear"].value = tempData;
                                                break;
                                            case "Auto Type":
                                                setOption(inputs["autoType"], tempData);
                                                break;
                                            case "Term":
                                                setOption(inputs["term"], tempData);
                                                break;
                                            case "Rate (%)":
                                                inputs["rate"].value = tempData;
                                                break;
                                        }
                                    }
                                }
                                $("#editConfirm").click(function () {
                                    document.getElementById("editData").submit(); //Method of this form is POST without target
                                });
                                showEdit();
                            }

                            function getRowFromId(id) {
                                let table = document.getElementById("data");
                                // i = 1 for skip thread
                                for (let i = 1, row; row = table.rows[i]; i++) {
                                    if (row.getAttribute("data-id") == id) {
                                        return row;
                                    }
                                }
                            }

                            function showAll() {
                                let table = document.getElementById("data");
                                // i = 1 for skip thread
                                for (let i = 1, row; row = table.rows[i]; i++) {
                                    row.style.display = "table-row";
                                }
                            }

                            function searchBy(thread, keyword) {
                                let table = document.getElementById("data");
                                // i = 1 for skip thread
                                for (let i = 1, row; row = table.rows[i]; i++) {
                                    let shouldShow = false;
                                    for (var j = 0, col; col = row.cells[j]; j++) {
                                        if (col.getAttribute("data-th") === thread) {
//                                            if (col.innerHTML.toLowerCase().indexOf(keyword.toLowerCase()) > -1) {
//                                                shouldShow = true;
//                                            }
//                                            if (thread === "Term" || thread === "Rate" || thread === "Car Year" || thread === "Guarantee" || thread === "IIR")
                                            if (col.innerHTML.toLowerCase() === keyword.toLowerCase()) {
                                                shouldShow = true;
                                            }
                                        }
                                    }
                                    row.style.display = shouldShow ? "table-row" : "none";
                                }
                            }

                            function setOption(selectElement, value) { //select option by value
                                return [...selectElement.options].some((option, index) => {
                                    if (option.innerHTML == value) {
                                        selectElement.selectedIndex = index;
                                        return true;
                                    }
                                });
                            }
//------------------------------ for OLD version -------------------------
//                            function setOption(selectElement, value) {
//                                var options = selectElement.options;
//                                for (var i = 0, optionsLength = options.length; i < optionsLength; i++) {
//                                    if (options[i].value == value) {
//                                        selectElement.selectedIndex = i;
//                                        return true;
//                                    }
//                                }
//                                return false;
//                            }
//------------------------------ for OLD version -------------------------
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/footer.jsp" />
    </body>
</html>