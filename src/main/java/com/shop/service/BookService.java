package com.shop.service;

import java.util.List;
import java.util.Set;

import com.shop.entity.Author;
import com.shop.entity.Book;
import com.shop.entity.Genre;

public interface BookService {
    Book saveBook(Book book);

    Book getBookById(long bookId);

    List<Book> getAllBooks();

    void deleteBook(long bookId);

    Set<Genre> getGenres(long bookId);

    Set<Author> getAuthors(long bookId);
}