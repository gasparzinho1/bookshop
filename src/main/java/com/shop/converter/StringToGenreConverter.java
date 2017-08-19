package com.shop.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.shop.entity.Genre;
import com.shop.repository.GenreRepository;

@Component
public class StringToGenreConverter implements Converter<String, Genre> {

    @Autowired
    private GenreRepository genreRepositry;

    @Override
    public Genre convert(String genreName) {
        Genre genre = genreRepositry.findByNameIgnoreCase(genreName);

        if (genre == null) {
            genre = new Genre(genreName);
            genreRepositry.save(genre);
        }

        return genre;
    }
}