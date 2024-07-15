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
        <link rel="stylesheet" href="assets/css/admin.css">
        <link rel="stylesheet" href="assets/css/variables.css">
        <style>
            .hidden {
                display: none;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="sidebar">
                <div class="hello">
                    <div class="welcome">
                        <p>Hello,</p>
                        <h2>
                            <c:if test="${sessionScope.acc != null}">
                                <a href="#">${sessionScope.acc.username}</a>
                            </c:if>
                        </h2>
                    </div>
                    <a href="login?action=logout">
                        <button class="logout">Logout</button>
                    </a>
                </div>
                <button class="sidebar-button" onclick="toggleTable('products')">Edit Cakes</button>
                <button class="sidebar-button" onclick="toggleTable('orders')">Edit Orders</button>
            </div>

            <div class="main">
                <table id="products" class="hidden">
                    <thead>
                        <tr>
                            <td colspan="8">
                                <form action="ProductController" method="POST" class="addProduct">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Create">
                                </form>
                            </td>
                        </tr>

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
                    if(list != null){
                    for (productsDTO p : list) {
                          pageContext.setAttribute("p", p);
                        %>


                        <tr><td>
                                <a href="ProductController?action=list&id=${p.id}">${p.id}</a></td>               
                            <td>${p.name} </td>
                            <td>${p.category_name}</td>
                            <td>${p.description}</td>
                            <td>${p.image}</td>
                            <td>${p.is_in_stock}</td> 
                            <td>${p.price}</td>        
                            <td>
                                <form action="ProductController" method="POST">
                                    <input name="action" value="edit" type="hidden">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${p.id}" type="hidden">
                                    <input type="submit" value="Delete" name="action">
                                    <input type="image" src="assets/img/pen.png" alt="submit">
                                </form>
                            </td>
                        </tr>

                        <%
                                }
                            }   
                        %>
                    </tbody>
                </table>

                <table id="orders" class="hidden">
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
                                </td>
                                <td>
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
    </body>
</html>
