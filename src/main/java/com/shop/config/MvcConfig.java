package com.shop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class MvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/404").setViewName("404");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/").setViewName("books");
        registry.addViewController("/books").setViewName("books");
        registry.addViewController("/error").setViewName("errorPage");
        registry.addViewController("/bookInfo").setViewName("bookInfo");
        registry.addViewController("/admin/books").setViewName("booksAdmin");
        registry.addViewController("/admin/createBook").setViewName("createBookAdmin");
        registry.addViewController("/admin/genres").setViewName("genresAdmin");
        registry.addViewController("/admin/authors").setViewName("authorsAdmin");
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
}