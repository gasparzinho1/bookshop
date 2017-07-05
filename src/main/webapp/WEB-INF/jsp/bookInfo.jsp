<%@ page contentType="text/html; charset=utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='/webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
		<title>Book info</title>
	</head>
	
	<body>
		<div class="row" style="height: 10px"></div>
		
		<form id="loadBookInfo" action="/book-info" method="get">
			<input type="hidden" name="bookId" value="${param.bookId}">
			<input type="hidden" name="hiddenMessage" value="${param.hiddenMessage}">
			<input type="hidden" name="viewName" value="bookInfo">
		</form>
		
		<c:if test="${book eq null}">
			<script type="text/javascript">
				document.getElementById('loadBookInfo').submit();
			</script>
		</c:if>
		
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
					<div class="text-center"><h3><b>${book.title}</b></h3></div>
					<div class="row"><p><b>Price: </b>${book.price}</p></div>
					<div class="row">
						<p><b>Authors: </b>
							<c:forEach var="author" items="${book.authors}" varStatus="counter">
								<a href="/author/get-books/?authorName=${author.name}&authorSurname=${author.surname}&viewName=books">
									${author.name} ${author.surname}</a>
								<c:if test="${!counter.last}">, </c:if>
							</c:forEach></p>
					</div>
					<div class="row">
						<p><b>Genres: </b>
							<c:forEach var="genre" items="${book.genres}" varStatus="counter">
								<a href="/genre/get-books/?genreName=${genre.name}&viewName=books">
									${genre.name}</a>
								<c:if test="${!counter.last}">, </c:if>
							</c:forEach></p>
					</div>
					<div class="row"><p style="text-align: justify;"><b>Description: </b>${book.description}</p></div>
					<form class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-7 col-md-offset-7 col-sm-offset-7 col-xs-offset-7" action="/books" method="get">
						<input type="hidden" name="viewName" value="books">
						<button class="btn btn-md btn-primary btn-block" type="submit">All books</button>
					</form>	
				</div>
				
				<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
					<div class="text-center"><h3>Order form</h3></div>
					<div class="text-center"><label style="color: green;">${param.hiddenMessage}</label></div>
					
					<form action="/save-order" method="post">
						<input type="hidden" name="orderId" value="0">
						<input type="hidden" name="bookId" value="${book.bookId}">
						<input type="hidden" name="hiddenMessage" value="Thanks for the order, the manager will contact you within an hour">
					
						<div class="form-group">
							<label>First Name</label>
							<input name="firstName" class="form-control" type="text" required="required" maxlength="45"/>
						</div>
						<div class="form-group">
							<label>Last Name</label>
							<input name="lastName" class="form-control" type="text" required="required" maxlength="45"/>
						</div>
						<div class="form-group">
							<label>Address</label>
							<input name="address" class="form-control" type="text" required="required" maxlength="45"/>
						</div>
						<div class="row">
							<div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-2"><label>Quantity</label></div>
							<div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<input name="quantity" class="form-control" type="number" min="1" required="required"/>
							</div>
							<div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
								<button class="btn btn-md btn-success btn-block" id="saveButton">Order it</button>	
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</body>
</html>