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


                        <div id="myCart">
                            <div class="card artItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="./img/nike_1.jpg" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">Nike Blazer Low Jumbo White/Orange</p>
                                            <p><span class="text-muted">Size: </span>39 <span class="text-muted">Color:
                                                </span>Grey</p>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            x1
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">$49.99</h5>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="card cartItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="./img/nike_2.jpg" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">Nike Blazer Low Jumbo White/Orange</p>
                                            <p><span class="text-muted">Size: </span>39 <span class="text-muted">Color:
                                                </span>Grey</p>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            x2
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">$49.99</h5>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="card cartItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="./img/nike_3.jpg" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">Nike Blazer Low Jumbo White/Orange</p>
                                            <p><span class="text-muted">Size: </span>39 <span class="text-muted">Color:
                                                </span>Grey</p>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            x3
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">$49.99</h5>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="card  cartItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="./img/nike_4.jpg" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">Nike Blazer Low Jumbo White/Orange</p>
                                            <p><span class="text-muted">Size: </span>39 <span class="text-muted">Color:
                                                </span>Grey</p>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            x4
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">$49.99</h5>
                                        </div>                
                                    </div>
                                </div>
                            </div>             
                        </div>


                        <div id="emptyCart"
                             class="container d-flex align-items-center justify-content-center border rounded bg-white pt-5 pb-5"
                             style="visibility: hidden;">
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