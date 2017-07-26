<%-- 
    Document   : modal
    Created on : Jul 26, 2017, 6:58:08 PM
    Author     : yacth_Mon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!--jQuery--> 
<!--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>       -->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
 <!--BS JavaScript--> 
<script type="text/javascript" src="js/bootstrap.js"></script>
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
        if (showNoti != null && Boolean.parseBoolean(showNoti)) {%>
    showNoti();
    <%}%>
</script>