function addGenreRow(){
	var genre = document.getElementById('genreName').value;
	var regex = /^[А-Яа-яA-Za-z0-9 _]*$/;
		
	if(genre.trim().length > 0 && regex.test(genre)){
		var table = document.getElementById('genresTable');

		if(table.rows.length < 6){
			var row = table.insertRow(table.rows.length);
			var btn = document.createElement('button');
					
			var cell0 = row.insertCell(0);
			var cell1 = row.insertCell(1);
			
			cell0.className = 'col-lg-8 col-md-8 col-sm-8 col-xs-8';
			cell1.className = 'col-lg-4 col-md-4 col-sm-4 col-xs-4';
			
			cell0.innerHTML = genre;
			cell1.innerHTML = '<button type="button" class="btn btn-xs btn-danger btn-block" onclick="deleteGenreRow(this)">Delete</button>';
					
			checkGenreTableChanges();
		} else {
			document.getElementById('genreMessage').innerHTML = 'You can add maximum 5 genres';
		}
	} else {
		document.getElementById('genreMessage').innerHTML = 'You should enter a valid genre name.<br> Allow characters: (A-Z a-z А-Я а-я 0-9)';
	}
}

function addAuthorRow(){
	var authorName = document.getElementById('authorName').value;
	var authorSurname = document.getElementById('authorSurname').value;
	var regex = /^[А-Яа-яA-Za-z _]*$/;
		
	if(authorName.trim().length > 0 && authorSurname.trim().length > 0 && regex.test(authorName) && regex.test(authorSurname)){
		var table = document.getElementById('authorsTable');
				
		if(table.rows.length < 6){
			var row = table.insertRow(table.rows.length);
			var btn = document.createElement('button');
			
			var cell0 = row.insertCell(0);
			var cell1 = row.insertCell(1);
			var cell2 = row.insertCell(2);
			
			cell0.className = 'col-lg-5 col-md-5 col-sm-5 col-xs-5';
			cell1.className = 'col-lg-5 col-md-5 col-sm-5 col-xs-5';
			cell2.className = 'col-lg-2 col-md-2 col-sm-2 col-xs-2';
			
			cell0.innerHTML = authorName;
			cell1.innerHTML = authorSurname;
			cell2.innerHTML = '<button type="button" class="btn btn-xs btn-danger btn-block" onclick="deleteAuthorRow(this)">Delete</button>';
					
			checkAuthorTableChanges();
		} else {
			document.getElementById('authorMessage').innerHTML = 'You can add maximum 5 authors';
		}
	} else {
		document.getElementById('authorMessage').innerHTML = 'You should enter a valid name and a surname.<br> Allow characters: (A-Z a-z А-Я а-я)';
	}
}
			
function deleteGenreRow(row){
	var d = row.parentNode.parentNode.rowIndex;
    document.getElementById('genresTable').deleteRow(d);
    checkGenreTableChanges();
}

function deleteAuthorRow(row){
	var d = row.parentNode.parentNode.rowIndex;
    document.getElementById('authorsTable').deleteRow(d);
    checkAuthorTableChanges();
}
			
function checkGenreTableChanges(){
	var table = document.getElementById('genresTable');
	var genres = document.getElementById('genres');
	var list = [];
				
	for (var r = 1; r < table.rows.length; r++) {
		list.push(table.rows[r].cells[0].innerHTML);
	}

	genres.value = list;
	
	canSave();
}

function checkAuthorTableChanges(){
	var table = document.getElementById('authorsTable');
	var authors = document.getElementById('authors');
	var list = [];
	var nameAndSurname;
				
	for (var r = 1; r < table.rows.length; r++) {
		nameAndSurname = table.rows[r].cells[0].innerHTML + '/' + table.rows[r].cells[1].innerHTML;
		list.push(nameAndSurname);
	}

	authors.value = list;
		
	canSave();
}

function canSave(){
	var authorsTable = document.getElementById('authorsTable').rows;
	var genresTable = document.getElementById('genresTable').rows;
	var title = document.getElementById('title').value;
	var price = document.getElementById('price').value;
	var description = document.getElementById('description').value;
	var regex = /^[А-Яа-яA-Za-z0-9., _]+$/;
	var flag = true;
	
	if(title.trim().length > 0 && regex.test(title)){
		document.getElementById('titleMessage').innerHTML = '';
	} else {
		document.getElementById('titleMessage').innerHTML = 'You should enter a valid title.<br> Allow characters: (A-Z a-z А-Я а-я . ,)';
		flag = false;
	}
	
	if(price){
		document.getElementById('priceMessage').innerHTML = '';
	} else {
		document.getElementById('priceMessage').innerHTML = 'You should enter a price';
		flag = false;
	}
	
	if(description.length > 0){
		document.getElementById('descriptionMessage').innerHTML = '';
	} else {
		document.getElementById('descriptionMessage').innerHTML = 'You should enter a description';
		flag = false;
	}
	
	if (authorsTable.length > 1){
		document.getElementById('authorMessage').innerHTML = '';
	} else {
		document.getElementById('authorMessage').innerHTML = 'You should add at least 1 author';
		flag = false;
	}
	
	if (genresTable.length > 1){
		document.getElementById('genreMessage').innerHTML = '';
	} else {
		document.getElementById('genreMessage').innerHTML = 'You should add at least 1 genre';
		flag = false;
	}
	
	if(flag)
		document.getElementById('saveButton').setAttribute('type', 'submit');
	else
		document.getElementById('saveButton').setAttribute('type', 'button');
	
	return flag;
}

function saveBook(){
	if(canSave())
		document.getElementById('saveForm').submit();
}

function cancel(){
	document.getElementById('cancelForm').submit();
}