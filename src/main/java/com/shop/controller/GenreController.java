package com.shop.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Book;
import com.shop.entity.Genre;
import com.shop.service.GenreService;

@Controller
public class GenreController {

    @Autowired
    private GenreService genreService;

    @GetMapping("/genre/get-books")
    public String getBooksForGenre(@RequestParam String genreName, @RequestParam String viewName,
            Model model) {
        Set<Book> books = genreService.getBooks(genreName);

        if (books == null)
            model.addAttribute("genreMessage", "There is no such genre " + genreName);
        else
            model.addAttribute("books", books);

        return viewName;
    }

    @GetMapping("/admin/genres")
    public String getAllGenres(Model model) {
        model.addAttribute("genres", genreService.getAllGenres());
        return "genresAdmin";
    }

    @PostMapping("/admin/genres/create-genre")
    public String createGenre(Genre genre, Model model) {
        Genre createdGenre = genreService.createGenre(genre);

        if (createdGenre == null) {
            model.addAttribute("message", "Genre " + genre.getName()
                    + " is already exists in a database");
        }

        model.addAttribute("genres", genreService.getAllGenres());
        return "genresAdmin";
    }

    @PostMapping("/admin/genres/update-genre")
    public String updateGenre(@RequestParam long genreId, @RequestParam String name, Model model) {
        genreService.updateGenre(genreId, name);
        model.addAttribute("genres", genreService.getAllGenres());
        return "genresAdmin";
    }

    @PostMapping("/admin/genres/delete-genre")
    public String deleteGenre(@RequestParam long genreId, Model model) {
        genreService.deleteGenre(genreId);
        model.addAttribute("genres", genreService.getAllGenres());
        return "genresAdmin";
    }
}