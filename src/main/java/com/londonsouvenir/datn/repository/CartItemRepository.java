package com.londonsouvenir.datn.repository;

import com.londonsouvenir.datn.entity.CartItem;
import com.londonsouvenir.datn.entity.Product;
import com.londonsouvenir.datn.model.dto.DetailProductInfoDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartItemRepository  extends JpaRepository<CartItem,Integer> {
  //  List<CartItem> listCartItems(User user);
//  @Query(nativeQuery = true, name = "findByUser")
   public List<CartItem> findByProduct(Product product);
   public List<CartItem> existsCartItemByProduct(Product product);


}
