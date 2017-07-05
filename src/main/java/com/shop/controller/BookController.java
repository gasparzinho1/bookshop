package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Book;
import com.shop.service.BookService;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping(value = { "/", "/books", "/admin/books" })
    public String getAllBooks(@RequestParam(defaultValue = "books") String viewName, Model model) {
        model.addAttribute("books", bookService.getAllBooks());
        return viewName;
    }

    @GetMapping(value = { "/book-info", "/admin/books/book-info" })
    public String getBookInfo(@RequestParam long bookId, @RequestParam String viewName,
            Model model) {
        model.addAttribute("book", bookService.getBookById(bookId));
        return viewName;
    }

    @PostMapping("/admin/books/save-book")
    public String saveBook(Book book, Model model) {
        bookService.saveBook(book);
        model.addAttribute("books", bookService.getAllBooks());
        return "booksAdmin";
    }

    @PostMapping("/admin/books/delete-book")
    public String deleteBook(@RequestParam int bookId, Model model) {
        bookService.deleteBook(bookId);
        model.addAttribute("books", bookService.getAllBooks());
        return "booksAdmin";
    }
}