<%@page import="model.NCB"%>
<%@page import="java.util.Map"%>
<%@page import="model.carAge"%>
<%@page import="model.gradeTent"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.pdpg_used"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
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
        <script type="text/javascript" src="js/bootstrap.js"></script>

        <script type="text/javascript" src="js/function_update.js"></script>        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
        <!-- jQuery -->
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>        
        <!-- BS JavaScript -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <%--<jsp:include page="menu.jsp" />--%>
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
        <!-- Modal comfirm -->
        <div class="modal fade" id="conModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="conHead"></h4>
                    </div>
                    <div class="modal-body">
                        <p id="conMessage"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="conCancel">ยกเลิก</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="conConfirm">ยืนยัน</button>                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Edit -->
        <div class="modal fade" id="editModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="editHead">แก้ไขข้อมูล</h4>
                    </div>
                    <div class="modal-body" id="editBody">
                        <form action="KKPUsedControl" method="POST" id="editData"> <!--Method POST without target -->
                            <input type="hidden" name="dataId">
                            <div class="form-group">
                                <table id="editTableData">
                                    <tr>
                                        <td>Grade Tent</td>
                                        <td>:</td>
                                        <td id='editGradeTent'>
                                            <select name='gradeTent' required>
                                                <% Map<Integer, String> gradeTents = (Map<Integer, String>) request.getAttribute("GradeTents");
                                                    for (Map.Entry<Integer, String> gradeTent : gradeTents.entrySet()) {
                                                        out.println("<option value='" + gradeTent.getKey() + "'>" + gradeTent.getValue() + "</option>");
                                                    }
                                                %>   
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>NCB Type</td>
                                        <td>:</td>
                                        <td id='editNCBType'>
                                            <select name='NCBType' required>
                                                <% Map<Integer, String> NCBs = (Map<Integer, String>) request.getAttribute("NCBs");
                                                    for (Map.Entry<Integer, String> ncb : NCBs.entrySet()) {
                                                        out.println("<option value='" + ncb.getKey() + "'>" + ncb.getValue() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Occupation</td>
                                        <td>:</td>
                                        <td id='editOccupation'>
                                            <select name='occupation' required>
                                                <option value="Salary">Salary</option>
                                                <option value="Non Salary">Non Salary</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>อายุรถ</td>
                                        <td>:</td>
                                        <td id='editCarAge'>
                                            <select name='carAge' required>
                                                <% Map<Integer, String> carAges = (Map<Integer, String>) request.getAttribute("CarAges");
                                                    for (Map.Entry<Integer, String> carAge : carAges.entrySet()) {
                                                        out.println("<option value='" + carAge.getKey() + "'>" + carAge.getValue() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>LTV สูงสุด</td>
                                        <td>:</td>
                                        <td id='editMaxLTV'>
                                            <input type="number" min="0" max="100" name='maxLTV' required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Term ยาวสุด</td>
                                        <td>:</td>
                                        <td id='editMaxTerm'>
                                            <select name='maxTerm' required>
                                                <option value='48'>48</option>
                                                <option value='60'>60</option>
                                                <option value='72'>72</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>DBR</td>
                                        <td>:</td>
                                        <td id='editDBR'>
                                            <input type="number" min="0" max="100" name='DBR' required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>IIR</td>
                                        <td>:</td>
                                        <td id='editIIR'>
                                            <input type="number" min="0" max="100" name='IIR' required >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ผู้ค้ำ</td>
                                        <td>:</td>
                                        <td>
                                            <textarea id="editGuarantee" rows="5" name="guarantee" required></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ยกเว้นผู้ค้ำรายได้</td>
                                        <td>:</td>
                                        <td>
                                            <input type="number" min="0" id="editExceptIncome" name="exceptIncome" required>
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
            function showNoti() {
                $("#notiModal").modal("toggle");
            }
            function showCon() {
                $("#conModal").modal("toggle");
            }
            function showEdit() {
                $("#editModal").modal("toggle");
            }
            <%String showNoti = (String) request.getAttribute("showNoti");
                System.out.println("Alert : " + showNoti);
                if (showNoti != null && Boolean.parseBoolean(showNoti)) {%>
            showNoti();
            <%}%>
        </script>
        <% ArrayList<pdpg_used> pdpg_useds = (ArrayList<pdpg_used>) request.getAttribute("pdpg_useds");%>
        <div class="brand">KKP USED Car</div>
        <div class="descript">ความสามารถในการผ่อนชำระค่างวดรถยนต์</div>
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-lg-12 text-center">
                        <h1 class="pdpg">จัดการข้อมูล</h1>

                        <div id='search-box'>
                            <select class="selectionM" id="selectTopic">
                                <option value="All">All</option>
                                <option value="Grade Tent">Grade Tent</option>
                                <option value="NCB Type">NCB Type</option>
                                <option value="NCB Name">NCB Name</option>
                                <option value="Occupation">Occupation</option>
                                <option value="อายุรถ">อายุรถ</option>
                                <option value="LTV สูงสุด">LTV สูงสุด</option>
                                <option value="Term ยาวสุด">Term ยาวสุด</option>
                                <option value="ยกเว้นผู้ค้ำรายได้">ยกเว้นผู้ค้ำรายได้</option>
                                <option value="ผู้ค้ำ">ผู้ค้ำ</option>
                            </select>
                            <input class='search-text' id='keyword' name='q' placeholder='ค้นหา' type='text'/>
                            <button id='search-button' type='submit' onclick='btnClickSearch()'><span><i class="fa fa-search" aria-hidden="true"></i></span></button>
                        </div>

                        <div id="vn-click"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        <!--<button class="add"><i class="fa fa-plus" aria-hidden="true"></i></button>-->

                        <div id="vn-info">
                            <div class="form_add">
                                <form action="KKPUsedControl" method="GET">
                                    <table class="addData" id="addData">
                                        <tr>
                                            <td>Grade Tent</td>
                                            <td>:</td>
                                            <td id='addGradeTent'>
                                                <select name='gradeTent' required>
                                                    <%for (Map.Entry<Integer, String> gradeTent : gradeTents.entrySet()) {
                                                            out.println("<option value='" + gradeTent.getKey() + "'>" + gradeTent.getValue() + "</option>");
                                                        }
                                                    %>   
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>NCB Type</td>
                                            <td>:</td>
                                            <td id='addNCBType'>
                                                <select name='NCBType' required>
                                                    <%for (Map.Entry<Integer, String> ncb : NCBs.entrySet()) {
                                                            out.println("<option value='" + ncb.getKey() + "'>" + ncb.getValue() + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Occupation</td>
                                            <td>:</td>
                                            <td id='addOccupation'>
                                                <select name='occupation' required>
                                                    <option value="Salary">Salary</option>
                                                    <option value="Non Salary">Non Salary</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>อายุรถ</td>
                                            <td>:</td>
                                            <td id='addCarAge'>
                                                <select name='carAge' required>
                                                    <%for (Map.Entry<Integer, String> carAge : carAges.entrySet()) {
                                                            out.println("<option value='" + carAge.getKey() + "'>" + carAge.getValue() + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>LTV สูงสุด</td>
                                            <td>:</td>
                                            <td id='addMaxLTV'>
                                                <input type="number" min="0" max="100" name='maxLTV' required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Term ยาวสุด</td>
                                            <td>:</td>
                                            <td id='addMaxTerm'>
                                                <select name='maxTerm' required>
                                                    <option value='48'>48</option>
                                                    <option value='60'>60</option>
                                                    <option value='72'>72</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>DBR</td>
                                            <td>:</td>
                                            <td id='addDBR'>
                                                <input type="number" min="0" max="100" name='DBR' required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>IIR</td>
                                            <td>:</td>
                                            <td id='addIIR'>
                                                <input type="number" min="0" max="100" name='IIR' required >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>ผู้ค้ำ</td>
                                            <td>:</td>
                                            <td>
                                                <select id="addGuarantee" name="guarantee" required>
                                                    <option value="0">ยกเว้นผู้ค้ำประกันได้</option>
                                                    <option value="1">ต้องมีผู้ค้ำประกัน</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>ยกเว้นผู้ค้ำรายได้</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0" id="addExceptIncome" name="exceptIncome" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>รายได้มากกว่า</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0" id="addAtleastIncome" name="atleastIncome" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>LTV</td>
                                            <td>:</td>
                                            <td>
                                                <input type="number" min="0" max="100" id="addLTVPercent" name="LTVPercent" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Term</td>
                                            <td>:</td>
                                            <td>
                                                <select id="addLongestTerm" name="longestTerm" required>
                                                    <option value="48">48</option>
                                                    <option value="60">60</option>
                                                    <option value="72">72</option>
                                                </select>
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
                                    <th>Grade Tent</th>
                                    <th>NCB TYPE</th>
                                    <th>NCB Name</th>
                                    <th>Occupation</th>
                                    <th>อายุรถ</th>
                                    <th>LTV สูงสุด (%)</th>
                                    <th>Term ยาวสุด</th>
                                    <th>DBR (%)</th>
                                    <th>IIR (%)</th>
                                    <th>ยกเว้นผู้ค้ำรายได้</th>
                                    <th>ผู้ค้ำ</th>
                                    <th></th>
                                </tr>
                                <% if (!pdpg_useds.isEmpty()) {
                                        int count = 0;
                                        for (pdpg_used pdpg : pdpg_useds) {
                                            out.println("<tr id='row" + ++count + "' data-id='" + pdpg.getPdpgId() + "'>");
                                            out.println("<td data-th='Grade Tent'>" + gradeTent.getGradeTentNameFromId(pdpg.getGradeTentId()) + "</td>");
                                            out.println("<td data-th='NCB Type'>" + pdpg.getNCB_Type() + "</td>");
                                            out.println("<td data-th='NCB Name'>" + pdpg.getNCB_Name() + "</td>");
                                            out.println("<td data-th='Occupation'>" + pdpg.getOccupation() + "</td>");
                                            out.println("<td data-th='อายุรถ'>" + carAge.getAgeFromId(pdpg.getCarAgeId()) + "</td>");
                                            out.println("<td data-th='LTV สูงสุด'>" + pdpg.getMaxLTV() + "</td>");
                                            out.println("<td data-th='Term ยาวสุด'>" + pdpg.getMaxTerm() + "</td>");
                                            out.println("<td data-th='DBR'>" + pdpg.getDBR() + "</td>");
                                            out.println("<td data-th='IIR'>" + pdpg.getIIR() + "</td>");
                                            out.println("<td data-th='ยกเว้นผู้ค้ำรายได้'>" + pdpg.getConditionExcept() + "</td>");
                                            out.println("<td data-th='ผู้ค้ำ'>" + pdpg.getDescription() + "</td>");
                                            out.println("<td data-th='action'>");
                                            out.println("<div style=\"text-align:right;\" >");
                                            out.println("<i onClick='deleteData($(this).attr(\"data-id\"))' class=\"fa fa-trash\" aria-hidden=\"true\" data-id='" + pdpg.getPdpgId() + "'></i>");
                                            out.println("<i onClick='editRow($(this).attr(\"data-id\"))' class=\"fa fa-pencil\" aria-hidden=\"true\" data-id='" + pdpg.getPdpgId() + "'></i>");
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
                                        data: {target: "delete", id: id},
                                        url: 'KKPUsedControl',
                                        success: function () {
                                            $("#notiHead").html("Action Result");
                                            $("#notiMessage").html("การลบข้อมูลสำเร็จ");
                                            $("#notiModal").on("hidden.bs.modal", function (e) {
                                                window.location = window.location.pathname;
                                            });
                                            showNoti();
                                        }
                                    });
                                });
                                showCon();
                            }

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
                                            case "Grade Tent":
                                                setOption(inputs["gradeTent"], tempData);
                                                break;
                                            case "NCB Type":
                                                break;
                                            case "NCB Name":
                                                setOption(inputs["NCBType"], tempData);
                                                break;
                                            case "Occupation":
                                                setOption(inputs["occupation"], tempData);
                                                break;
                                            case "อายุรถ":
                                                setOption(inputs["carAge"], tempData);
                                                break;
                                            case "LTV สูงสุด":
                                                inputs["maxLTV"].value = tempData;
                                                break;
                                            case "Term ยาวสุด":
                                                inputs["maxTerm"].value = tempData;
                                                break;
                                            case "DBR":
                                                inputs["DBR"].value = tempData;
                                                break;
                                            case "IIR":
                                                inputs["IIR"].value = tempData;
                                                break;
                                            case "ยกเว้นผู้ค้ำรายได้":
                                                inputs["editExceptIncome"].value = tempData;
                                                break;
                                            case "ผู้ค้ำ":
                                                inputs["guarantee"].innerHTML = tempData;
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
                                            if (col.innerHTML.toLowerCase().indexOf(keyword.toLowerCase()) > -1) {
                                                shouldShow = true;
                                            }
                                            if (thread === "Occupation" || thread === "LTV สูงสุด" || thread === "อายุรถ")
                                                if (col.innerHTML.toLowerCase() === keyword.toLowerCase()) {
                                                    shouldShow = true;
                                                }
                                        }
                                    }
                                    row.style.display = shouldShow ? "table-row" : "none";
                                }
                            }

                            $("#addGuarantee").change(changeGuaranteeAdd);
                            changeGuaranteeAdd();
                            function changeGuaranteeAdd() {
                                // 0 = ไม่ต้องมีผู้ค้ำประกัน , 1 = ต้องมีผู้ค้ำประกัน
                                let shouldShow = $("#addGuarantee").val() == 1 ? true : false;
                                $('#addExceptIncome').prop('disabled', shouldShow);
                                $('#addAtleastIncome').prop('disabled', shouldShow);
                                $('#addLTVPercent').prop('disabled', shouldShow);
                                $('#addLongestTerm').prop('disabled', shouldShow);
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
        <div class="footer">
            <p>Kiatnakin Bank</p>
        </div>
    </body>
</html>