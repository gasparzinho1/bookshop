package com.shop.service.impl;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Author;
import com.shop.entity.Book;
import com.shop.repository.AuthorRepository;
import com.shop.service.AuthorService;

@Service
@Transactional
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    @Override
    public Author createAuthor(Author author) {
        List<Author> authors = authorRepository.findAll();

        if (authors.contains(author))
            return null;

        return authorRepository.save(author);
    }

    @Override
    public Author getAuthorById(long authorId) {
        return authorRepository.findOne(authorId);
    }

    @Override
    public Author getAuthorByNameAndSurname(String name, String surname) {
        return authorRepository.findByNameAndSurnameIgnoreCase(name, surname);
    }

    @Override
    public List<Author> getAllAuthors() {
        return authorRepository.findAll();
    }

    @Override
    public void updateAuthor(long authorId, String name, String surname) {
        Author author = authorRepository.findOne(authorId);
        author.setName(name);
        author.setSurname(surname);
        authorRepository.save(author);
    }

    @Override
    public void deleteAuthor(long authorId) {
        authorRepository.delete(authorId);
    }

    @Override
    public Set<Book> getAuthorsBooks(String name, String surname) {
        Author author = authorRepository.findByNameAndSurnameIgnoreCase(name, surname);

        if (author == null)
            return null;

        return author.getBooks();
    }
}