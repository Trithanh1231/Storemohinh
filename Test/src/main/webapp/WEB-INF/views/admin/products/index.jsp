<%@page import="javax.servlet.jsp.tagext.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
<title>Management</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
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
.card{
border-radius: 20px;
}
.form-search{
padding-left: 750px;
}
</style>

<!-- modal event -->
<script type="text/javascript">
			$(document).ready(function() {

				//xóa
				
				$('.table .deleteBtn').on('click', function(event) {
						event.preventDefault();
						var href = $(this).attr('href');
						$('#deleteModal #deleteHref').attr('href', href);
						$('#deleteModal').modal();
					})

	});
</script>
</head>
<body>
	<div class="container-fuild">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mx-auto">
					<div class="card text-white d-block">
						<div class="card-header text-center text-white ">
							<h2>
								 List Student
							</h2>
						</div>
						<div class="row my-2 mx-3 form-search">
							<form class="form-inline" action="/home/search" method="post">
								<input class="form-control text-dark" name="keyword" type="text" 
									placeholder="Search">
								<button class=" mx-3 btn btn-success searchBtn form-control" type="submit">Search</button>
							</form>
						</div>
						<table class="table table-hover table-bordered">
						<thead class="text-danger text-center">
						<tr>
						<th>No.</th>
						<th>Avatar</th>
						<th>Username</th>
						<th>Email</th>
						<th>Gender</th>
						<th>Mark</th>
						<th>Faculty</th>
						<th>Hobby</th>
						</tr>
						</thead>
						<tbody>
						<c:set var="no" value="0"></c:set>
						<c:forEach var="item" items="${products}">
						<c:set var="no" value="${no + 1}"></c:set>
						<tr class="text-white font-weight-bold">
						<td>${no}</td>
						<td class="text-center">
						<img src="/images/${item.image}" class="rounded-circle" alt="" width="70px" height="70px"/>
						</td>
						<td class="align-middle">${item.name}</td>
						<td class="align-middle">${item.email}</td>
						<td class="align-middle">${item.gender?'Male':'Female'}</td>
						<td class="align-middle">${item.mark}</td>
						<td class="align-middle">${item.faculty}</td>
						<td class="align-middle">${item.hobby}</td>
						 	
						</tr>
						</c:forEach>
						</tbody>
						</table>
						<div class="row ml-1">
						<div class="col-lg-12">
						<a class="btn btn-primary saveBtn px-4 mb-3" href="/home/save"><i class="fas fa-save"></i> New Student</a>
						</div>
						</div>							
					</div>
				</div>
			</div>
		</div>

        
		<!-- Modal delete-->
		<div class="modal fade" id="deleteModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<p>Are you sure you want to delete User?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">No</button>
						<a href="" id="deleteHref" class="btn btn-danger">Yes</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>

</html>