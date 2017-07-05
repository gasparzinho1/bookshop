<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='/webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
		<title>Error</title>
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="row" style="height: 100px"></div>
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-lg-offset-5 col-md-offset-5 col-sm-offset-5 col-xs-offset-5" style="height: 250px">
					<h2 class="text-center">Ooops, something went wrong!</h2>
					<button class="btn btn-md btn-primary btn-block" type="button" onclick="javascript:history.back()">Come back</button>
				</div>
			</div>
		</div>
	</body>

</html>