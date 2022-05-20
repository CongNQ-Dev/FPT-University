<%-- 
    Document   : admin
    Created on : Mar 18, 2022, 10:11:59 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="./../../components/head.jsp" %>
        <link rel="shortcut icon" href="./../../images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Login admin</title>
        <link rel="stylesheet" href="./../../css/style.css">
        <link rel="stylesheet" href="./../../css/login.css">
    </head>
    <body>
        <section class="h-100" style="margin-top: 130px; margin-bottom: 200px">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-7 col-sm-9">
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">Login Admin</h1>
                                <form method="POST" class="needs-validation" novalidate="" autocomplete="off" action="Login"
                                      id="LoginForm">
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                        <input id="email" type="email" class="form-control" name="txtEmail" value=""
                                               required autofocus>
                                        <div class="invalid-feedback">
                                            Email is invalid
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <div class="mb-2 w-100">
                                            <label class="text-muted" for="password">Password</label>
                                            <a href="./forgot.jsp" class="float-end">
                                                Forgot Password?
                                            </a>
                                        </div>
                                        <input id="password" type="password" class="form-control" name="txtPassword"
                                               required>
                                        <div class="invalid-feedback">
                                            Password is required
                                        </div>
                                    </div>

                                    <div class="d-flex align-items-center">
                                        <div class="form-check">
                                            <input type="checkbox" name="remember" id="remember" class="form-check-input">
                                            <label for="remember" class="form-check-label">Remember Me</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Login
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="./../../js/login.js"></script>
    </body>

</html>