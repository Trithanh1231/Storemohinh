<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<style>
body {
    color: #566787;
    background: #f5f5f5;
    font-family: 'Roboto', sans-serif;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
    min-width: 1000px;
    background: #fff;
    padding: 20px;
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
    min-width: 100%;
}
.table-title h2 {
    margin: 8px 0 0;
    font-size: 22px;
}
.search-box {
    position: relative;        
    float: left;
}
.search-box input {
    height: 34px;
    width: 200px;
    border-radius: 20px;
    padding-left: 35px;
    border-color: #ddd;
    box-shadow: none;
}
.search-box input:focus {
    border-color: #3FBAE4;
}
.search-box i {
    color: #a0a5b1;
    position: absolute;
    font-size: 19px;
    top: 8px;
    left: 10px;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table-striped tbody tr:nth-of-type(odd) {
    background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
    background: #f5f5f5;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table td:last-child {
    width: 130px;
}
table.table td a {
    color: #a0a5b1;
    display: inline-block;
    margin: 0 5px;
}
table.table td a.view {
    color: #03A9F4;
}
table.table td i {
    font-size: 19px;
}     
</style>
<body>
<c:if test="@{message !=null}">
		<h2>${message}</h2>
	</c:if>
	<form class="d-flex justify-content-around mt-2" action="search1" method="post">

                        	<select name="min" onchange="this.form.submit()" class="form-control" style="width: 200px">
                        	<option selected="selected">Giá</option>
                        	<option selected="selected" value="1">All</option>
                        	<option value="2">100 - 200k</option>
                        	<option value="3">200 - 300k</option>
                        	<option value="4">Trên 500k</option>
                        	<option value="5">Dưới 100k</option>
                        	</select>
							
						</form>
	
	<div style="background-color: #ece5da; text-align: center;">
		<h2>Sản Phẩm</h2>
	</div>
	<section class="row">
		<article class="col-9">
			<div class="row p-2">
				<c:forEach var="item" items="${items}">
					<div class="col-4 mt-2">

						<div class="card" style="width: 15rem;">
							<a href="/admin/products/edit/${item.productid}"
								style="padding: 5px"> <img src="/images/${item.image}"
								class="card-img-top" alt="..." height="250px">
								<div class="card-body">
									<h5 class="card-title" style="text-align: center;">${item.name}</h5>
									<p class="card-text"
										style="text-align: center; font-size: 20px; color: red;">
										${item.unitprice}</p>
									<a href="/admin/products/addcart2/${item.productid}" class="btn btn-primary" style="margin-left: 35px;">Đặt
										hàng ngay</a> 
										 <a
										href="/admin/products/addcart/${item.productid}"
										type="button" class="btn btn-outline-success mt-2"
										style="margin-left: 43px"> Thêm vào giỏ</a>
						</div>
						</a>
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
								aria-expanded="true" aria-controls="collapseOne">Danh sách sản phẩm</button>
						</h2>
					</div>

					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
							<c:forEach var="product" items="${items}">
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

			<div class="float-right ml-5">
				<a class="btn btn-outline-light" href="/admin/categories/add"
					style="color: blue">Add Category</a>
			</div>
		</div>
	</form>
	
</body>
</html>