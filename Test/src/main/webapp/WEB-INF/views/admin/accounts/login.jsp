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
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

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
<style>
.form-control {
	border-radius: 15px;
	background: rgba(225, 225, 225, 0.4);
}

.container-fuild {
	position: relative;
}

.container-fuild>.videobg>video {
	width: 100%;
	position: absolute;
}

.container-fuild>.container>.row>.col-md-12>.card {
	position: relative;
	margin-top: 100px;
	background: rgba(0, 0, 0, 0.6);
}

.text {
	color: white;
}

.card {
	border-radius: 20px;
}

.form-search {
	padding-left: 750px;
}
</style>
</head>
<body>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<div class="container-fuild">
				<div class="videobg">
					<video src="/videos/Animation - 7529.mp4" muted loop autoplay height="600px"></video>
				</div>
				<div class="container" style="padding-top: 100px">
					<header class="row text-center"> </header>
					<section class="row">
						<div class="col-6 offset-3 mt-4">
							<form action="alogin" method="post" modelAttribute="account">
								<div class="card">
									<div class="card-header">
										<h2>Login</h2>
										<c:if test="${sessionScope.message!= null }">
										<h4 style="text-align: center;">${sessionScope.message}</h4>
									</c:if>
									</div>
									<div class="card-body">
										<div class="mb-3">
											<label for="formGroupExampleInput" class="form-label">UserName</label>
											<input type="text" class="form-control" id="username" name="username"
												value="${account.username}" placeholder="">
										</div>
										<div class="mb-3">
											<label for="formGroupExampleInput2" class="form-label">PassWord</label>
											<input type="password" class="form-control" id="password" name="password"
												value="${account.password}" placeholder="">
										</div>


										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" name="remember"
												id="flexCheckDefault"> <label class="form-check-label"
												for="flexCheckDefault">
												Remember </label>
										</div>
									</div>
									<div class="card-footer text-muted">
										<button type="submit" class="btn btn-outline-primary">
											<i class="fas fa-save"></i> Login
										</button>
										<a class="btn btn-outline-success" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
											role="tab" aria-controls="nav-profile" aria-selected="false">Register</a>
										<button type="reset" class="btn btn-outline-danger">
											<i class="bi bi-arrow-clockwise"></i> Reset
										</button>
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			<div class="container-fuild">
				<div class="videobg">
					<video src="/videos/Animation - 7529.mp4" muted loop autoplay height="600px"></video>
				</div>
				
			<div class="container" style="padding-top: 100px;">
				<header class="row text-center"> </header>
				<section class="row">
					<div class="col-6 offset-3 mt-4">
						<form action="dk" method="post" modelAttribute="account">
							<div class="card">
								<div class="card-header">
									<h2>Add New Account</h2>
									
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label for="formGroupExampleInput" class="form-label">UserName</label>
										<input type="text" class="form-control" id="username" name="username">
									</div>
									<div class="mb-3">
										<label for="formGroupExampleInput2" class="form-label">PassWord</label>
										<input type="password" class="form-control" id="password" name="password">
									</div>
									<div class="mb-3">
										<label for="formGroupExampleInput2" class="form-label">Enter the
											password</label>
										<input type="password" class="form-control" id="password" name="password2">
									</div>
								</div>
								<div class="card-footer text-muted">
									<button type="submit" class="btn btn-outline-primary">
										<i class="fas fa-save"></i> Save
									</button>
									<a href="alogin" class="btn btn-outline-info">Login</a>
									<button type="reset" class="btn btn-outline-danger">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</section>
			</div>
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