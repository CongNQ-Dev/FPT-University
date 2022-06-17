<%-- 
    Document   : user-management
    Created on : Mar 19, 2022, 6:13:37 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     if(session.getAttribute("user")==null){
        response.sendRedirect("./login");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="./components/head.jsp" %>--%>   
        <link rel="shortcut icon" href="./images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Item management</title>
        <style type="text/css">
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .table-container{
                padding: 0 10%;
                margin: 40px auto 0;
            }
            .heading{
                font-size: 40px;
                text-align: center;
                color: #00C897;
                margin-bottom: 50px;
            }
            .table{
                border-collapse: collapse;
            }
            .table thead{
                background: #00C897;
            }
            .table thead tr th{
                font-size: 14px;
                font-weight: 600;
                letter-spacing: 0.35px;
                color: #fff;
                opacity: 1;
                padding: 12px;
                vertical-align: top;
                text-align: center;
                border: 1px solid #000000;
            }
            .table tbody tr td{
                font-size: 14px;
                font-weight: 600;
                letter-spacing: 0.35px;
                color: #000000;
                opacity: 1;
                padding: 8px;
                text-align: center;
                border: 1px solid #000000;
            }
            .button-add{
                padding-bottom: 20px;
                display: flex;
                justify-content: flex-end;
            }
            .button-add button{
                width: 150px;
                height: 50px;
                font-size: 18px;
                background-color: #00C897;
                color: white;
                font-weight: bold;
                border-radius: 10px;
            }
            @media (max-width: 768px){
                .table thead{
                    display: none;
                }
                .table, .table tbody, .table tr, .table td{
                    display: block;
                    width: 100%;
                }
                .table tr{
                    margin-bottom: 15px;
                }
                .table tbody tr td {
                    text-align: right;
                    padding-left: 50%;
                    position: relative;
                }
                .table td:before{
                    position: absolute;
                    left: 0;
                    width: 50%;
                    padding-left: 15px;
                    font-weight: 600;
                    font-size: 14px;
                    text-align: left;

                }
            }
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="./components/sidebar-dashboard.jsp"%>  
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
                <div class="table-container">
                    <h1 class="heading">Items Management</h1>
                    <div class="button-add">
                        <button type="button" onclick="location.href = './item-management?action=add'" ><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                            </svg>Add items</button>
                    </div>
                    <table class="table" style="width: 100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th> 
                                <th>Name</th>
                                <th>Type</th>
                                <th>Price</th> 
                                <th>Description</th> 
                                <th>Update</th>
                                <th>Delete</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("listProduct");
                                String type = null;
                                for (Product product : list) {
                                if(product.getcId()==1){
                                    type = "Nike";
                                }else{
                                    type = "Adidas";
                                }
                            %>
                            <tr>
                                <td><%=product.getId()%></td>
                                <td><img src="<%=product.getImage()%>" alt="" width="50" height="50"></td>
                                <td><%=product.getName()%></td>
                                <td><%=type%></td>
                                <td><%=product.getPrice()%></td>
                                <td><%=product.getDescription()%></td>
                                <td> <a href="./item-management?action=update&id=<%=product.getId()%>" style="color: green"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
                                        <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
                                        <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
                                        </svg></a></td>
                                <td><a href="./item-management?action=delete&id=<%=product.getId()%>" style="color: red"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg></a></td>
                                <td><a href="./ProductSize?action=view&id=<%=product.getId()%>" style="color: blue">
                                    Details
                                    </a></td>
                            </tr>   
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>

</html>
