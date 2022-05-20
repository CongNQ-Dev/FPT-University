<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="components/head.jsp" %>
        <link rel="stylesheet" href="./css/style.css">
        <title>Profile</title>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Navbar -->
        <section class="mt-5 ">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3 shadow-lg" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; background-color: #ff7c03">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="Avatar"
                                         class="img-fluid my-5" style="width: 80px;" />
                                    <h5>Marie Horwitz</h5>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">ariehorwitz@example.com</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted">123 456 789</p>
                                            </div>
                                        </div>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-12 mb-3">
                                                <h6>Address</h6>
                                                <p class="text-muted">
                                                    No. 99, Jiangwancheng Road,
                                                    Yangpu District,
                                                    Shanghai 200438</p>
                                            </div>

                                        </div>
                                        <div class="d-flex justify-content-start">
                                            <a href="#!"><i class="fab fa-facebook-f fa-lg me-3 text-warning"></i></a>
                                            <a href="#!"><i class="fab fa-twitter fa-lg me-3 text-warning"></i></a>
                                            <a href="#!"><i class="fab fa-instagram fa-lg text-warning"></i></a>
                                        </div>
                                    </div>
                                </div>
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
    </body>

</html>