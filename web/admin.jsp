<%@page import="products.productsDTO"%>
<%@page import="orders.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link rel="icon" href="assets\img\Logo_Primary.png" type="image/x-icon">
        <link rel="stylesheet" href="assets/css/admin.css">
        <link rel="stylesheet" href="assets/css/variables.css">
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <style>
            .hidden {
                display: none;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <header class="header">
                <nav class="navbar">
                    <div class="header-logo">
                        <a href="main.jsp"><img src="assets\images\Logo_Basic1.png" alt="logo"></a>
                    </div>
                    <div class="welcome">
                        <div class="hello-text">
                            <p>Hello, 
                                <c:if test="${sessionScope.acc != null}">
                                    <a href="#">${sessionScope.acc.username}</a>
                                </c:if>
                        </div>
                        <a href="login?action=logout"><button class="logout">Logout</button></a>

                    </div>
                    <ul>
                        <div class="search">
                            Search: <input type="text" name="searchValue" value="" placeholder="Enter keyword" />
                            <input type="submit" name="action" value="Go!"/>
                        </div>
                        <button class="header-button" id="show-Create">Add Cake</button>
                        <button class="header-button" onclick="toggleTable('products')">Edit Cakes</button>
                        <button class="header-button" onclick="toggleTable('orders')">Edit Orders</button>
                    </ul>
                </nav>
            </header>

            <div class="main">

                <div class="addProduct">

                    <div class="popup">
                        <div class="close-btn">&times;</div>
                        <div class="form">
                            <h2>Add Product</h2>
                            <div class="form-element">
                                <label for="id">ID</label>
                                <input type="text" id="id" placeholder="Enter ID" />
                            </div>

                            <div class="form-element">
                                <label for="name">Name</label>
                                <input type="text" id="name" placeholder="Enter Name" />
                            </div>

                            <div class="form-element">
                                <label for="category">Category</label>
                                <input type="text" id="email" placeholder="Enter Category" />
                            </div>

                            <div class="form-element">
                                <label for="description">Description</label>
                                <input type="text" id="description" placeholder="Enter Description" />
                            </div>

                            <div class="form-element">
                                <label for="image">Image</label>
                                <input type="text" id="image" placeholder="Enter Image" />
                            </div>

                            <div class="form-element">
                                <label for="price">Price</label>
                                <input type="text" id="price" placeholder="Enter Price" />
                            </div>

                            <div class="form-element">

                                <p3>In Stock</p3>
                                <div>
                                    <input type="radio" id="yes" name="instockYes" value="yes" checked />
                                    <label for="yes">Yes</label>

                                    <input type="radio" id="no" name="instockNo" value="no" />
                                    <label for="no">No</label>
                                </div>
                            </div>

                            <div class="form-buttons">
                                <button>Save</button>
                                <button>Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="products" class="hidden">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                List<productsDTO> list = (List<productsDTO>) request.getAttribute("productlist");
                                if (list != null) {
                                    for (productsDTO p : list) {
                                        pageContext.setAttribute("p", p);
                            %>


                            <tr><td class="tableID">
                                    <a href="ProductController?action=list&id=${p.id}">${p.id}</a></td>               
                                <td>${p.name} </td>
                                <td>${p.category_name}</td>
                                <td>${p.description}</td>
                                <td class="product-img">
                                    <img src="${p.image}">
                                </td>
                                <td>${p.is_in_stock}</td> 
                                <td>${p.price}</td>     
                                <td>
                                    <form class="icon-button" action="ProductController?action=edit" method="POST">
                                        <input name="action" value="edit" type="hidden">
                                        <input name="id" value="${p.id}" type="hidden">
                                        <input type="image" src="assets/images/pen.png" alt="delete">
                                    </form>

                                    <form class="icon-button" action="ProductController?action=delete" method="POST">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${p.id}" type="hidden">
                                        <input type="image" src="assets/images/delete.png" alt="delete">
                                    </form>
                                </td>

                            </tr>

                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div id="orders" class="hidden">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User ID</th>
                                <th>Order Date</th>
                                <th>Order Type</th>
                                <th>Status</th>
                                <th>Total Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderlist}" var="order">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.user_id}</td>
                                    <td>${order.order_date}</td>
                                    <td>${order.order_type}</td>
                                    <td>${order.status}</td>
                                    <td>${order.total_price}</td>
                                    <td>
                                        <form action="OrderController" method="POST" class="order-form">
                                            <input name="action" value="edit" type="hidden">
                                            <input name="id" value="${order.id}" type="hidden">
                                            <input type="image" src="assets/img/pen.png" alt="submit">
                                        </form>

                                        <form action="OrderController" method="POST" class="order-form">
                                            <input name="action" value="delete" type="hidden">
                                            <input name="id" value="${order.id}" type="hidden">
                                            <input type="image" src="assets/img/delete.png" alt="submit">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            function toggleTable(tableId) {
                var table = document.getElementById(tableId);
                if (table.classList.contains('hidden')) {
                    table.classList.remove('hidden');
                } else {
                    table.classList.add('hidden');
                }
            }
        </script>

        <script>
            document.querySelector("#show-Create").addEventListener("click", function () {
                document.querySelector(".popup").classList.add("active");

            });

            document.querySelector(".popup .close-btn").addEventListener("click", function () {
                document.querySelector(".popup").classList.remove("active");

            });
        </script>
    </body>
</html>
