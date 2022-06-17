<%@page import="dbmanager.UserManager"%>
<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page import="java.util.Map"%>
<%@page import="model.CartItem"%>
<%@page import="model.CartItem"%>
<%@page import="dbmanager.ProductManager"%>
<%

UserManager userManager = new UserManager();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/head.jsp" %>
        <title>The Sneaker Garden</title>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="./css/form-validation.css" rel="stylesheet">
        <link href="./css/checkout.css" rel="stylesheet">
        <link href="./css/style.css" rel="stylesheet">
    </head>
    <body class="bg-light" style="margin-bottom: 20%;">
        <%@include file="components/header.jsp" %>

        <div class="container" style="margin-top: 130px; margin-bottom: 200px">
            <main>
                <div class="py-5 text-center">
                    <h2>Checkout</h2>
                </div>

                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary label-title">Your cart</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <%
                                 if(session.getAttribute("cart") != null){
                                 ProductManager pro = new ProductManager();
                                 
                                 double total = 0;
                                 Map<Integer,CartItem> cart = (Map<Integer,CartItem>)session.getAttribute("cart");
                                 for (Map.Entry<Integer,CartItem> en : cart.entrySet()) {
                                         Object key = en.getKey();
                                         CartItem val = en.getValue();
                                         Product product =  pro.getProduct(en.getValue().getID());
                                         total += product.getPrice()*en.getValue().getQuantity();
                                      
                            %>
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0"><%=product.getName()%>x<%=en.getValue().getQuantity()%></h6>
                                    <small class="text-muted"><%=product.getPrice()%></small>
                                </div>
                                <span class="text-muted"><%=product.getPrice()*en.getValue().getQuantity()%></span>
                            </li>
                            <%
                                
                                } 
                            %>
                            <li class="list-group-item d-flex justify-content-between">
                                <span class="my-0">Total</span>
                                <strong><%=total%></strong>
                            </li>
                            <%
                                
                                
                                } 
                            %>
                        </ul>

                        <form class="card p-2">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Promo code">
                                <button type="submit" class="btn btn-secondary">Redeem</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing address</h4>
                        <form class="needs-validation" novalidate action="checkout" method="POST">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">Full name</label>
                                    <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                                    <div class="invalid-feedback">
                                        Valid Full name is required.
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Phone</label>
                                    <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                                    <div class="invalid-feedback">
                                        Valid Phone is required.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                    <input type="email" class="form-control" id="email" value="">
                                    <div class="invalid-feedback">
                                        Please enter a valid email address for shipping updates.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="address" value="" required>
                                    <div class="invalid-feedback">
                                        Please enter your shipping address.
                                    </div>
                                </div>
                            </div>
                            <hr class="my-4">
                            <button class="w-100 btn btn-primary btn-lg" onclick="myFunction()" type="submit">Continue to checkout</button>
                        </form>
                    </div>
                </div>
            </main>
        </div>

        <script>
        function myFunction() {
          alert("Thank you for your order!!!");
        }
        </script>
        <%@include file="components/footer.jsp" %>
        <script src="./js/form-validation.js"></script>
    </body>

</html>