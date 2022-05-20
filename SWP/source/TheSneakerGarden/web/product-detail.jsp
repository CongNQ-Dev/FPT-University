<%@page import="model.Product"%>
<%
Product product = (Product)request.getAttribute("detail");
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <%@include file="components/head.jsp" %>    

        <title>The Sneaker Garden</title>
        <link rel="stylesheet" href="./css/product-detail.css" />
        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="./css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="./css/slick-theme.css">
        <link rel="stylesheet" href="./css/style.css">

    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Open Content -->
        <section class="bg-light">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-lg-5 mt-5">
                        <div class="card mb-3">
                            <img class="card-img img-fluid" src="./img/<%=product.getImage()%>" alt="Card image cap" id="product-detail">
                        </div>
                    </div>
                    <!-- col end -->
                    <div class="col-lg-7 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="h2">
                                    <%=product.getName()%></h1>
                                <p class="h3 py-2"><%=product.getPrice()%></p>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <%
                                            if(product.getcId()==1){
                                        %>
                                        <h6>Nike</h6>
                                        <%
                                            }else{
                                        %>
                                        <h6>Adidas</h6>
                                        <%
                                            }
                                        %>
                                    </li>
                                </ul>

                                <h6>Description:</h6>
                                <p><%=product.getDescription()%></p>

                                <form action="addToCart">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="id" value="<%=product.getId()%>">
                                    <div class="row">
                                        <div class="col-auto">
                                            <ul class="list-inline pb-3">
                                                <li class="list-inline-item text-right">
                                                    Quantity
                                                    <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                                </li>
                                                <li class="list-inline-item"><span class="btn" id="btn-minus">-</span></li>
                                                <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                                <li class="list-inline-item"><span class="btn" id="btn-plus">+</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row pb-3">
                                        <div class="col d-grid">
                                            <button type="submit" class="btn btn-success btn-lg">
                                                <a>Add to cart</a>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Close Content -->

        <!-- Start Article -->
        <section class="py-5">
            <div class="container">
                <div class="row text-left p-2 pb-3">
                    <h4>Related Products</h4>
                </div>

                <!--Start Carousel Wrapper-->
                <div id="carousel-related-product">
                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_1.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo  White/Orange</h5>
                                </a>
                                <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_2.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo  White/Orange</h5>
                                </a>
                                <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_3.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo White/Orange</h5>
                                </a>
                                  <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_4.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo  White/Orange</h5>
                                </a>
                                  <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_5.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo  White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_6.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo  White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_7.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo  White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_1.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_2.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_3.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>

                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="./img/nike_4.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="far fa-eye"></i></a>
                                        </li>
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail.jsp"><i
                                                    class="bi bi-cart-plus-fill"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
                                    <h5>Nike Blazer Low Jumbo White/Orange</h5>
                                </a>
                                <p class="text-center mb-0" style="color: #ff7c03"><b>$67.95</b></p>
                            </div>
                        </div>
                    </div>


                </div>

        </section>
        <!-- End Article -->

        <%@include file="components/footer.jsp" %>

        <!-- Start Script -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./js/product-detail.js"></script>
        <!-- End Script -->

        <!-- Start Slider Script -->
        <script src="./js/slick.min.js"></script>
        <script>
            $('#carousel-related-product').slick({
                infinite: true,
                arrows: true,
                slidesToShow: 4,
                slidesToScroll: 3,
                dots: true,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    }
                ]
            });
        </script>
        <!-- End Slider Script -->
    </body>

</html>