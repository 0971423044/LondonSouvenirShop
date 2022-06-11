package com.londonsouvenir.datn.repository;

import com.londonsouvenir.datn.entity.CartItem;
import com.londonsouvenir.datn.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository  extends JpaRepository<CartItem,Integer> {
  //  List<CartItem> listCartItems(User user);
//  @Query(nativeQuery = true, name = "findByUser")
   public List<CartItem> findByUser(User user);

}
