<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AniShop</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--Liên kết đến font-awesome-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
	integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<base href="${pageContext.servletContext.contextPath}/" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<!--Liên kết với fontawesome-->
<link rel="stylesheet" href="../fontawesome-free-5.15.4-web/css/all.css">


<!-- đuờng dẫn cơ sở để mọi đường link trong trang wed có thể tham chiếu tới -->
<base href="/Assignment_java5_shop/" />

<link rel="icon" href="images/sha.png" type="image/x-icon">


</head>

<body>
	<c:if test="@{message !=null}">
		<h2>${message}</h2>
	</c:if>
	<form action="/admin/products/home" method="get">
		<div class="form-inline mt-2 ml-3">
			<label for="name" style="margin-right: 4px">Name</label> <input
				type="text" class="form-control" name="name" id="name"
				aria-describedby="helpId" placeholder="Name">
			<button class="btn btn-outline-primary ml-2">Search</button>



		</div>
	</form>
	<form class="d-flex justify-content-around"
		action="admin/products/search1" method="post">


		
		<div class="form-group col-md-4">
			<select id="inputState" name="min" onchange="this.form.submit()" style="width: 200px"
				class="form-control">
				<option value="1">All</option>
			<option value="2">100 - 200k</option>
			<option value="3">200 - 300k</option>
			<option value="4">Trên 500k</option>
			<option value="5">Dưới 100k</option>
			</select>
		</div>
		</li>
	</form>
	<div style="background-color: #ece5da; text-align: center;">
		<h2>Sản Phẩm</h2>
	</div>
	<section class="row">
		<article class="col-9">
			<div class="row p-2">
				<c:forEach var="product" items="${productpage.content}">
					<div class="col-4 mt-2">

						<div class="card" style="width: 15rem;">
							<a href="/admin/products/edit/${product.productid}"
								style="padding: 5px"> <img src="/images/${product.image}"
								class="card-img-top" alt="..." height="250px">
								<div class="card-body">
									<h5 class="card-title" style="text-align: center;">${product.name}</h5>
									<p class="card-text"
										style="text-align: center; font-size: 20px; color: red;">
										${product.unitprice}</p>
									<a href="/admin/products/addcart2/${product.productid}"
										class="btn btn-primary mt-1" style="margin-left: 35px;">Đặt
										hàng ngay</a> <a
										href="/admin/products/addcart/${product.productid}"
										type="button" class="btn btn-outline-success mt-2"
										style="margin-left: 43px"> Thêm vào giỏ</a>
								</div>
						</div>
					</div>




				</c:forEach>




			</div>
		</article>
		<aside class="col mt-3 mr-2" style="margin-right: 0px">
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left" type="button"
								data-toggle="collapse" data-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">Sản
								phẩm mới cập nhật</button>
						</h2>
					</div>

					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
							<c:forEach var="product" items="${products}">
								<ul style="list-style-type: none; text-align: left;">
									<a href="/admin/products/edit/${product.productid}">${product.name}</a>
									<hr>
								</ul>
							</c:forEach>
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
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#accordionExample">
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
	<form action="/admin/products/home" method="get">
		<br />
		<div class="row mt-4" style="margin-left: 20px">

			<button class="btn btn-outline-success" name="page" value="1"
				onchange="this.form.submit()"
				style="width: 60px; margin-left: 270px"><<</button>

			<button class="btn btn-outline-danger" name="page"
				value="${productpage.number - 0}"
				style="width: 60px; margin-left: 20px" onchange="this.form.submit()"><</button>

			<button class="btn btn-outline-warning" name="page"
				style="width: 60px; margin-left: 20px"
				value="${productpage.number + 2}" onchange="this.form.submit()">></button>

			<button class="btn btn-outline-info" name="page"
				style="width: 60px; margin-left: 20px"
				value="${productpage.totalPages}" onchange="this.form.submit()">>></button>
				
			<c:if test="${sessionScope.admin==true}">
			<div class="float-right ml-5">
				<a class="btn btn-outline-light" href="/admin/products/add"
					style="color: blue">Add Product</a>
			</div>
			</c:if>
		</div>
	</form>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous">
		
	</script>
	<%--     <c:if test="${not empty page.scriptUrl}"> --%>
	<%--     <jsp:include page="${page.scriptUrl}"></jsp:include>     --%>
	<%--     </c:if> --%>
</body>

</html>
