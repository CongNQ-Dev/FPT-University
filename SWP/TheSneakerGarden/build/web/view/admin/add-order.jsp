<%-- 
    Document   : add
    Created on : Mar 19, 2022, 10:21:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="./../../components/head.jsp" %>--%> 
        <link rel="shortcut icon" href="./../../images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Add order</title>
        <style type="text/css">
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .container form .user-input {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin: 20px 60px 12px 60px;
            }
            form .user-input .input-user {
                margin-bottom: 15px;
                width: calc(100% / 2 - 20px);
            }
            .user-input .input-user .details {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
            }
            .user-input .input-user input {
                height: 45px;
                width: 100%;
                outline: none;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding-left: 15px;
                font-size: 16px;
                border-bottom-width: 2px;
                transition: all 0.3s ease;
            }

            .user-input .input-user input:focus,
            .user-input .input-user input:valid {
                border-color: #9b59b6;
            }


            .buttonAdd {
                display: flex;
                justify-content: center;
            }
            .buttonAdd button{
                width: 200px;
                height: 60px;
                color: white;
                background: #00C897;
                border-radius: 10px
            }
            @media (max-width: 584px) {
                .container {
                    max-width: 100%;
                }
                form .user-input .input-user {
                    margin-bottom: 15px;
                    width: 100%;
                }

            }

        </style>
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
                        <a style="color: black; text-decoration: none" href="./admin.jsp">Logout</a>    
                    </div>
                </div>
            </header>

            <main>
                <h3 style="display: flex;
                    justify-content: center;
                    font-size: 40px; color:#00C897  ">Add order</h3>

                <div style="display: flex; justify-content: space-between">
                    <div class="container" >
                        <form action="#">
                            <div class="user-input">
                                <div class="input-user">
                                    <span class="details">ID </span>
                                    <input
                                        placeholder="Enter id"
                                        required
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Date order</span>
                                    <input
                                        placeholder="Enter date order"
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Date ship</span>
                                    <input

                                        placeholder="Enter date ship"
                                        required
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Total price</span>
                                    <input                                   
                                        placeholder="Enter total price"
                                        required
                                        />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="buttonAdd"> 
                    <Button>
                        Add order
                    </Button>
                </div>
            </main>
        </div>
    </body>
</html>
