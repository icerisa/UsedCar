<%@page import ="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<header class="mdl-layout__header">
    <!-- Title -->
    <div class="mdl-layout__header-row">
        <a href="Index"><img class="img" src="img/KiBank.png" style="width:120%"></img></a>
        <div class="mdl-layout-spacer"></div>
        <% Account account = (Account)session.getAttribute("Account");%>
        <!--Account Menu-->
        <div id="account" class="">
            <button class="mdl-button mdl-js-button" style="color:white; width:auto; font-size:; display:inline; padding:0%;">
                <span class="material-icons" style="font-size:270%; vertical-align:middle;">account_circle</span>
                <span class="nameaccount"><%= account.getAccountName()%></span>
            </button>
        </div>

        <ul class="mdl-menu mdl-list mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right mdl-shadow-2dp notifications-dropdown" for="account">
            <li class="mdl-list__item" style = "text-align: center">
                <span class="mng"><%=account.isAdmin()? "Admin" : "User"%></span>
            </li>

            <li class="mdl-menu__item mdl-list__item list__item--border-top mgg" >
                <span class="mdl-list__item-primary-content" onclick="location.href = 'Profile';">
                    <span class="mdl-list__item-avatar" style="background-color:#e53935">
                        <i class="material-icons" style = "margin:20%">perm_identity</i>
                    </span>
                    <span class="mng">โปรไฟล์ส่วนตัว</span>
                </span>
                <!-- <span class="mdl-list__item-secondary-content">
                  <span class="label">1 min</span>
                </span> -->
            </li>
            <% if(account.isAdmin()){ %>
            <li class="mdl-menu__item mdl-list__item list__item--border-top mgg" >
                <span class="mdl-list__item-primary-content" onclick="location.href = 'Update';">
                    <span class="mdl-list__item-avatar" style="background-color:#00BCD4">
                        <i class="material-icons" style = "margin:20%">book</i>
                    </span>
                    <span class="mng">จัดการข้อมูล</span>
                </span>
                <!-- <span class="mdl-list__item-secondary-content">
                  <span class="label">2 hours</span>
                </span> -->
            </li>
            <li class="mdl-menu__item mdl-list__item list__item--border-top mgg" >
                <span class="mdl-list__item-primary-content" onclick="location.href = 'Manage_user';">
                    <span class="mdl-list__item-avatar" style="background-color:#FFB300">
                        <i class="material-icons" style = "margin:20%">group_add</i>
                    </span>
                    <span class="mng">จัดการบัญชีผู้ใช้</span>
                </span>
                <!-- <span class="mdl-list__item-secondary-content">
                  <span class="label">5 days</span>
                </span> -->
            </li>
            <%}%>
            <li class="mdl-menu__item mdl-list__item list__item--border-top mgg" style="background-clip:padding-box; border-top:1px solid rgba(207,216,220 ,1);">
                <span class="mdl-list__item-primary-content" onclick="location.href = 'Logout';" >
                    <span class="mdl-list__item-avatar" >
                        <i class="material-icons" style = "margin:20%">exit_to_app</i>
                    </span>
                    <span class="mng">ออกจากระบบ</span>
                </span>
                <!-- <span class="mdl-list__item-secondary-content">
                  <span class="label">5 days</span>
                </span> -->
            </li>
        </ul>
    </div>
</header>