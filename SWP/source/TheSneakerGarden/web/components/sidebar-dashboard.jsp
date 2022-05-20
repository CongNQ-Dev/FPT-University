<%-- 
    Document   : sidebar-dashboard
    Created on : Mar 19, 2022, 6:10:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale-1">

        <title>Admin</title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="././css/dashboard.css">
    </head>
    <body>
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <img  src="././images/LogoTheSneakerGarden.png" style="width: 180px">
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="./homeAdmin" id="dashboard"><span class="las la-igloo"></span>
                            <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="./user-management" id="user-management"><span class="las la-users"></span>
                            <span>User</span></a>
                    </li>
                    <li>
                        <a href="./item-management" id="item-management"><span class="las la-clipboard-list"></span>
                            <span>Item</span></a>
                    </li>
                    <li>
                        <a href="./order-management" id="order-management"><span class="las la-shopping-bag"></span>
                            <span>Order</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <script src="./js/header_dashboard.js"></script>
    </body>
</html>
