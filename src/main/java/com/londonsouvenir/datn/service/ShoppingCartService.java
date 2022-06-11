package com.londonsouvenir.datn.service;

import com.londonsouvenir.datn.entity.CartItem;
import com.londonsouvenir.datn.entity.User;
import com.londonsouvenir.datn.repository.CartItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingCartService {
    @Autowired
    private CartItemRepository cartRepo;
    public List<CartItem> listCartItems(User user)
    {
        return cartRepo.findByUser(user);
    }

}
