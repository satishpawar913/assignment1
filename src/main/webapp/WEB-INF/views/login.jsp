<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image: url('images/cool.jpg');
	background-color: aqua; /* Updated to aqua color */
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	position: relative;
}

section {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
	text-align: center;
	position: relative;
}

section h2 {
	color: #333;
}

.form-group {
	margin-bottom: 20px;
}

.form-groupemail {
	margin-bottom: 20px;
	text-align: left;
}

.form-groupemail label {
	display: block;
	margin-bottom: 5px;
	color: #555;
}

.form-groupemail input {
	width: calc(100% - 16px);
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	color: #555;
}

.text-success {
	color: green;
}

.form-group input {
	width: calc(100% - 16px);
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.form-group button {
	background-color: aqua; /* Updated to aqua color */
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 4px;
}

.form-group button:hover {
	background-color: #45a049;
}

.text-danger {
	color: red;
}

/* Logout Symbol */
.logout-icon {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}
</style>
<script>
	function clearMessage() {
		setTimeout(function() {
			var messageElement = document.getElementById('message');
			if (messageElement) {
				messageElement.innerHTML = '';
			}
		}, 2000);
	}
	window.onload = clearMessage;

	function validateLogin() {
		var email = document.getElementById("email").value;
		var emailError = document.getElementById("emailError");
		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (!emailRegex.test(email)) {
			emailError.innerHTML = "Invalid email format";
			return false;
		} else {
			emailError.innerHTML = "";
		}

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

	function toggleLogout() {
		var logoutIcon = document.getElementById('logoutIcon');
		var messageElement = document.getElementById('message');
		if (logoutIcon.style.display === 'none') {
			// User is logged in
			logoutIcon.style.display = 'block';
			messageElement.innerHTML = 'User Login Successfully';
		} else {
			// User is logged out
			logoutIcon.style.display = 'none';
			messageElement.innerHTML = 'User Logout Successfully';
		}
	}

	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function() {
		history.pushState(null, null, document.URL);
		window.location.href = '${pageContext.request.contextPath}/login'; // Redirect to the login page
	});
</script>
</head>
<body>
	<section>
		<h2>Login</h2>

		<div class="icon-list">
			<!-- Display success or error message -->
			<c:if test="${not empty message}">
				<h5 class="${success ? 'text-success' : 'text-danger'}">${message}</h5>
				<c:remove var="message" />
			</c:if>
		</div>
		<form action="userlogin" method="post"
			onsubmit="return validateLogin()">
			<div class="form-groupemail">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required> <small id="emailError"
					class="form-text text-danger"></small>
			</div>
			<div class="form-groupemail">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required> <small
					id="passwordError" class="form-text text-danger"></small>
			</div>


			<div class="form-group">
				<button type="submit">Login</button>
				<p>
					Don't have an account? <a href="signup" class="link-info">Register
						here</a>
				</p>
			</div>

		</form>

	</section>
</body>
</html>

