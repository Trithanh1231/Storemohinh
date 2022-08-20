<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>AniShop</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../fontawesome-free-5.15.4-web/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.min.js"></script>
<script src="https://code.angularjs.org/1.8.2/angular-route.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
	<style>
        article,
        aside {
            min-height: 550px;
        }

        @import url(//fonts.googleapis.com/css?family=Lato:300:400);



        .header {
            position: relative;
            text-align: center;
            background: linear-gradient(60deg, rgba(84, 58, 183, 1) 0%, rgba(0, 172, 193, 1) 100%);
            color: white;
            width: 100%;

        }

        .logo {
            width: 50px;
            fill: white;
            padding-right: 15px;
            display: inline-block;
            vertical-align: middle;
        }

        .inner-header {
            height: 20vh;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        .flex {
            /*Flexbox for containers*/
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .waves {
            position: relative;
            width: 100%;
            height: 15vh;
            margin-bottom: -7px;
            /*Fix for safari gap*/
            min-height: 100px;
            max-height: 150px;
        }

        .content {
            position: relative;
            height: 20vh;
            text-align: center;
            background-color: white;
        }

        .parallax>use {
            animation: move-forever 25s cubic-bezier(.55, .5, .45, .5) infinite;
        }

        .parallax>use:nth-child(1) {
            animation-delay: -2s;
            animation-duration: 7s;
        }

        .parallax>use:nth-child(2) {
            animation-delay: -3s;
            animation-duration: 10s;
        }

        .parallax>use:nth-child(3) {
            animation-delay: -4s;
            animation-duration: 13s;
        }

        .parallax>use:nth-child(4) {
            animation-delay: -5s;
            animation-duration: 20s;
        }

        @keyframes move-forever {
            0% {
                transform: translate3d(-90px, 0, 0);
            }

            100% {
                transform: translate3d(85px, 0, 0);
            }
        }

        @media (max-width: 768px) {
            .waves {
                height: 40px;
                min-height: 40px;
            }

            .content {
                height: 30vh;
            }
        }

        @keyframes filling {
            from {
                background-position: center 25%;
            }

            to {
                background-position: center 50%;
            }
        }

        .container-text {
            background-image: url("f1.jpg");
            
            -webkit-background-clip: text;
            color: #FFFFFF;
            padding-top: 20px;
            font-size: 170px;
            font-family: 'Bungee', cursive;
            animation: filling 3s ease forwards;
        }

        .new_footer_area {
            background: #fbfbfd;
        }


        .new_footer_top {
            padding: 120px 0px 270px;
            position: relative;
            overflow-x: hidden;
        }

        .new_footer_area .footer_bottom {
            padding-top: 5px;
            padding-bottom: 50px;
        }

        .footer_bottom {
            font-size: 14px;
            font-weight: 300;
            line-height: 20px;
            color: #7f88a6;
            padding: 27px 0px;
        }

        .new_footer_top .company_widget p {
            font-size: 16px;
            font-weight: 300;
            line-height: 28px;
            color: #6a7695;
            margin-bottom: 20px;
        }

        .new_footer_top .company_widget .f_subscribe_two .btn_get {
            border-width: 1px;
            margin-top: 20px;
        }

        .btn_get_two:hover {
            background: transparent;
            color: #5e2ced;
        }

        .btn_get:hover {
            color: #fff;
            background: #6754e2;
            border-color: #6754e2;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        a:hover,
        a:focus,
        .btn:hover,
        .btn:focus,
        button:hover,
        button:focus {
            text-decoration: none;
            outline: none;
        }



        .new_footer_top .f_widget.about-widget .f_list li a:hover {
            color: #5e2ced;
        }

        .new_footer_top .f_widget.about-widget .f_list li {
            margin-bottom: 11px;
        }

        .f_widget.about-widget .f_list li:last-child {
            margin-bottom: 0px;
        }

        .f_widget.about-widget .f_list li {
            margin-bottom: 15px;
        }

        .f_widget.about-widget .f_list {
            margin-bottom: 0px;
        }

        .new_footer_top .f_social_icon a {
            width: 44px;
            height: 44px;
            line-height: 43px;
            background: transparent;
            border: 1px solid #e2e2eb;
            font-size: 24px;
        }

        .f_social_icon a {
            width: 46px;
            height: 46px;
            border-radius: 50%;
            font-size: 14px;
            line-height: 45px;
            color: #858da8;
            display: inline-block;
            background: #ebeef5;
            text-align: center;
            -webkit-transition: all 0.2s linear;
            -o-transition: all 0.2s linear;
            transition: all 0.2s linear;
        }

        .ti-facebook:before {
            content: "\e741";
        }

        .ti-twitter-alt:before {
            content: "\e74b";
        }

        .ti-vimeo-alt:before {
            content: "\e74a";
        }

        .ti-pinterest:before {
            content: "\e731";
        }

        .btn_get_two {
            -webkit-box-shadow: none;
            box-shadow: none;
            background: #5e2ced;
            border-color: #5e2ced;
            color: #fff;
        }

        .btn_get_two:hover {
            background: transparent;
            color: #5e2ced;
        }

        .new_footer_top .f_social_icon a:hover {
            background: #5e2ced;
            border-color: #5e2ced;
            color: white;
        }

        .new_footer_top .f_social_icon a+a {
            margin-left: 4px;
        }

        .new_footer_top .f-title {
            margin-bottom: 30px;
            color: #263b5e;
        }

        .f_600 {
            font-weight: 600;
        }

        .f_size_18 {
            font-size: 18px;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            color: #4b505e;
        }

        .new_footer_top .f_widget.about-widget .f_list li a {
            color: #6a7695;
        }


        .new_footer_top .footer_bg {
            position: absolute;
            bottom: 0;
            background: url("http://droitthemes.com/html/saasland/img/seo/footer_bg.png") no-repeat scroll center 0;
            width: 100%;
            height: 266px;
        }

        .new_footer_top .footer_bg .footer_bg_one {
            background: url("https://1.bp.blogspot.com/-mvKUJFGEc-k/XclCOUSvCnI/AAAAAAAAUAE/jnBSf6Fe5_8tjjlKrunLBXwceSNvPcp3wCLcBGAsYHQ/s1600/volks.gif") no-repeat center center;
            width: 330px;
            height: 105px;
            background-size: 100%;
            position: absolute;
            bottom: 0;
            left: 30%;
            -webkit-animation: myfirst 22s linear infinite;
            animation: myfirst 22s linear infinite;
        }

        .new_footer_top .footer_bg .footer_bg_two {
            background: url("https://1.bp.blogspot.com/-hjgfxUW1o1g/Xck--XOdlxI/AAAAAAAAT_4/JWYFJl83usgRFMvRfoKkSDGd--_Sv04UQCLcBGAsYHQ/s1600/cyclist.gif") no-repeat center center;
            width: 88px;
            height: 100px;
            background-size: 100%;
            bottom: 0;
            left: 38%;
            position: absolute;
            -webkit-animation: myfirst 30s linear infinite;
            animation: myfirst 30s linear infinite;
        }



        @-moz-keyframes myfirst {
            0% {
                left: -25%;
            }

            100% {
                left: 100%;
            }
        }

        @-webkit-keyframes myfirst {
            0% {
                left: -25%;
            }

            100% {
                left: 100%;
            }
        }

        @keyframes myfirst {
            0% {
                left: -25%;
            }

            100% {
                left: 100%;
            }
        }
    </style>
</head>

<body ng-app="lab8" ng-controller="lab8">

    
	<div class="container">
		<header class="row">
			<div class="header">
				<!--Content before waves-->
				<div class="inner-header flex">
					<!--Just the logo.. Don't mind this-->
					<svg version="1.1" class="logo" baseProfile="tiny" id="Layer_1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 500 500" xml:space="preserve">
                            <path fill="#FFFFFF" stroke="#000000"
							stroke-width="10" stroke-miterlimit="10" d="M57,283" />

                        </svg>
					<div class="container-text">
						<h1 style="font-size: 100px;">AniShop</h1>
					</div>

				</div>

				<!--Waves Container-->
				<div>
					<svg class="waves" xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28"
						preserveAspectRatio="none" shape-rendering="auto">
                            <defs>
                                <path id="gentle-wave"
							d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                            </defs>
                            <g class="parallax">
                                <use xlink:href="#gentle-wave" x="48"
							y="0" fill="rgba(255,255,255,0.7" />
                                <use xlink:href="#gentle-wave" x="48"
							y="3" fill="rgba(255,255,255,0.5)" />
                                <use
							xlink:href="#gentle-
                                " x="48"
							y="5" fill="rgba(255,255,255,0.3)" />
                                <use xlink:href="#gentle-wave" x="48"
							y="7" fill="#fff" />
                            </g>
                        </svg>
				</div>
				<!--Waves end-->

			</div>
		</header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Shop</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Hot
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Giới
							thiệu</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-expanded="false">
							Tài Khoản </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Đăng kí</a> <a
								class="dropdown-item" href="#">Đăng nhập</a> <a
								class="dropdown-item" href="#">Đăng xuất</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Quên mật khẩu</a> <a
								class="dropdown-item" href="#">Cập nhật tài khoản</a>

						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">Giỏ hàng</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
		<div class="row">
			<div class="col-6">
				<label class="ml-2 mt-2"
					style="font-size: 22px; text-shadow: 0px 2px rgb(20, 188, 255);">Sản
					Phẩm Phổ Biến</label>
			</div>
			<div class="col-6">
				<label class=" mt-2"
					style="margin-left: 300px; font-size: 22px; text-shadow: 0px 2px rgb(84, 152, 179);">Danh
					Sách Sản Phẩm</label>
			</div>
		</div>
		<section class="row">

			<article class="col-9">
				<div class="row p-2">

					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img src="/images/tan1.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình nhân vật Kamado Tanjirou</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									195.000 ₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
								<img src="/images/ka1.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình nhân vật Kakashi</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">95.000
									₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
								<img src="/images/ka2.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình nhân vật Kakashi chibi</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									169.000 ₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img
								src="https://cf.shopee.vn/file/fb8ed333d873d46cc3790f265e267b24"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình nhân vật kirito</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									<a style="text-decoration-line: line-through; color: black;">400.000đ</a>
									300.000đ
								</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img src="http://i.otakul.com/10873/DSC_3355.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình nhân vật naruto</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									395.000 ₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img src="https://media3.scdn.vn/img3/2019/5_7/51eBwm.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình nhân vật naruto chibi</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									295.000 ₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img
								src="https://cf.shopee.vn/file/d8616f6c3e3d7e7ef80726fc65eef85b_tn"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình Code Geass: Fukkatsu no
									Lelouch</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									4.350.000đ</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img
								src="https://product.hstatic.net/1000160337/product/p_up_parade_the_rising_of_the_shield_hero_season_2_naofumi_iwatani__8__1dbb4122afd44126bc4845b420d35a5c.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình Iwantani Naofumi</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									2,420,000₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img
								src="https://salt.tikicdn.com/cache/400x400/ts/product/66/1c/b8/95056a134a0acc0168295175aa44e10e.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình Luffy gear 4 – one piece</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									<a style="text-decoration-line: line-through; color: black;">800.000đ</a>
									750.000đ
								</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>
					<div class="col-4 mt-2">
						<div class="card" style="width: 15rem;">
							<img
								src="https://product.hstatic.net/1000160337/product/nendoroid_the_rising_of_the_shield_hero_firo_-_filo__2__f9d1eebed31c4a1aa76dfd0cbfc3c47c.jpg"
								class="card-img-top" alt="..." height="250px">
							<div class="card-body">
								<h5 class="card-title">Mô hình NENDOROID THE RISING OF THE
									SHIELD HERO FIRO (FILO)</h5>
								<p class="card-text"
									style="text-align: center; font-size: 20px; color: red;">
									2,580,000₫</p>
								<a href="#" class="btn btn-primary" style="margin-left: 35px;">Đặt
									hàng ngay</a> <a href="#" class="btn btn-primary mt-2"
									style="margin-left: 39px;"> Thêm vào giỏ</a> </a>
							</div>
						</div>

					</div>


				</div>
			</article>

			<aside class="col-3 mt-3">
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">Sản
									phẩm được mua nhiều</button>
							</h2>
						</div>

						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								<ul style="list-style-type: none; text-align: left;">
									<a href="#">Mô hình nhân vật Kamado Tanjirou</a>
									<hr>
									<a href="#">Mô hình nhân vật Kakashi chibi</a>
									<hr>
									<a href="#">Mô hình nhân vật kirito</a>
									<hr>
									<a href="#">Mô hình Code Geass: Fukkatsu no Lelouch</a>
									<hr>
									<a href="#">Mô hình NENDOROID THE RISING OF THE SHIELD HERO
										FIRO (FILO)</a>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left collapsed"
									type="button" data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">Sản
									phẩm giảm giá</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">
								<ul style="list-style-type: none;">
									<a href="#">Mô hình nhân vật kirito</a>
									<hr>
									<a href="#">Mô hình Luffy gear 4 – one piece</a>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</aside>

		</section>


		<footer class="new_footer_area bg_color">
			<div class="new_footer_top">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="f_widget about-widget pl_70 wow fadeInLeft"
								data-wow-delay="0.4s"
								style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInLeft;">
								<h3 class="f-title f_600 t_color f_size_18">FullName:</h3>
								<ul class="list-unstyled f_list">
									<li><a href="#">Dương Hải Đăng</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="f_widget about-widget pl_70 wow fadeInLeft"
								data-wow-delay="0.6s"
								style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInLeft;">
								<h3 class="f-title f_600 t_color f_size_18">Email</h3>
								<ul class="list-unstyled f_list">
									<li><a href="#">dangdhps16394@fpt.edu.vn</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="f_widget social-widget pl_70 wow fadeInLeft"
								data-wow-delay="0.8s"
								style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInLeft;">
								<h3 class="f-title f_600 t_color f_size_18">Team Solutions</h3>
								<div class="f_social_icon">
									<a><i class="bi bi-facebook"></i></a> <a><i
										class="bi bi-twitter"></i></a> <a><i class="bi bi-youtube"></i></a>
									<a><i class="bi bi-twitter"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer_bg">
					<div class="footer_bg_one"></div>
					<div class="footer_bg_two"></div>
				</div>
			</div>
		</footer>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>