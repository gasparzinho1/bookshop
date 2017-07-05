package com.shop.service.impl;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Author;
import com.shop.entity.Book;
import com.shop.entity.Genre;
import com.shop.repository.BookRepository;
import com.shop.service.BookService;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    @Override
    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    @Override
    public Book getBookById(long bookId) {
        return bookRepository.findOne(bookId);
    }

    @Override
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    @Override
    public void deleteBook(long bookId) {
        bookRepository.delete(bookId);
    }

    @Override
    public Set<Genre> getGenres(long bookId) {
        return bookRepository.findOne(bookId).getGenres();
    }

    @Override
    public Set<Author> getAuthors(long bookId) {
        return bookRepository.findOne(bookId).getAuthors();
    }
}