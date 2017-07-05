package com.shop.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Author;
import com.shop.entity.Book;
import com.shop.service.AuthorService;

@Controller
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping("/author/get-books")
    public String getBooksForAuthor(@RequestParam String authorName,
            @RequestParam String authorSurname, @RequestParam String viewName, Model model) {
        Set<Book> books = authorService.getAuthorsBooks(authorName, authorSurname);

        if (books == null) {
            model.addAttribute("authorMessage", "Author " + authorName + " " + authorSurname
                    + " wasn't found");
        } else
            model.addAttribute("books", books);

        return viewName;
    }

    @GetMapping("/admin/authors")
    public String getAllAuthors(Model model) {
        model.addAttribute("authors", authorService.getAllAuthors());
        return "authorsAdmin";
    }

    @PostMapping("/admin/authors/create-author")
    public String createAuthor(Author author, Model model) {
        Author createdAuthor = authorService.createAuthor(author);

        if (createdAuthor == null) {
            model.addAttribute("message", "Author " + author.getName() + " " + author.getSurname()
                    + " is already exists in a database");
        }

        model.addAttribute("authors", authorService.getAllAuthors());
        return "authorsAdmin";
    }

    @PostMapping("/admin/authors/update-author")
    public String updateAuthor(@RequestParam long authorId, @RequestParam String name,
            @RequestParam String surname, Model model) {
        authorService.updateAuthor(authorId, name, surname);
        model.addAttribute("authors", authorService.getAllAuthors());
        return "authorsAdmin";
    }

    @PostMapping("/admin/authors/delete-author")
    public String deleteAuthor(@RequestParam long authorId, Model model) {
        authorService.deleteAuthor(authorId);
        model.addAttribute("authors", authorService.getAllAuthors());
        return "authorsAdmin";
    }
}