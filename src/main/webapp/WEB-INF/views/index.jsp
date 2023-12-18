<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="./base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center mb-3">Welcome to Employee Web App</h1>

				<!-- Check for the presence of the logoutMessage parameter -->
				<c:if test="${param.logoutMessage == 'true'}">
					<div id="logoutMessage" class="alert alert-success" role="alert">
						Logout successful. Redirecting to login page...</div>
					<script>
						// Automatically hide the logout message after 2 seconds
						setTimeout(function() {
							var logoutMessage = document
									.getElementById('logoutMessage');
							if (logoutMessage) {
								logoutMessage.style.display = 'none';
							}
						}, 2000);
					</script>
				</c:if>

				<!-- Display the logout message from the session -->
				<c:if test="${not empty sessionScope.message}">
					<div class="alert alert-success" role="alert">
						${sessionScope.message}</div>
				</c:if>

				<!-- Rest of your existing HTML content -->


				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">EmpName</th>
							<th scope="col">City</th>
							<th scope="col">MobNumber</th>
							<th scope="col">PinCode</th>
							<th scope="col">Salary</th>
							<th scope="col">Gender</th>
							<th scope="col">Date</th>
							<th scope="col">Delete</th>
							<th scope="col">Update</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employees}" var="e">
							<tr class="tablee">
								<th scope="row">${e.id}</th>
								<td>${e.name}</td>
								<td>${e.city}</td>
								<td>${e.number}</td>
								<td>${e.pincode}</td>
								<td class="font-weight-bold mr-2">&#8377; ${e.salary}</td>
								<td>${e.gender}</td>
								<td>${e.date}</td>

								<td><a href="delete/${e.id}"
									onclick="return confirmDelete();">
										<div class="container text-left">
											<i class="fa-solid fa-trash-can text-danger"></i>
										</div>
								</a></td>
								<td><a href="update/${e.id}">
										<div class="container text-left">
											<i class="fa-solid fa-user-pen"></i>
										</div>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	

				<div class="container text-center">
					<a href="${pageContext.request.contextPath }/add-employee"
						class="btn btn-outline-success">Add Employee</a>
						<a class="btn btn-danger" href="logout">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<script>
		function confirmDelete() {
			return confirm("Are you sure you want to delete this employee?");
		}
	</script>
</body>
</html>
