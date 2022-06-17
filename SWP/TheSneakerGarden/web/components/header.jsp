<!-- Navbar -->

<header class="container">

    <div class="d-flex flex-row-reverse">
        <div class="mr-5 pe-5 pt-3">       
            <%
                if(session.getAttribute("user")==null){
            %>
            <a class="custom-lr" style="display: inline-block; margin-left: 5em;"
               
               type="button" onclick="location.href = './login'">Login &nbsp </a>
            <%
                }else{
            %>
            <a class="custom-lr" style="display: inline-block; margin-left: 5em;"
               
               type="button" onclick="location.href = './login'">Logout &nbsp </a>
            <%
                }
            %>
            |
            <a class="custom-lr" style="display: inline-block; margin-left: .5em;"
               type="button" onclick="location.href = './register'">Register</a>
        </div>
    </div>

    <div class="row">
        <div class="col-3">
            <a class="navbar-brand pb-4" href="./index.jsp">
                <img src="./images/LogoTheSneakerGarden.png" alt=""width="100px" height="150"
                     class="d-inline-block align-text-top">
            </a>
        </div>
        <div class="col-9 my-auto">
            <nav class="navbar navbar-expand-lg navbar-light">

                <div class="container">

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar">
                            <div class="d-block">
                                <div class="d-flex">
                                    <li class="nav-item" >
                                        <a id="homeActive" class="nav-link" aria-current="page" href="./home">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a id="shopActive" class="nav-link" aria-current="page" href="./shop">Shop</a>
                                    </li>
                                    <li class="nav-item">
                                        <a id="nikeActive" class="nav-link" aria-current="page" href="./shop?cId=1">Nike</a>
                                    </li>
                                    <li class="nav-item">
                                        <a id="adidasActive" class="nav-link" aria-current="page" href="./shop?cId=2">Adidas</a>
                                    </li>
                                    <li class="nav-item">
                                        <a id="aboutActive" class="nav-link" aria-current="page" href="./about.jsp">About</a>
                                    </li>
                                </div>
                            </div>

                            <div class="d-block">
                                <div class="d-flex">
                                    <li class="nav-item">
                                        <form class="d-flex justify-content-center">
                                            <input class="form-control" type="search" placeholder="Search" aria-label="Search" 
                                                   style="
                                                   border-top-left-radius: 30px;
                                                   border-bottom-left-radius: 30px;
                                                   border: 1px var(--main-color) solid;
                                                   padding: 5px 5px 5px 25px;
                                                   top: 0;
                                                   left: 0;
                                                   z-index: 5;">
                                            <button type="submit" class="btn"
                                                    style=" border-top-right-radius: 30px;
                                                    border-bottom-right-radius: 30px;"
                                                    ><i class="bi bi-search"></i></button> 
                                        </form>
                                    </li>

                                    <li class="nav-item dropdown" id="dropdown-profile">
                                        <button class="nav-link dropdown-toggle person"
                                                style="display: inline-block; margin-left: .5em;" id="navbarDropdown" role="button"
                                                data-bs-toggle="dropdown" aria-expanded="false"><i
                                                class="bi bi-person-circle"></i></button>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="./profile.jsp">Profile</a></li>
                                            <li><a class="dropdown-item" href="./../TheSneakerGarden/OrderDetailsCustomer">History</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="#">Logout</a></li>
                                        </ul>

                                    </li>
                                    <button class="btn btn-outline-success custom-btn" type="button"
                                            style="display: inline-block; margin-left: .5em;" onclick="location.href = './cart.jsp'"><i
                                            class="bi bi-cart-plus-fill"></i></button>

                                </div>
                            </div>
                        </ul>


                    </div>
                </div>


            </nav>
        </div>
    </div>
</header>