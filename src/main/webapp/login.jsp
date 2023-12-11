
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up </title>

<!-- Font Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">




<link href="css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    
    <% String successMessage = (String)request.getAttribute("successMessage"); %>
<% if (successMessage != null) { %>
    <div class="success-message">
        <%= successMessage %>
    </div>
<% } %>

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
						<a href="register.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign up</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
                                                    
							
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="login" />
							</div>
                                                    
                                                     
						</form>
                                                
                                          
						<div class="social-login">
						
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>


	<script src="vendor/jquery/jquery.min.js"></script>
	
        <script src="js/login.js" type="text/javascript"></script>
        
   
</body>

</html>