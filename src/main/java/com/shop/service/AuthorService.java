package com.shop.service;

import java.util.List;
import java.util.Set;

import com.shop.entity.Author;
import com.shop.entity.Book;

public interface AuthorService {
    /**
     * Create new author in a database
     * 
     * @param author
     * @return created author or null if the author is already exists
     */
    Author createAuthor(Author author);

    Author getAuthorById(long authorId);

    Author getAuthorByNameAndSurname(String name, String surname);

    List<Author> getAllAuthors();

    void updateAuthor(long authorId, String name, String surname);

    void deleteAuthor(long authorId);

    /**
     * 
     * @param name
     * @param surname
     * @return author's books or null if the author was not found
     * 
     */
    Set<Book> getAuthorsBooks(String name, String surname);
}