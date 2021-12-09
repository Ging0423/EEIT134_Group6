<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後臺管理系統-商家版</title>
    <link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js" integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg==" crossorigin="anonymous"></script></head>
<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="<c:url value='/'/>">
                        <span class="icon"><i class="fas fa-infinity" aria-hidden="true"></i></span>
                        <span class="title"><h2>loop</h2></span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-users-cog" aria-hidden="true"></i></span>
                        <span class="title">管理員專區</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/backend/allitem'/>">
                        <span class="icon"><i class="fas fa-shopping-bag" aria-hidden="true"></i></span>
                        <span class="title">商品管理</span>
                    </a>
                </li>
<!--                 ================== -->
                <li>
                    <a href="<c:url value='/backend/useritem'/>">
                        <span class="icon"><i class="fas fa-shopping-bag" aria-hidden="true"></i></span>
                        <span class="title">會員手作商品管理</span>
                    </a>
                </li>
<!--                 ================== -->
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-cart-arrow-down" aria-hidden="true"></i></span>
                        <span class="title">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-comments" aria-hidden="true"></i></span>
                        <span class="title">訊息管理</span>
                     </a>
                </li>
                <li>
                    <a href="<c:url value='/backend/video'/>">
                        <span class="icon"><i class="far fa-file-video" aria-hidden="true"></i></span>
                        <span class="title">教學影片管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="far fa-newspaper" aria-hidden="true"></i></span>
                        <span class="title">討論區管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/logout'/>">    
                        <span class="icon"><i class="fas fa-sign-out-alt" aria-hidden="true"></i></span>
                        <span class="title">登出</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="main">
            <div class="topbar">
                <div class="toggle" onclick="toggleMenu();"><i class="fas fa-bars"></i></div>
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <i class="fas fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                <div class="user">
                    <img src="image/user.jpg">
                </div>
            </div>

            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">1,042</div>
                        <div class="cardName">訂單總數量</div>
                    </div>
                    <div class="iconBox">
                        <i class="far fa-eye" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">120</div>
                        <div class="cardName">未出貨訂單數量</div>
                    </div>
                    <div class="iconBox">
                        <i class="far fa-comment" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">120</div>
                        <div class="cardName">已出貨訂單數量</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-dollar-sign"aria-hidden="true"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">120</div>
                        <div class="cardName">已完成訂單數量</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-dollar-sign"aria-hidden="true"></i>
                    </div>
                </div>
            </div>

            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>訂單資訊</h2>
                        <a href="#" class="btn">View All</a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>訂單編號</td>
                                <td>價錢</td>
                                <td>客戶名稱</td>
                                <td>訂單狀態</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>A000001</td>
                                <td>NTD 1200</td>
                                <td>åå©</td>
                                <td><span class="status paid">已付款</span></td>
                            </tr>
                            <tr>
                                <td>A000002</td>
                                <td>NTD 3500</td>
                                <td>æ¦®æ©</td>
                                <td><span class="status">已出貨</span></td>
                            </tr>
                            <tr>
                                <td>A000003</td>
                                <td>NTD 3000</td>
                                <td>å¦éº</td>
                                <td><span class="status delivered">已送達</span></td>
                            </tr>
                            <tr>
                                <td>A000004</td>
                                <td>NTD $2300</td>
                                <td>éº¥ææ</td>
                                <td><span class="status unpaid">未付款</span></td>
                            </tr>
                            <tr>
                                <td>A000005</td>
                                <td>$300</td>
                                <td>éå¦®</td>
                                <td><span class="status">未出貨</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>顧客資訊</h2>
                        <a href="#" class="btn">View All</a>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="image/dog.jpg"></div></td>
                                <td><h4>æabc</h4><span>A00001</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload(toggleMenu());

        function toggleMenu(){
            let toggle = document.querySelector('.toggle');
            let navigation = document.querySelector('.navigation');
            let main = document.querySelector('.main');
            toggle.classList.toggle('active');
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
    </script>
</body>
</html>