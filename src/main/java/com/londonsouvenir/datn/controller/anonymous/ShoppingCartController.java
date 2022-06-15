package com.londonsouvenir.datn.controller.anonymous;

import com.londonsouvenir.datn.entity.CartItem;
import com.londonsouvenir.datn.entity.Product;
import com.londonsouvenir.datn.exception.NotFoundException;
import com.londonsouvenir.datn.repository.CartItemRepository;
import com.londonsouvenir.datn.repository.ProductRepository;
import com.londonsouvenir.datn.service.ProductService;
import com.londonsouvenir.datn.service.impl.ShoppingCartService;
import com.londonsouvenir.datn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class ShoppingCartController {
    @Autowired
    private ShoppingCartService cartService;

    @Autowired
    private UserService userService;
    @Autowired
    CartItemRepository cartRepo;
    @Autowired
    ProductRepository proRepo;
    @Autowired
    ProductService productService;

    @GetMapping("/shopping-cart/{id}")
    public String showShoppingCart(Model model, @PathVariable String id ) {
        Product product;
        try {
            product = productService.getProductById(id);
        } catch (NotFoundException ex) {
            return "error/404";
        } catch (Exception ex) {
            return "error/500";
        }
//        User user  = userService.getCurrentlyLoggedInUser(authentication);
        List<CartItem> cartItems = cartRepo.findByProduct(product);

        if (cartItems != null) {
            for (CartItem c : cartItems) {
                if (c.getProduct().equals(product) ) {
                    c.setQuantity(c.getQuantity() + 1);
                    cartRepo.save(c);
                }
            }
        } else {
           CartItem cartItem = new CartItem();

            cartItem.setQuantity(1);
            cartRepo.save(cartItem);
        }

//        List<CartItem> cartItems = cartService.listCartItems(user);

        model.addAttribute("cartItems", cartRepo.findAll());
        model.addAttribute("pageTitle", " Shopping Cart");
        return "shop/shopping_cart";
    }
}
