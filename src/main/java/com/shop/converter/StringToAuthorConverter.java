package com.shop.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.shop.entity.Author;
import com.shop.repository.AuthorRepository;

@Component
public class StringToAuthorConverter implements Converter<String, Author> {

    @Autowired
    private AuthorRepository authorRepositry;

    @Override
    public Author convert(String authorName) {
        String name = authorName.split("/")[0];
        String surname = authorName.split("/")[1];

        Author author = authorRepositry.findByNameAndSurnameIgnoreCase(name, surname);

        if (author == null) {
            author = new Author(name, surname);
            authorRepositry.save(author);
        }

        return author;
    }
}