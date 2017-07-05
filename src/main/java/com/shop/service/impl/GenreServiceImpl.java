package com.shop.service.impl;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Book;
import com.shop.entity.Genre;
import com.shop.repository.GenreRepository;
import com.shop.service.GenreService;

@Service
@Transactional
public class GenreServiceImpl implements GenreService {

    @Autowired
    private GenreRepository genreRepositry;

    @Override
    public Genre createGenre(Genre genre) {
        List<Genre> genres = genreRepositry.findAll();

        if (genres.contains(genre))
            return null;

        return genreRepositry.save(genre);
    }

    @Override
    public Genre getGenreById(long genreId) {
        return genreRepositry.findOne(genreId);
    }

    @Override
    public Genre getGenreByName(String genreName) {
        return genreRepositry.findByNameIgnoreCase(genreName);
    }

    @Override
    public List<Genre> getAllGenres() {
        return genreRepositry.findAll();
    }

    @Override
    public void updateGenre(long genreId, String genreName) {
        Genre genre = genreRepositry.findOne(genreId);
        genre.setName(genreName);
        genreRepositry.save(genre);
    }

    @Override
    public void deleteGenre(long genreId) {
        genreRepositry.delete(genreId);
    }

    @Override
    public Set<Book> getBooks(String genreName) {
        Genre genre = genreRepositry.findByNameIgnoreCase(genreName);

        if (genre == null)
            return null;

        return genre.getBooks();
    }
}