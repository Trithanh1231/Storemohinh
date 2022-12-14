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
			<div class="col-6 offset-3 mt-4">
				<form action="admin/accounts/saveOrUpdate" method="post"
					modelAttribute="account">
					<div class="card">
						<div class="card-header">
							<h2>Add New Account</h2>
						
						</div>
						<div class="card-body">
							<div class="mb-3">
								<label for="formGroupExampleInput" class="form-label">UserName</label>
								<input type="text" class="form-control" id="username"
									name="username" value="${account.username}"
									placeholder="Example input placeholder">
							</div>
							<div class="mb-3">
								<label for="formGroupExampleInput2" class="form-label">PassWord</label>
								<input type="password" class="form-control" id="password"
									name="password" value="${account.password}"
									placeholder="Another input placeholder">
							</div>
							<div class="form-check form-check-inline">
								<label class="ml-2"> <input type="radio" id="status"
									name="admin" value="true" class="form-check-input"
									${account.admin?'checked':''}>Admin
								</label> <label class="ml-2"> <input type="radio" id="status"
									name="admin" value="false" class="form-check-input"
									${!account.admin?'checked':''}>User
								</label>
							</div>
						</div>
						<div class="card-footer text-muted">
							<button type="submit" class="btn btn-outline-primary">
								<i class="fas fa-save"></i> Save
							</button>
							
							<a href="/admin/accounts" type="button"
								class="btn btn-outline-success"> List Categories</a>
							
							<button type="reset" class="btn btn-outline-danger">Reset</button>
						</div>
					</div>
				</form>
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