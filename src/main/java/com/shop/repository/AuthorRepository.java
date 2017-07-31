package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entity.Author;

public interface AuthorRepository extends JpaRepository<Author, Long> {
    Author findByNameAndSurnameIgnoreCase(String name, String surname);
}