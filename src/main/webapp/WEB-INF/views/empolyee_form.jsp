<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<title>Employee Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-mt-6 offset-mt-3">
				<h1 class="text-center mb-5">Fill the Employee details</h1>
				<form id="employeeForm"
					action="${pageContext.request.contextPath}/handle-employee"
					method="post">

					<div class="form-group">
						<label for="name">Employee Name</label> <input type="text"
							class="form-control" id="name" placeholder="Enter Employee Name"
							name="name" oninput="validateName()" required> <small
							class="text-danger" id="nameError"></small>
					</div>

					<div class="form-group">
						<label for="city">Employee City</label> <select
							class="form-control" id="city" name="city" required>
							<option value="" selected disabled>Select City</option>
							<option value="Pune">Pune</option>
							<option value="Nashik">Nashik</option>
							<option value="Mumbai">Mumbai</option>
							<!-- Add more cities as needed -->
						</select>
					</div>
					<div class="form-group">
						<label for="number">Employee Number</label> <input type="text"
							maxlength="10" class="form-control" id="number"
							placeholder="Enter Employee Mobile Number" name="number"
							oninput="this.value = 
							this.value.replace(/[^0-9]/g, '').substring(0, 10);"
							required> <small class="text-danger" id="numberError"></small>
					</div>

					<div class="form-group">
						<label for="pincode">Employee Pincode</label> <input type="text"
							maxlength="6" class="form-control" id="pincode"
							placeholder="Enter Employee Pincode" name="pincode"
							oninput="this.value = this.value.replace(/[^0-9]/g, '').substring(0, 6);"
							required> <small class="text-danger" id="pincodeError"></small>
					</div>

					<div class="form-group">
						<label for="salary">Employee Salary</label> <input type="text"
							class="form-control" id="salary"
							placeholder="Enter Employee Salary" name="salary"
							oninput="formatSalary(this.value);" required> <small
							class="text-danger" id="salaryError"></small>
					</div>

					<div class="form-group">
						<label for="dateOfBirth">Date of Birth</label> <input type="date"
							class="form-control" id="dateOfBirth" name="date"
							onchange="validateDate()" required> <small
							class="text-danger" id="dateOfBirthError"></small>
					</div>


					<div class="form-group">
						<input type="radio" class="radio-button" name="gender"
							value="Male" class="form-control" required> <label>Male</label>
						<input type="radio" class="radio-button" name="gender"
							value="Female" class="form-control" required> <label>Female</label>
					</div>

					<div class="container text-center">
						<a href="${pageContext.request.contextPath}/listofemployee"
							class="btn btn-outline-danger">Back</a>
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJt"></script>

	<script>
		//Validtaion fro Salary
		function validateSalary(input) {
			var salary = input.value.trim();
			var salaryError = document.getElementById('salaryError');

			var maxSalaryValue = Number.MAX_VALUE; // Set your desired maximum value

			// Remove non-numeric characters and convert to a floating-point number
			var salaryNumber = parseFloat(salary.replace(/[^\d.]/g, ''));

			if (isNaN(salaryNumber) || salaryNumber > maxSalaryValue) {
				// Display an error message
				salaryError.innerHTML = 'Invalid salary value. Please enter a valid amount.';
				// You may choose to reset the input value or handle it as needed
				input.value = '';
			} else {
				// Update the input value with the formatted salary
				input.value = formatSalary(salaryNumber);
				// Clear the previous error message
				salaryError.innerHTML = '';
			}
		}

		function formatSalary(salary) {
			// Use toLocaleString to format the number with commas and two decimal places
			return '₹ ' + salary.toLocaleString('en-IN', {
				minimumFractionDigits : 2,
				maximumFractionDigits : 2
			});
		}

		//Validation fro Date
		function validateDate() {
			var selectedDate = document.getElementById("dateOfBirth").value;
			var currentDate = new Date();
			var inputDate = new Date(selectedDate);

			var dateOfBirthError = document.getElementById('dateOfBirthError');

			if (inputDate > currentDate) {
				dateOfBirthError.innerHTML = 'Please select a date on or before today.';
				document.getElementById("dateOfBirth").value = ''; // Clear the date input
			} else {
				dateOfBirthError.innerHTML = '';
			}
		}

		//Validation for Name
		function validateName() {
			var name = document.getElementById('name').value.trim();
			var nameError = document.getElementById('nameError');

			// Name should not contain numbers
			if (/\d/.test(name)) {
				nameError.innerHTML = 'Employee Name should not contain numbers.';
			} else {
				nameError.innerHTML = '';
			}
		}

		function validateForm() {
			var name = document.getElementById('name').value.trim();
			var city = document.getElementById('city').value.trim();
			var number = document.getElementById('number').value.trim();
			var pincode = document.getElementById('pincode').value.trim();
			var salary = document.getElementById('salary').value.trim();
			var dateOfBirth = document.getElementById('dateOfBirth').value
					.trim();

			var nameError = document.getElementById('nameError');
			var cityError = document.getElementById('cityError');
			var numberError = document.getElementById('numberError');
			var pincodeError = document.getElementById('pincodeError');
			var salaryError = document.getElementById('salaryError');
			var dateOfBirthError = document.getElementById('dateOfBirthError');

			var isValid = true;

			// Name validation
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

			// City validation
			if (city === '') {
				cityError.innerHTML = 'Employee City is required';
				isValid = false;
			} else {
				cityError.innerHTML = '';
			}

			// Number (Mobile Number) validation
			var maxNumberLength = 10; // Set your desired maximum length for the number
			if (number === '') {
				numberError.innerHTML = 'Employee Number is required';
				isValid = false;
			} else if (isNaN(number) || number.length !== maxNumberLength) {
				numberError.innerHTML = 'Please enter a valid 10-digit mobile number.';
				isValid = false;
			} else {
				numberError.innerHTML = '';
			}

			// Pincode validation
			var maxPincodeLength = 6; // Set your desired maximum length for the pincode
			if (pincode === '') {
				pincodeError.innerHTML = 'Employee Pincode is required';
				isValid = false;
			} else if (isNaN(pincode) || pincode.length !== maxPincodeLength) {
				pincodeError.innerHTML = 'Please enter a valid 6-digit pincode.';
				isValid = false;
			} else {
				pincodeError.innerHTML = '';
			}

			// Salary validation
			var salaryPattern = /^\d+(\.\d{2})?$/; // Allow positive numbers with up to two decimal places
			if (salary === '') {
				salaryError.innerHTML = 'Employee Salary is required';
				isValid = false;
			} else if (!salaryPattern.test(salary)) {
				salaryError.innerHTML = 'Please enter a valid salary.';
				isValid = false;
			} else {
				salaryError.innerHTML = '';
			}

			// Date of Birth validation
			if (dateOfBirth === '') {
				dateOfBirthError.innerHTML = 'Date of Birth is required';
				isValid = false;
			} else {
				dateOfBirthError.innerHTML = '';
			}

			return isValid;
		}
	</script>



</body>
</html>
