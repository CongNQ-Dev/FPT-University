<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/head.jsp" %>
        <title>Register</title>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/register.css">
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="h-100" style="margin-top: 130px; margin-bottom: 200px">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-7 col-sm-9">
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
                                <form method="POST" action="./register" class="needs-validation" novalidate="" autocomplete="off">
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="name">UserName</label>
                                        <input id="name" type="text" class="form-control" name="username" value="" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            Name is required
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="name">FullName</label>
                                        <input id="fullname" type="text" class="form-control" name="fullname" value="" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            FullName is required
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                        <input id="email" type="email" class="form-control" name="email" value="" required>
                                        <div class="invalid-feedback">
                                            Email is invalid
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="name">Phone</label>
                                        <input id="name" type="text" class="form-control" name="phone" value="" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            Phone is required
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="name">Address</label>
                                        <input id="name" type="text" class="form-control" name="address" value="" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            Address is required
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="password">Password</label>
                                        <input id="password" type="password" class="form-control" name="password" required>
                                        <div class="invalid-feedback">
                                            Password is required
                                        </div>
                                    </div>

                                    <p class="form-text text-muted mb-3">
                                        By registering you agree with our terms and condition.
                                    </p>

                                    <div class="align-items-center d-flex">
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Register
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer py-3 border-0">
                                <div class="text-center">
                                    Already have an account? <a href="./login.jsp" class="lable-login">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="components/footer.jsp" %>
    </body>

</html>