<%-- 
    Document   : add
    Created on : Mar 19, 2022, 10:21:47 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="./components/head.jsp" %>--%>  
        <link rel="shortcut icon" href="./images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Update user</title>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
                margin: 20px 0 12px 0;
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
            .user-input .input-user textarea {
                height: 80px;
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
        <%@include file="./components/sidebar-dashboard.jsp" %>  
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
                        <img src="./img/shop1.png" width="40px" height="40px"  alt="">
                    </div>
                    <div>
                        <h4>John Doe</h4>   
                        <a style="color: black; text-decoration: none" href="./login.jsp">Logout</a>    
                    </div>
                </div>
            </header>
            <main>
                <h3 style="display: flex;
                    justify-content: center;
                    font-size: 40px; color:#00C897  ">Update user</h3>
                <div class="container">
                    <form action="user-management?action=update" method="POST">
                        <input type="hidden" name="id" value="<%=user.getUserId()%>">
                        <div class="user-input">
                            <div class="input-user">
                                <span class="details">ID </span>
                                <input type="text" name="ida" value="<%=user.getUserId()%>" required disabled="" >
                            </div>
                            <div class="input-user">
                                <span class="details">Name </span>
                                <input
                                    name="name"
                                    value="<%=user.getUserName()%>"
                                    required
                                    />
                            </div>
                            <div class="input-user">
                                <span class="details">Email </span>
                                <input type="email"
                                    name="email"
                                    value="<%=user.getUserEmail()%>"
                                    
                                    required
                                    />
                            </div>
                            <div class="input-user">
                                <span class="details">Phone</span>
                                <input type="text"  
                                    name="phone"
                                    id="phone"
                                    value="<%=user.getUserPhone()%>"                           
                                    required
                                    />
                                <span id="errPhone" style="color: red">Your phone invalid</span>
                            </div>
                            <div class="input-user">
                                <span class="details">Address</span>
                                <input type="text"      
                                    name="address" 
                                    value="<%=user.getUserAddress()%>"
                                    
                                    required
                                    >
                            </div>
                        </div>
                        <div class="buttonAdd">
                            <Button type="submit">
                                Update users
                            </Button>
                        </div>
                    </form>



                </div>
                
            </main>
        </div>
        <script>
            const phone = document.getElementById("phone");
            const errPhone = document.getElementById("errPhone");
            errPhone.style.visibility = "hidden";
            $("#phone").change((e) => {
                const value = e.target.value;
                const isValid = value.match(/^(\+{0,})(\d{0,})([(]{1}\d{1,3}[)]{0,}){0,}(\s?\d+|\+\d{2,3}\s{1}\d+|\d+){1}[\s|-]?\d+([\s|-]?\d+){1,2}(\s){0,}$/gm) ? true: false;
                if(!isValid) {
                    errPhone.style.visibility = "visible"
                } else {
                    errPhone.style.visibility = "hidden"
                }
            });
           
        </script>
    </body>
</html>
