package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {}