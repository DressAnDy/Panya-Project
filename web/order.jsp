<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="assets\css\main.css">
    <link rel="stylesheet" href="assets\css\variables.css">
    <link rel="stylesheet" href="assets\css\order.css">
    <link rel="icon" href="assets\img\Logo_Primary.png" type="imgae/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div id="wrapper">
        <header class="order-header">
            <nav>
                <div class="menu">
                    <div class="header-logo">
                        <a href="main.jsp"><img src="assets\images\Logo_Basic1.png" alt="logo"></a>
                    </div>

                    <ul>
                        <li><a href="menu.jsp">Menu</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                       
                        
                        <c:if test="${sessionScope.acc == null}">
                           <li><a href="login.jsp" class="header_loginbutton">Login</a></li>    
                        </c:if>
                          
                           <c:if test="${sessionScope.acc != null}">
                               <li><a href="">Hello ${sessionScope.acc.username}</a></li>
                               <li><a href="login?action=logout" class="header_loginbutton">Logout</a></li>   
                           </c:if>
                               
                        <li><a href="order.jsp" class="cart-icon"><i class='bx bxs-cart'></i></a></li>
                    </ul>
                </div>

            </nav>

            <div class="header-text-center">
                <p>Order</p>
            </div>

        </header>



        <main id="main">
            <section class="order-form">
                <h1>Customer Information</h1>
                <div class="form-wrapper">
                    <div class="form-container">
                        <form action="" class="form-info">
                            <label>Last Name:</label>
                            <input type="text" required>

                            <label>First Name:</label>
                            <input type="text" required></br>

                            <label>Phone Number:</label>
                            <input type="tel" required></br>

                            <label>Gmail:</label>
                            <input type="email" required></br>

                            <label>Address:</label>
                            <input type="text" required>

                            <button type="submit" class="submit-button">Verify</button>
                        </form>
                    </div>
                </div>
            </section>

            <section class="cart-table">
                <h1>Order Information</h1>

                <table class="cart-table-info">
                    <thead>
                        <tr class="cart-table-info-header">
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Remove</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr class="cart-table-info-display">
                            <td><img src="assets\product-images\AlmondCake.jpg" alt="img"></td>
                            <td>80.000</td>
                            <td class="product-number">
                                <button class="inline"><i class='bx bx-plus-medical' style='color:#01204e'></i></button>
                                <div class="inline">2</div>
                                <button class="inline"><i class='bx bx-minus' style='color:#01204e'></i></button>
                            </td>
                            <td>
                                <button class="delete-button">Delete</button>
                            </td>
                        </tr>
                        <tr class="cart-table-info-display">
                            <td><img src="assets\product-images\MilkTea.jpg" alt="img"></td>
                            <td>60.000</td>
                            <td class="product-number">
                                <button class="inline"><i class='bx bx-plus-medical' style='color:#01204e'></i></button>
                                <div class="inline">1</div>
                                <button class="inline"><i class='bx bx-minus' style='color:#01204e'></i></button>
                            </td>
                            <td>
                                <button class="delete-button">Delete</button>
                            </td>
                        </tr>
                </table>

                <h3>Total Price: 220.000</h3>
                <button type="submit" class="pay-button">Buy</button>
                </tbody>

            </section>
        </main>

        <footer>
            <div class="footer-container">
                <div class="footer-section logo">
                    <img src="assets\images\Logo_Basic1.png" alt="">
                </div>
                <div class="footer-section links">
                    <h2>Resources</h2>
                    <ul>
                        <li><a href="main.jsp">Home</a></li>
                        <li><a href="about.jsp">About us</a></li>
                        <li><a href="menu.jsp">Menu</a></li>
                        <li><a href="order.jsp">Order</a></li>
                    </ul>
                </div>
                <div class="footer-section contact">
                    <h2>Contact</h2>
                    <ul>
                        <li>Email: panyashop@gmail.com</li>
                        <li>Hot line: 0912345678</li>
                        <li>Adress: 123 steert ABC, District Z, HCM city</li>
                    </ul>
                </div>
                <div class="footer-section social">
                    <h2>Follow Us</h2>
                    <ul>
                        <li><a href="#"><i class='bx bxl-facebook-circle' style='color:#ffffff'></i></a></li>
                        <li><a href="#"><i class='bx bxl-instagram-alt' style='color:#ffffff'></i> </a></li>
                        <li><a href="#"><i class='bx bxl-shopify' style='color:#ffffff'></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2024 Panya | Group 07
            </div>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function(){
                if($(this).scrollTop()){
                    $('nav').addClass('sticky');
                } else{
                    $('nav').removeClass('sticky');
                }
            })
        });
    </script>
</body>

</html>