<%@ page contentType="text/html; charset=utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='/webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
		<link rel='stylesheet' href='/static/css/table.css'>
		<script src="/static/js/genres.js" type="text/javascript"></script>
		<title>Genres</title>
	</head>
	
	<body>
		<div class="row" style="height: 10px"></div>
	
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
					<div class="text-center"><h3>Menu</h3></div>
					<form class="form-group" action="/admin/books" method="get">
						<input type="hidden" name="viewName" value="booksAdmin">
						<button class="btn btn-md btn-primary btn-block" type="submit">Books</button>
					</form>
					<form class="form-group" action="/admin/authors" method="get">
						<button class="btn btn-md btn-primary btn-block" type="submit">Authors</button>
					</form>
					<form class="form-group" action="/logout" method="post">
						<button class="btn btn-md btn-danger btn-block" type="submit">Log out</button>
					</form>	
				</div>
				
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<div class="text-center"><h3>Genres</h3></div>
			
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">#</th>
								<th class="col-lg-7 col-md-7 col-sm-7 col-xs-7">Name</th>
								<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Edit</th>
								<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="genre" items="${genres}" varStatus="counter">
								<tr>
									<td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${counter.count}</td>
									<td class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
										<a href="/genre/get-books/?genreName=${genre.name}&viewName=booksAdmin">${genre.name}</a>
									</td>
									<td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<button class="btn btn-xs btn-success btn-block" type="button" onclick="fillGenreEditForm(${genre.genreId}, '${genre.name}')">Edit</button>	
									</td>
									<td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<form id="deleteForm" action="/admin/genres/delete-genre" method="post">
											<input type="hidden" name="genreId" value="${genre.genreId}">
											<button class="btn btn-xs btn-danger btn-block" type="submit">Delete</button>	
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="text-center"><h3>Genre Editor</h3></div>
					
					<form id="genreEditForm" method="post">
						<input type="hidden" name="genreId" id="genreId" value="0">
						
						<div class="form-group">
							<label>Name</label>
							<input class="form-control" type="text" maxlength="30" placeholder="Genre" name="name" required="required" id="genreName" value=""/>
						</div>
						<div class="text-center"><label id="messageLabel" style="color: red;">${message}</label></div>
						
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
								<button class="btn btn-md btn-primary btn-block" type="button" onclick="createGenre()">New genre</button>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<button class="btn btn-md btn-success btn-block" type="button" onclick="updateGenre()">Update</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</body>
</html>