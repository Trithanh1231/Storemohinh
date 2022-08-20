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
	<div class="container" style="margin-top: 1px;">
		<header class="row text-center"> </header>
		<section class="row">
			<div class="col mt-4">
				<div class="card">
					<div class="card-header">
						<h2>List of Categories</h2>
					</div>
					<div class="card-body">

						<c:if test="@{message !=null}">
							<h2>${message}</h2>
						</c:if>
						<div class="row mt-2 mb-2">
							<div class="col">
								<form action="/admin/categories/searchpaginated" method="get">
									<div class="form-inline float-left">
										<label for="name" style="margin-right: 4px">Name</label> <input
											type="text" class="form-control" name="name" id="name"
											aria-describedby="helpId" placeholder="Name">
										<button class="btn btn-outline-primary ml-2">Search</button>
									</div>
									<br />
									<div class="row mt-4" style="margin-left: 20px">
										
											<button class="btn btn-outline-success" name="page" value="1"
												onchange="this.form.submit()" style="width: 60px; margin-left: 270px"><<</button>
										
											<button class="btn btn-outline-danger" name="page"
												value="${categoryPage.number - 0}" style="width: 60px; margin-left: 20px"
												onchange="this.form.submit()"><</button>
										
											<button class="btn btn-outline-warning" name="page" style="width: 60px; margin-left: 20px"
												value="${categoryPage.number + 2}"
												onchange="this.form.submit()">></button>
									
											<button class="btn btn-outline-info" name="page" style="width: 60px; margin-left: 20px"
												value="${categoryPage.totalPages}"
												onchange="this.form.submit()">>></button>
										
										<div class="float-right ml-5">
											<a class="btn btn-outline-light"
												href="/admin/categories/add" style="color:blue">Add Category</a>
										</div>
									</div>
								</form>

							</div>
						</div>
						<div class="row">
							<c:if test="${!categoryPage.hasContent()}">
								<div class="col">
									<div class="alert alert-success" role="alert">
										<strong>No Categories Found</strong>
									</div>
								</div>
							</c:if>
						</div>
						<table class="table table-striped table-inverse">
							<c:if test="${categoryPage.hasContent()}">
								<thead class="thead-inverse">
									<tr>
										<th>Category ID</th>
										<th>Name</th>
										<th></th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<c:forEach var="category" items="${categoryPage.content}">
											<td scope="row">${category.categoryid}</td>
											<td>${category.name}</td>
											<td><a
												href="/admin/categories/view/${category.categoryid}"
												class="btn btn-outline-primary"><i
													class="fas fa-info    "></i></a> <a
												href="/admin/categories/edit/${category.categoryid}"
												class="btn btn-outline-danger"><i class="fas fa-edit"></i></a>

												<a href="/admin/categories/delete/${category.categoryid}"
												class="btn btn-outline-success"><i
													class="fas fa-recycle"></i></a></td>
									</tr>
								</tbody>
								</c:forEach>
							</c:if>

						</table>
					</div>
					<div class="card-footer text-muted">
						<form action="">
							<div class="form-group">
								<label>page size</label> <select class="form-inline float-left"
									name="size" onchange="this.form.submit()">

									<option selected="${categoryPage.size==5}" value="5">5</option>
									<option selected="${categoryPage.size==10}" value="10">10</option>
									<option selected="${categoryPage.size==15}" value="15">15</option>
									<option selected="${categoryPage.size==20}" value="20">20</option>
									<option selected="${categoryPage.size==30}" value="30">30</option>
								</select>
							</div>
						</form>
						<nav aria-label="Page navigation">
							<c:if test="${categoryPage.totalPages > 0}">
								<ul class="pagination justify-content-center">

									<c:if test="${1== categoryPage.number +1}">
										<li class="page-item active"><a
											href="/admin/categories/searchpaginated" name="page"
											value="1" class="page-link">First</a></li>
									</c:if>








									<c:forEach var="pageNumber" items="${pageNumbers}">
										<c:if test="${categoryPage.totalPages >1}">
											<li class="page-item active"
												class="${pageNumber == categoryPage.number +1} ? 'page-item active':'page-item'">
										</c:if>
									</c:forEach>

									<li class="page-item active"><a
										href="/admin/categories/searchpaginated" name="page" value="1"
										class="page-link">First</a></li>


									<li
										class="${ categoryPage.totalPages == categoryPage.number +1} ? 'page-item active':'page-item'">
										<a
										href="/admin/categories/searchpaginated(name=${name},size=${categoryPage.size},
                                    page=${categoryPage.totalPages})"
										class="page-link">Last Page</a>

									</li>
								</ul>
							</c:if>
						</nav>


					</div>
				</div>

			</div>
		</section>
	</div>
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