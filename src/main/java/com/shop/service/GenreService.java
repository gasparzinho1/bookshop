package com.shop.service;

import java.util.List;
import java.util.Set;

import com.shop.entity.Book;
import com.shop.entity.Genre;

public interface GenreService {
    /**
     * Create new genre in a database
     * 
     * @param genre
     * @return created genre or null if the genre is already exists
     */
    Genre createGenre(Genre genre);

    Genre getGenreById(long genreId);

    Genre getGenreByName(String genreName);

    List<Genre> getAllGenres();

    void updateGenre(long genreId, String genreName);

    void deleteGenre(long genreId);

    /**
     * 
     * @param genreName
     * @return books which has the genreName or null if the genreName wasn't
     *         found in a database
     */
    Set<Book> getBooks(String genreName);
}