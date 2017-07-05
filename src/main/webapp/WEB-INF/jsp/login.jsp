<%@ page contentType="text/html; charset=UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='/webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
		<title>Login</title>
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="row" style="height: 100px"></div>
			
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4" style="height: 250px">
					<form action="/login" method="post">
						<div class="form-group">
							<label for="inputLogin">Login</label>
						    <input type="text" name="username" id="inputLogin" class="form-control" placeholder="Login" required="required">
						</div>
						<div class="form-group">
							<label for="inputPassword">Password</label>
					    	<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
						</div>
						<div class="form-group">
							<button class="btn btn-md btn-primary btn-block" type="submit">Log in</button>
					    </div>
				    </form>
					<div class="form-group">
						<form action="/" method="get">
							<input type="hidden" name="viewName" value="books">
							<button class="btn btn-md btn-danger btn-block" type="submit">Come back</button>
						</form>
					</div>
						
					<div class="form-group">
					    <c:if test="${param.error ne null}">
							<div class="alert alert-danger text-center">
								<h4>Invalid login or password</h4>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>