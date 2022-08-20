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
	<div class="col">
		<!-- để thực hiện đổi tab để hiển thị nội dung thì cần đến script #mytab -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<!--hiển thị thông tin các video lên trên form-->
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="videoEditing-tab" data-toggle="tab"
				href="#videoEditing" role="tab" aria-controls="videoEditing"
				aria-selected="true">Product Editing</a></li>
			<!--hiển thị thông tin các video ở trên bảng-->
			

		</ul>
		<!--hiển thị nội dung của các tab-->
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="videoEditing"
				role="tabpanel" aria-labelledby="videoEditing-tab">
				<form action="admin/products/saveOrUpdate" method="post"
					modelAttribute="product" enctype='multipart/form-data'>
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-3">
									<div class="border p-3">
										<img src="/images/${product.image}" width="100%" height="300px"
											style="margin-bottom: 5px">
										<div class="custom-file">

											<label for="image" class="custom-file-label">Image/Video</label>
											<input type="file" class="custom-file-input" id="image"
												name="imageFile" />
										</div>
									</div>
								</div>
								<div class="col-9">
									<div class="form-group">
										<div class="form-group">
											<label for="categoryid">Product ID</label> <input type="text"
												class="form-control" name="productid" id="" value="${product.productid }"
												aria-describedby="categoryidHid" placeholder="CategoryID"
												readonly="readonly">

										</div>
									</div>
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											style="background-color: #E6E6FA; color: #32CD32"
											class="form-control" name="name" id="name" value="${product.name }"
											/>

									</div>
									<div class="form-group">
										<label for="unitprice">Giá</label> <input type="number"
											style="background-color: #E6E6FA; color: #32CD32"
											class="form-control" name="unitprice" id="unitprice" value="${product.unitprice }"
											 aria-describedby="Giá"
											placeholder="Giá"> 
									</div>


									<div class="form-group">
										<label for="description">Miêu tả</label> <input type="text"
											style="background-color: #E6E6FA; color: #32CD32"
											class="form-control" name="description" id="description" value="${product.description }"
											 aria-describedby="descriptionId" placeholder="Miêu tả">
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer text-muted">
							<button type="submit" class="btn btn-outline-primary">
								<i class="fas fa-save"></i> Save
							</button>
							<button formaction="VideoManagementServlet/update"
								class="btn btn-outline-success">UPDATE</button>
							<button formaction="VideoManagementServlet/delete"
								class="btn btn-outline-warning">DELETE</button>
							<button formaction="VideoManagementServlet/reset"
								class="btn btn-outline-danger">RESET</button>
						</div>
					</div>
				</form>
			</div>

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