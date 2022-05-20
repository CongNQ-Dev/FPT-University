<%-- 
    Document   : add
    Created on : Mar 19, 2022, 10:21:47 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Product product = (Product)request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="./components/head.jsp" %>--%>   
        <link rel="shortcut icon" href="./images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Update item</title>
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
            .user-input .input-user select {
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
                        <a style="color: black; text-decoration: none" href="./admin.jsp">Logout</a>    
                    </div>
                </div>
            </header>
            <main>
                <h3 style="display: flex;
                    justify-content: center;
                    font-size: 40px; color:#00C897  ">Update item</h3>
                <div class="container">
                    <form action="item-management?action=edit" method="POST">
                            <div class="user-input">
                                <input type="hidden" name="id" value="<%=product.getId()%>">
                                <div class="input-user">
                                    <span class="details">Name </span>
                                    <input
                                        name="name"
                                        type="text"
                                        required
                                        value="<%=product.getName()%>"
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Brand</span>
<!--                                    <input
                                        name="type"
                                        type="number"
                                        value="<%=product.getcId()%>"
                                        required
                                        />-->
                                     <select name="type">
                                        <option selected="selected" value="<%=product.getcId()%>">
                                         <%= product.getcId() == 1 ? "Nike": "Adidas"%>
                                        </option>
                                        <option value="1" <%=product.getcId() == 1?  "hidden" : ""%>>Nike</option>
                                        <option value="2" <%=product.getcId() == 2?  "hidden" : ""%>>Adidas</option>
                                    </select>
                                </div>
                                <div class="input-user">
                                    <span class="details">Price</span>
                                    <input   
                                        name="price"
                                        type="number"
                                        min="1"
                                        value="<%=product.getPrice()%>"
                                        required
                                        />
                                </div>
                                <div class="input-user">
                                    <span class="details">Image</span>
                                    <input
                                        name="image"
                                        type="text"
                                        value="<%=product.getImage()%>"
                                        required
                                        >
                                </div>
                                <div class="input-user">
                                    <span class="details">Description</span>
                                    <input
                                        name="description"
                                        type="text"
                                        value="<%=product.getDescription()%>"
                                        required
                                        >
                                </div>
                            </div>
                            <div class="buttonAdd"> 
                                <Button type="submit">
                                    Update Item
                                </Button>
                            </div>
                        </form>
                </div>
            </main>
        </div>
    </body>
</html>
