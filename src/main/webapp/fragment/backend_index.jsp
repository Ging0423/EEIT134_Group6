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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js" integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg==" crossorigin="anonymous"></script>
    </head>
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
                        <span class="title">商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-cart-arrow-down" aria-hidden="true"></i></span>
                        <span class="title">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-comments" aria-hidden="true"></i></span>
                        <span class="title">訊息管理</span>
                     </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="far fa-file-video" aria-hidden="true"></i></span>
                        <span class="title">教學影片管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="far fa-newspaper" aria-hidden="true"></i></span>
                        <span class="title">討論區管理</span>
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