function fillGenreEditForm(genreId, name){
	document.getElementById('genreId').value = genreId;
	document.getElementById('genreName').value = name;
}

function createGenre(){
	document.getElementById('genreId').value = 0;
	var name = document.getElementById('genreName').value;
	var regex = /^[А-Яа-яA-Za-z0-9 _]*$/;
	
	if(name.trim().length == 0){
		document.getElementById('messageLabel').innerHTML = 'You should set a genre name';
	} else if(!regex.test(name)) {
		document.getElementById('messageLabel').innerHTML = 'You should enter a valid genre name.<br> Allow characters: (A-Z a-z А-Я а-я 0-9)';
	} else {
		document.getElementById('messageLabel').innerHTML = '';
		document.getElementById('genreEditForm').action = '/admin/genres/create-genre';
		document.getElementById('genreEditForm').submit();
	}
}

function updateGenre() {
	var genreId = document.getElementById('genreId').value;
	var name = document.getElementById('genreName').value;
	var regex = /^[А-Яа-яA-Za-z0-9 _]*$/;
	
	if(name.trim().length == 0){
		document.getElementById('messageLabel').innerHTML = 'You should set a genre name';
	} else if(!regex.test(name)) {
		document.getElementById('messageLabel').innerHTML = 'You should enter a valid genre name.<br> Allow characters: (A-Z a-z А-Я а-я 0-9)';
	} else if(genreId != 0){
		document.getElementById('messageLabel').innerHTML = '';
		document.getElementById('genreEditForm').action = '/admin/genres/update-genre';
		document.getElementById('genreEditForm').submit();
	} else {
		document.getElementById('messageLabel').innerHTML = 'You should save a genre';
	}
}