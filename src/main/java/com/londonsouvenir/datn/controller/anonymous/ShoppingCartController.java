package com.londonsouvenir.datn.controller.anonymous;

import com.londonsouvenir.datn.entity.CartItem;
import com.londonsouvenir.datn.entity.User;
import com.londonsouvenir.datn.service.ShoppingCartService;
import com.londonsouvenir.datn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ShoppingCartController {
    @Autowired
    private ShoppingCartService cartService;

    @Autowired
    private UserService userService;

    @GetMapping("/shopping-cart")
    public String showShoppingCart(Model model, @AuthenticationPrincipal Authentication authentication)
    {
        User user  = userService.getCurrentlyLoggedInUser(authentication);
        List<CartItem> cartItems = cartService.listCartItems(user);

        model.addAttribute("cartItems",cartItems);
        model.addAttribute("pageTitle"," Shopping Cart");
        return "shop/shopping_cart";
    }
}
