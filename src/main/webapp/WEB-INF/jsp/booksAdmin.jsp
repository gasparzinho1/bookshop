<%@ page contentType="text/html; charset=utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='/webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
		<title>Books</title>
	</head>
	
	<body>
		<div class="row" style="height: 10px"></div>
	
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
					<div class="text-center"><h3>Menu</h3></div>
					<div class="form-group">
						<form action="/admin/books" method="get">
							<input type="hidden" name="viewName" value="booksAdmin">
							<button class="btn btn-md btn-primary btn-block" type="submit">All books</button>	
						</form>
					</div>
					<div class="form-group">
						<form action="/admin/genres" method="get">
							<button class="btn btn-md btn-primary btn-block" type="submit">Genres</button>
						</form>
					</div>
					<div class="form-group">
						<form action="/admin/authors" method="get">
							<button class="btn btn-md btn-primary btn-block" type="submit">Authors</button>
						</form>	
					</div>
					<div class="form-group">
						<form action="/admin/createBook" method="get">
							<input type="hidden" name="buttonName" value="add">
							<button class="btn btn-md btn-success btn-block" type="submit">Add a book</button>
						</form>
					</div>
					<div class="form-group">
						<form action="/genre/get-books" method="get">
							<input type="hidden" name="viewName" value="booksAdmin">
							<label>Find by genre</label>
							<input class="form-control" type="text" name="genreName" required="required" placeholder="Genre" maxlength="45">
							<label style="color: red;">${genreMessage}</label>
							<button class="btn btn-md btn-success btn-block" type="submit">Find by genre</button>	
						</form>
					</div>
					<form action="/author/get-books" method="get">
						<input type="hidden" name="viewName" value="booksAdmin">
						<label>Find by author</label>
						<div class="form-group">
							<input class="form-control" type="text" name="authorName" required="required" placeholder="Name" maxlength="45">
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="authorSurname" required="required" placeholder="Surname" maxlength="45">
							<label style="color: red;">${authorMessage}</label>
						</div>
						<div class="form-group">
							<button class="btn btn-md btn-success btn-block" type="submit">Find by author</button>	
						</div>
					</form>
					<div class="form-group">
						<form action="/logout" method="post">
							<button class="btn btn-md btn-danger btn-block" type="submit">Log out</button>
						</form>	
					</div>
				</div>
				
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
					<c:choose>
						<c:when test="${empty books}">
							<div class="text-center"><h3>The list of books is empty</h3></div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">#</th>
										<th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Title</th>
										<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Author</th>
										<th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Genres</th>
										<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">Price</th>
										<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">Update</th>
										<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="book" items="${books}" varStatus="counter">
										<tr>
											<td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${counter.count}</td>
											<td class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><b>${book.title}</b></td>
											<td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
												<c:forEach var="author" items="${book.authors}">
													<input type="hidden" name="asker" value="booksAdmin">
													<a href="/author/get-books/?authorName=${author.name}&authorSurname=${author.surname}&viewName=booksAdmin">
														${author.name} ${author.surname}<br></a>
												</c:forEach>
											</td>
											<td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
												<c:forEach var="genre" items="${book.genres}">
													<a href="/genre/get-books/?genreName=${genre.name}&viewName=booksAdmin">
														${genre.name}<br></a>
												</c:forEach>
											</td>
											<td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${book.price}</td>
											<td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
												<form action="/admin/books/book-info" method="get">
													<input type="hidden" name="bookId" value="${book.bookId}">
													<input type="hidden" name="viewName" value="createBookAdmin">
													<button class="btn btn-xs btn-success btn-block" type="submit">Update</button>	
												</form>
											</td>
											<td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
												<form action="/admin/books/delete-book" method="post">
													<input type="hidden" name="bookId" value="${book.bookId}"/>
													<button class="btn btn-xs btn-danger btn-block" type="submit">Delete</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>			
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
	</body>
</html>