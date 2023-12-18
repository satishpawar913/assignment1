<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Hello, world!</title>
<style>
/* Add custom CSS to remove the line */
.registration-heading {
	margin-bottom: 0; /* Remove default margin */
	padding-bottom: 0; /* Remove default padding */
	border-bottom: none; /* Remove border */
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-center registration-heading mb-4">Registration
			Form</h2>
		<div class="form-container mt-3">

			<form action="processform" method="post"
				onsubmit="return validateForm()">

				<c:if test="${not empty message}">
					<h5 class="${success ? 'text-success' : 'text-danger'}">${message}</h5>
					<c:remove var="message" />
				</c:if>
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="email"
						aria-describedby="emailHelp" placeholder="Enter email"
						name="email"> <small id="emailError"
						class="form-text text-danger"></small>
				</div>

				<div class="form-group">
					<label for="name">Employee Full Name</label> <input type="text"
						class="form-control" id="fullName"
						placeholder="Enter Employee Name" name="fullName"
						oninput="validateName()" required> <small
						class="text-danger" id="nameError"></small>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="password"
						placeholder="Enter Password" name="password"> <small
						id="passwordError" class="form-text text-danger"></small>
				</div>
				<div class="form-group">
					<input type="radio" class="radio-button" name="gender" value="Male"
						class="form-control"> <label>Male</label> <input
						type="radio" class="radio-button" name="gender" value="Female"
						class="form-control"> <label>Female</label>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Signup</button>
				</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		function validateName() {
			var name = document.getElementById('fullName').value.trim();
			var nameError = document.getElementById('nameError');

			// Name should not contain numbers
			if (/\d/.test(name)) {
				nameError.innerHTML = 'Employee Name should not contain numbers.';
			} else {
				nameError.innerHTML = '';
			}
		}
		function validateForm() {
			// Email validation
			var email = document.getElementById("email").value;
			var emailError = document.getElementById("emailError");
			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (!emailRegex.test(email)) {
				emailError.innerHTML = "Invalid email format";
				return false;
			} else {
				emailError.innerHTML = "";
			}

			// Name validation
			var name = document.getElementById('fullName').value.trim();
			var nameError = document.getElementById('nameError');
			var maxNameLength = 50; // Set your desired maximum length for the name
			if (name === '') {
				nameError.innerHTML = 'Employee Name is required';
				isValid = false;
			} else if (name.length > maxNameLength) {
				nameError.innerHTML = 'Employee Name exceeds the maximum length of '
						+ maxNameLength + ' characters.';
				isValid = false;
			} else {
				nameError.innerHTML = '';
			}
			
			// Password validation
			var password = document.getElementById("password").value;
			var passwordError = document.getElementById("passwordError");
			var passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			if (!passwordRegex.test(password)) {
				passwordError.innerHTML = "Invalid password format";
				return false;
			} else {
				passwordError.innerHTML = "";
			}

			return true;
		}
	</script>
</body>
</html>
