package com.londonsouvenir.datn.service;

import com.londonsouvenir.datn.entity.Order;
import com.londonsouvenir.datn.model.dto.OrderDetailDto;
import com.londonsouvenir.datn.model.dto.OrderInfoDto;
import com.londonsouvenir.datn.model.request.CreateOrderReq;
import com.londonsouvenir.datn.model.request.UpdateDetailOrderReq;
import com.londonsouvenir.datn.model.request.UpdateStatusOrderReq;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface OrderService {
    public Order createOrder(CreateOrderReq req, long userId);

    public List<OrderInfoDto> getListOrderOfPersonByStatus(int status, long userId);

    public OrderDetailDto userGetDetailById(long id, long userId);

    public void userCancelOrder(long id, long userId);

    public Page<Order> adminGetListOrder(String id, String name, String phone, String status, String product, int page);

    public Order getOrderById(long id);

    public void updateDetailOrder(UpdateDetailOrderReq req, long id, long userId);

    public void updateStatusOrder(UpdateStatusOrderReq req, long id, long userId);
}
