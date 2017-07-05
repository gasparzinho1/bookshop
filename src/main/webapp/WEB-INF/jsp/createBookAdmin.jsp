<%@ page contentType="text/html; charset=utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='/webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
		<script type="text/javascript" src="/static/js/books.js"></script>
		<title>Book editor</title>
	</head>
	
	<body>
		<div class="row" style="height: 10px"></div>
	
		<form id="cancelForm" action="/admin/books" method="get">
			<input type="hidden" name="viewName" value="booksAdmin">
		</form>
	
		<div class="container">
			<div class="row">
				<form id="saveForm" action="/admin/books/save-book" method="post">
					<input type="hidden" name="genres" id="genres">
					<input type="hidden" name="authors" id="authors">
				
					<c:choose>
						<c:when test="${book eq null}"><input type="hidden" id="bookId" name="bookId" value="0"></c:when>
						<c:otherwise><input type="hidden" name="bookId" id="bookId" value="${book.bookId}"></c:otherwise>
					</c:choose>
				
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
							<div class="row">
								<div class="form-group">
									<label>Title</label>
									<input name="title" id="title" class="form-control" placeholder="Title" type="text" required="required" value="${book.title}" maxlength="45"/>
								</div>
								<div class="text-center"><label id="titleMessage" style="color: red;"></label></div>
								
								<div class="form-group">
									<label>Price</label>
									<input name="price" id="price" class="form-control" placeholder="0.0" type="number" step="0.01" required="required" value="${book.price}" min="0" value="0"/>			
								</div>
								<div class="text-center"><label id="priceMessage" style="color: red;"></label></div>
								
								<div class="form-group">
									<label>Description</label>
									<textarea name="description" id="description" placeholder="Description" class="form-control" rows="10" required="required" maxlength="1000">${book.description}</textarea>
								</div>
								<div class="text-center"><label id="descriptionMessage" style="color: red;">${message}</label></div>
								
								<div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-7 col-md-offset-7 col-sm-offset-7 col-xs-offset-7">
									<button class="btn btn-md btn-success btn-block" type="button" id="saveButton" onclick="saveBook()">Save</button>	
								</div>	
								<div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-7 col-md-offset-7 col-sm-offset-7 col-xs-offset-7">
									<button class="btn btn-md btn-primary btn-block" type="button" onclick="cancel()">Cancel</button>	
								</div>	
							</div>
						</div>
				
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<div class="text-center"><label>Genres</label></div>
							<div class="row">
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
									<input class="form-control" type="text" id="genreName" name="genreName" placeholder="Genre" maxlength="30"/>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
									<button type="button" class="btn btn-md btn-primary btn-block" onclick="addGenreRow()">Add</button>		
								</div>
								<div class="text-center"><label id="genreMessage" style="color: red;"></label></div>
							</div>
							<div class="form-group">
								<table id="genresTable" class="table table-striped">
									<thead><tr><th class="col-lg-8 col-md-8 col-sm-8 col-xs-8">Genre</th></tr></thead>
									<tbody>
										<c:forEach var="genre" items="${book.genres}">
											<tr>
												<td class="col-lg-10 col-md-10 col-sm-10 col-xs-10">${genre.name}</td>
												<td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
													<button type="button" class="btn btn-xs btn-danger btn-block" onclick="deleteGenreRow(this)">Delete</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
							
						<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
							<div class="text-center"><label>Authors</label></div>
							<div class="row">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
									<input class="form-control" type="text" id="authorName" name="authorName" placeholder="Name" maxlength="30"/>
								</div>
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
									<input class="form-control" type="text" id="authorSurname" name="authorSurname" placeholder="Surname" maxlength="30"/>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<button type="button" class="btn btn-md btn-primary btn-block" onclick="addAuthorRow()">Add</button>		
								</div>
								<div class="text-center"><label id="authorMessage" style="color: red;"></label></div>
							</div>
							<div class="form-group">
								<table id="authorsTable" class="table table-striped">
									<thead>
										<tr>
											<th class="col-lg-5 col-md-5 col-sm-5 col-xs-5">Name</th>
											<th class="col-lg-5 col-md-5 col-sm-5 col-xs-5">Surname</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="author" items="${book.authors}">
											<tr>
												<td class="col-lg-5 col-md-5 col-sm-5 col-xs-5">${author.name}</td>
												<td class="col-lg-5 col-md-5 col-sm-5 col-xs-5">${author.surname}</td>
												<td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
													<button type="button" class="btn btn-xs btn-danger btn-block" onclick="deleteAuthorRow(this)">Delete</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<script type="text/javascript">
			checkGenreTableChanges();
			checkAuthorTableChanges();
		</script>
	</body>
</html>