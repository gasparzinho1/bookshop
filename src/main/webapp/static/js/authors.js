function fillAuthorEditForm(authorId, name, surname){
	document.getElementById('authorId').value = authorId;
	document.getElementById('authorName').value = name;
	document.getElementById('authorSurname').value = surname;
}

function createAuthor(){
	document.getElementById('authorId').value = 0;
	var name = document.getElementById('authorName').value;
	var surname = document.getElementById('authorSurname').value;
	var regex = /^[А-Яа-яA-Za-z _]*$/;
	
	if(name.trim().length == 0 || surname.trim().length == 0){
		document.getElementById('messageLabel').innerHTML = 'You should set a name and a surname';
	} else if(!regex.test(name) || !regex.test(surname)) {
		document.getElementById('messageLabel').innerHTML = 'You should enter a valid name and a surname.<br> Allow characters: (A-Z a-z А-Я а-я)';
	} else {
		document.getElementById('messageLabel').innerHTML = '';
		document.getElementById('authorEditForm').action = '/admin/authors/create-author';
		document.getElementById('authorEditForm').submit();
	} 
}

function updateAuthor() {
	var authorId = document.getElementById('authorId').value;
	var name = document.getElementById('authorName').value;
	var surname = document.getElementById('authorSurname').value;
	var regex = /^[А-Яа-яA-Za-z _]*$/;
	
	if(name.trim().length == 0 || surname.trim().length == 0){
		document.getElementById('messageLabel').innerHTML = 'You should set a name and a surname';
	} else if(!regex.test(name) || !regex.test(surname)) {
		document.getElementById('messageLabel').innerHTML = 'You should enter a valid name and a surname.<br> Allow characters: (A-Z a-z А-Я а-я)';
	} else if(authorId != 0){
		document.getElementById('messageLabel').innerHTML = '';
		document.getElementById('authorEditForm').action = '/admin/authors/update-author';
		document.getElementById('authorEditForm').submit();
	} else {
		document.getElementById('messageLabel').innerHTML = 'You should save an author';
	}
}