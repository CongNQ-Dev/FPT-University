<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CartItem"%>
<%@page import="dbmanager.ProductManager"%>
<!DOCTYPE html>
<html lang="en">
    <head
        <%@include file="components/head.jsp" %>
        <title>History</title>
        <link rel="stylesheet" href="./css/style.css">
        <link href="./css/history.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="components/header.jsp" %>

        <section class="h-100" style="margin-top: 80px">
            <div class="container h-100 py-5 d-flex justify-content-center align-items-center">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">History</h3>
                        </div>

                        <%
                            if(session.getAttribute("user") != null && ((ArrayList<CartItem>)request.getAttribute("orderHistory")).size() > 0){
                            ProductManager pm = new ProductManager();
                            ArrayList<CartItem> list = (ArrayList<CartItem>)request.getAttribute("orderHistory");
                            for (int i = 0; i < list.size(); i++) {
                             Product product = pm.getProduct(list.get(i).getID());
                                
                        %>
                        <div id="myCart">
                            <div class="card artItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="<%=product.getImage()%>" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2"><%=product.getName()%></p>
                                            <p><span class="text-muted">Size: </span><%=list.get(i).getSize()%>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            x<%=list.get(i).getQuantity()%>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0"><%=product.getPrice()%></h5>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%}
                            }
                            %>
                         <%
                             if(session.getAttribute("user") == null){
                         %>   
                        <div id="emptyCart"
                             class="container d-flex align-items-center justify-content-center border rounded bg-white pt-5 pb-5"
                             style="visibility: visible;">
                            <div class="text-center">
                                <img src=" ./img/empty_cart.png" alt="">
                                <p class="">There are no products in your history.</p>
                                <a href="./shop.jsp">
                                    <button type="button" class="btn btn-lg"
                                            style="background: #ff7c03; color: #fff">Continue
                                        shopping</button>
                                </a>
                            </div>
                        </div>
                        <%
                            }
                         %>   
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footer.jsp" %>
        <!-- MDB -->
        <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>-->
        <script type="text/javascript" src="./js/cart.js"></script>
        <script type="text/javascript" src="./js/main.js"></script>
</html>