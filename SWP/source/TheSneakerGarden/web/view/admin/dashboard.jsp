<%-- 
    Document   : dashboard
    Created on : Mar 18, 2022, 11:29:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="./../../components/head.jsp" %>--%>
        <link rel="shortcut icon" href="./../../images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Admin</title>
        <link rel="stylesheet" href="./../.././css/dashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="./../../components/sidebar-dashboard.jsp" %>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label> 
                    Dashboard
                </h2>
                <div class="search-wrapper"><span class="las la-search"></span>
                    <input type="search" placeholder="Search..."/>
                </div> 
                <div class="user-wrapper">
                    <div class="profile-avatar">
                        <img src="./../../img/shop1.png" width="40px" height="40px"  alt="">
                    </div>
                    <div>
                        <h4>John Doe</h4>   
                        <a  style="color: black; text-decoration: none" href="./admin.jsp">Logout</a>    
                    </div>
                </div>
            </header>
            <main>
                <div class="cards">
                    <div class="card-sigle">
                        <div>   <h1>100</h1><span>Users</span></div>
                        <div> <span class="las la-users"></span> </div>
                    </div>
                    <div class="card-sigle">
                        <div>   <h1>100</h1><span>Items</span></div>
                        <div> <span class="las la-clipboard"></span> </div>
                    </div>
                    <div class="card-sigle">
                        <div>   <h1>100</h1><span>Orders</span></div>
                        <div> <span class="las la-shopping-bag"></span> </div>
                    </div>
                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Recent projects</h3>
                                <button>See all<span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">   
                                    <table style="width: 100%">
                                        <thead>
                                            <tr>
                                                <td>Items name</td>
                                                <td>Department</td>
                                                <td>Status</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Nike</td>
                                                <td>Nike Therma</td>
                                                <td><span class="status purple">review</span></td>
                                            </tr>
                                            <tr>
                                                <td>Nike</td>
                                                <td>Nike Therma</td>
                                                <td><span class="status pink">review</span></td>
                                            </tr>
                                            <tr>
                                                <td>Nike</td>
                                                <td>Nike Therma</td>
                                                <td><span class="status orange">review</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="customers">
                        <div class="card-user"> 
                            <div class="card-header">
                                <h3>Users</h3>
                                <button>See all<span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="card-body">
                                <div class="customer">
                                    <div class="infor">
                                        <img src="./../../img/shop1.png" width="30px" height="30px" alt="">
                                        <div>
                                            <h5>Admin</h5>
                                            <small>Manager</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                                <div class="customer">  
                                    <div class="infor">
                                        <img src="./../../img/shop1.png" width="30px" height="30px" alt="">
                                        <div>
                                            <h5>Admin</h5>
                                            <small>Manager</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                                <div class="customer">  
                                    <div class="infor">
                                        <img src="./../../img/shop1.png" width="30px" height="30px" alt="">
                                        <div>
                                            <h5>Admin</h5>
                                            <small>Manager</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
