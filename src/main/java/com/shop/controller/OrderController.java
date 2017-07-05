package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.shop.entity.Order;
import com.shop.service.OrderService;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/save-order")
    public String saveOrder(Order order, Model model) {
        orderService.saveOrder(order);
        return "bookInfo";
    }
}