package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entity.Genre;

public interface GenreRepository extends JpaRepository<Genre, Long> {
    Genre findByNameIgnoreCase(String name);
}