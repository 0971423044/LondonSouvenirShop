package com.londonsouvenir.datn.service.impl;

import com.londonsouvenir.datn.entity.*;
import com.londonsouvenir.datn.exception.BadRequestException;
import com.londonsouvenir.datn.exception.InternalServerException;
import com.londonsouvenir.datn.exception.NotFoundException;
import com.londonsouvenir.datn.model.dto.OrderDetailDto;
import com.londonsouvenir.datn.model.dto.OrderInfoDto;
import com.londonsouvenir.datn.model.request.CreateOrderReq;
import com.londonsouvenir.datn.model.request.UpdateDetailOrderReq;
import com.londonsouvenir.datn.model.request.UpdateStatusOrderReq;
import com.londonsouvenir.datn.repository.FinanceRepository;
import com.londonsouvenir.datn.repository.OrderRepository;
import com.londonsouvenir.datn.repository.ProductRepository;
import com.londonsouvenir.datn.repository.ProductSizeRepository;
import com.londonsouvenir.datn.service.OrderService;
import com.londonsouvenir.datn.service.PromotionService;
import com.londonsouvenir.datn.config.Constant;
import com.londonsouvenir.datn.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Component
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductSizeRepository productSizeRepository;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private FinanceRepository financeRepository;

    @Override
    public Order createOrder(CreateOrderReq req, long userId) {
        Order order = new Order();

        // Check product and size
        Optional<Product> product = productRepository.findById(req.getProductId());
        if (product.isEmpty()) {
            throw new NotFoundException("S???n ph???m kh??ng t???n t???i");
        }
        ProductSize productSize = productSizeRepository.checkProductSizeAvailable(req.getProductId(), req.getSize());
        if (productSize == null) {
            throw new BadRequestException("Size gi??y cho s???n ph???m n??y t???m h???t. Vui l??ng ch???n s???n ph???m kh??c");
        }
        if (product.get().getPrice() != req.getProductPrice()) {
            throw new BadRequestException("Gi?? s???n ph???m ???? thay ?????i. Vui l??ng ki???m tra v?? ?????t l???i ????n h??ng");
        }

        // Check promotion
        if (req.getCouponCode() != "") {
            Promotion promotion = promotionService.checkPromotion(req.getCouponCode());
            if (promotion == null) {
                throw new NotFoundException("M?? khuy???n m??i kh??ng t???n t???i ho???c ch??a ???????c k??ch ho???t");
            }
            Timestamp now = new Timestamp(System.currentTimeMillis());
            if (promotion.getExpiredAt().before(now)) {
                throw new BadRequestException("M?? khuy???n m??i h???t h???n");
            }
            long promotionPrice = promotionService.calculatePromotionPrice(req.getProductPrice(), promotion);
            if (promotionPrice != req.getTotalPrice()) {
                throw new BadRequestException("T???ng gi?? tr??? ????n h??ng thay ?????i. Vui l??ng ki???m tra v?? ?????t l???i ????n h??ng");
            }
            Order.UsedPromotion usedPromotion = new Order.UsedPromotion(req.getCouponCode(), promotion.getDiscountType(), promotion.getDiscountValue(), promotion.getMaximumDiscountValue());
            order.setPromotion(usedPromotion);
        }

        // Create order
        order.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        User createdBy = new User(userId);
        order.setCreatedBy(createdBy);

        order.setReceiverAddress(req.getReceiverAddress());
        order.setReceiverName(req.getReceiverName());
        order.setReceiverPhone(req.getReceiverPhone());
        order.setNote(req.getNote());
        order.setBuyer(createdBy);
        order.setProduct(product.get());
        order.setSize(req.getSize());
        order.setProductPrice(req.getProductPrice());
        order.setTotalPrice(req.getTotalPrice());
        order.setStatus(Constant.ORDER_STATUS);

        orderRepository.save(order);

        return order;
    }

    @Override
    public List<OrderInfoDto> getListOrderOfPersonByStatus(int status, long userId) {
        List<OrderInfoDto> list = orderRepository.getListOrderOfPersonByStatus(status, userId);

        for (OrderInfoDto order : list) {
            for (int i = 0; i< Constant.SIZE_VN.size(); i++) {
                if (Constant.SIZE_VN.get(i) == order.getSizeVn()) {
                    order.setSizeUs(Constant.SIZE_US[i]);
                    order.setSizeCm(Constant.SIZE_CM[i]);
                }
            }
        }

        return list;
    }

    @Override
    public OrderDetailDto userGetDetailById(long id, long userId) {
        OrderDetailDto order = orderRepository.userGetDetailById(id, userId);
        if (order == null) {
            return null;
        }

        if (order.getStatus() == Constant.ORDER_STATUS) {
            order.setStatusText("Ch??? l???y h??ng");
        } else if (order.getStatus() == Constant.DELIVERY_STATUS) {
            order.setStatusText("??ang giao h??ng");
        } else if (order.getStatus() == Constant.COMPLETE_STATUS) {
            order.setStatusText("???? giao h??ng");
        } else if (order.getStatus() == Constant.CANCELED_STATUS) {
            order.setStatusText("???? h???y");
        } else if (order.getStatus() == Constant.RETURNED_STATUS) {
            order.setStatusText("???? tr??? h??ng");
        }

        for (int i = 0; i< Constant.SIZE_VN.size(); i++) {
            if (Constant.SIZE_VN.get(i) == order.getSizeVn()) {
                order.setSizeUs(Constant.SIZE_US[i]);
                order.setSizeCm(Constant.SIZE_CM[i]);
            }
        }

        return order;
    }

    @Override
    public void userCancelOrder(long id, long userId) {
        Optional<Order> rs = orderRepository.findById(id);
        if (rs.isEmpty()) {
            throw new NotFoundException("????n h??ng kh??ng t???n t???i");
        }
        Order order = rs.get();
        if (order.getBuyer().getId() != userId) {
            throw new BadRequestException("B???n kh??ng ph???i ch??? nh??n ????n h??ng");
        }
        if (order.getStatus() != Constant.ORDER_STATUS) {
            throw new BadRequestException("Tr???ng th??i ????n h??ng kh??ng ph?? h???p ????? h???y. Vui l??ng li??n h??? v???i shop ????? ???????c h??? tr???");
        }

        order.setStatus(Constant.CANCELED_STATUS);
        orderRepository.save(order);
    }

    @Override
    public Page<Order> adminGetListOrder(String id, String name, String phone, String status, String product, int page) {
        page--;
        if (page < 0) {
            page = 0;
        }

        if (id.isEmpty()) {
            id = "%%";
        }
        if (status.isEmpty()) {
            status = "%%";
        }

        if (product.isEmpty()) {
            product = "%%";
        }

        Page<Order> rs = orderRepository.adminGetListOrder(id, name, phone, status, product, PageRequest.of(page, 10, Sort.by("created_at").descending()));

        return rs;
    }

    @Override
    public Order getOrderById(long id) {
        // Check order exist
        Optional<Order> result = orderRepository.findById(id);
        if (result.isEmpty()) {
            throw new NotFoundException("????n h??ng kh??ng t???n t???i");
        }

        return result.get();
    }

    @Override
    public void updateDetailOrder(UpdateDetailOrderReq req, long id, long userId) {
        // Check order exist
        Optional<Order> rs = orderRepository.findById(id);
        if (rs.isEmpty()) {
            throw new NotFoundException("????n h??ng kh??ng t???n t???i");
        }
        Order order = rs.get();

        // Check order status
        if (order.getStatus() != Constant.ORDER_STATUS) {
            throw new BadRequestException("Ch??? c?? th??? c???p nh???t chi ti???t ????n h??ng ??? tr???ng ch??? l???y h??ng");
        }

        // Check product and size
        Optional<Product> product = productRepository.findById(req.getProductId());
        if (product.isEmpty()) {
            throw new NotFoundException("S???n ph???m kh??ng t???n t???i");
        }
        ProductSize productSize = productSizeRepository.checkProductSizeAvailable(req.getProductId(), req.getSize());
        if (productSize == null) {
            throw new BadRequestException("Size gi??y cho s???n ph???m n??y t???m h???t. Vui l??ng ch???n s???n ph???m kh??c");
        }
        if (product.get().getPrice() != req.getProductPrice()) {
            throw new BadRequestException("Gi?? s???n ph???m ???? thay ?????i. Vui l??ng ki???m tra v?? ?????t l???i ????n h??ng");
        }

        // Check promotion
        if (req.getCouponCode() != "") {
            Promotion promotion = promotionService.checkPromotion(req.getCouponCode());
            if (promotion == null) {
                throw new NotFoundException("M?? khuy???n m??i kh??ng t???n t???i ho???c ch??a ???????c k??ch ho???t");
            }
            long promotionPrice = promotionService.calculatePromotionPrice(req.getProductPrice(), promotion);
            if (promotionPrice != req.getTotalPrice()) {
                throw new BadRequestException("T???ng gi?? tr??? ????n h??ng thay ?????i. Vui l??ng ki???m tra v?? ?????t l???i ????n h??ng");
            }
            Order.UsedPromotion usedPromotion = new Order.UsedPromotion(req.getCouponCode(), promotion.getDiscountType(), promotion.getDiscountValue(), promotion.getMaximumDiscountValue());
            order.setPromotion(usedPromotion);
        }

        // Update detail order
        order.setModifiedAt(new Timestamp(System.currentTimeMillis()));

        User modifiedBy = new User();
        modifiedBy.setId(userId);
        order.setModifiedBy(modifiedBy);

        order.setProduct(product.get());
        order.setSize(req.getSize());
        order.setProductPrice(req.getProductPrice());
        order.setTotalPrice(req.getTotalPrice());

        try {
            orderRepository.save(order);
        } catch (Exception ex) {
            throw new InternalServerException("L???i khi c???p nh???t chi ti???t ????n h??ng");
        }
    }

    @Override
    @Transactional
    public void updateStatusOrder(UpdateStatusOrderReq req, long id, long userId) {
        // Check order exist
        Optional<Order> rs = orderRepository.findById(id);
        if (rs.isEmpty()) {
            throw new NotFoundException("????n h??ng kh??ng t???n t???i");
        }
        Order order = rs.get();

        // Validate status of order
        boolean statusIsValid = false;
        for (Integer status : Constant.LIST_ORDER_STATUS) {
            if (status == req.getStatus()) {
                statusIsValid = true;
                break;
            }
        }
        if (!statusIsValid) {
            throw new BadRequestException("Tr???ng th??i ????n h??ng kh??ng h???p l???");
        }

        User modifiedBy = new User();
        modifiedBy.setId(userId);

        System.out.println(order.getStatus());
        System.out.println(req.getStatus());

        if (order.getStatus() == Constant.ORDER_STATUS) {
            // ????n h??ng c?? ??? tr???ng th??i ch??? giao h??ng
            if (req.getStatus() == Constant.ORDER_STATUS) {
                order.setReceiverPhone(req.getReceiverPhone());
                order.setReceiverName(req.getReceiverName());
                order.setReceiverAddress(req.getReceiverAddress());
            } else if (req.getStatus() == Constant.DELIVERY_STATUS) {
                // TODO: Minus 1 product
                productSizeRepository.minusOneProductBySize(order.getProduct().getId(), order.getSize());
            } else if (req.getStatus() == Constant.COMPLETE_STATUS) {
                // TODO: Minus 1 product, Plus money
                productSizeRepository.minusOneProductBySize(order.getProduct().getId(), order.getSize());
                updateRevenue(modifiedBy, order.getTotalPrice(), order);
            } else if (req.getStatus() != Constant.CANCELED_STATUS) {
                throw new BadRequestException("Kh??ng th??? chuy???n ????n h??ng sang tr???ng th??i n??y");
            }
        } else if (order.getStatus() == Constant.DELIVERY_STATUS) {
            // ????n h??ng c?? ??? tr???ng th??i ??ang giao h??ng
            if (req.getStatus() == Constant.COMPLETE_STATUS) {
                // TODO: Plus money
                updateRevenue(modifiedBy, order.getTotalPrice(), order);
            } else if (req.getStatus() == Constant.RETURNED_STATUS) {
                // TODO: Plus 1 product
                productSizeRepository.plusOneProductBySize(order.getProduct().getId(), order.getSize());
            } else if (req.getStatus() == Constant.CANCELED_STATUS) {

            } else if (req.getStatus() != Constant.DELIVERY_STATUS) {
                throw new BadRequestException("Kh??ng th??? chuy???n ????n h??ng sang tr???ng th??i n??y");
            }
        } else if (order.getStatus() == Constant.COMPLETE_STATUS) {
            // ????n h??ng c?? ??? tr???ng th??i ???? giao h??ng
            if (req.getStatus() == Constant.RETURNED_STATUS) {
                // TODO: Plus 1 product, Minus money
                productSizeRepository.plusOneProductBySize(order.getProduct().getId(), order.getSize());
                updateRevenue(modifiedBy, -order.getTotalPrice(), order);
            } else if (req.getStatus() != Constant.COMPLETE_STATUS) {
                throw new BadRequestException("Kh??ng th??? chuy???n ????n h??ng sang tr???ng th??i n??y");
            }
        } else {
            // ????n h??ng c?? ??? tr???ng th??i ???? h???y ho???c ???? tr??? h??ng
            if (order.getStatus() != req.getStatus()) {
                throw new BadRequestException("Kh??ng th??? chuy???n ????n h??ng sang tr???ng th??i n??y");
            }
        }

        order.setModifiedAt(new Timestamp(System.currentTimeMillis()));
        order.setModifiedBy(modifiedBy);
        order.setNote(req.getNote());
        order.setStatus(req.getStatus());

        try {
            orderRepository.save(order);
        } catch (Exception ex) {
            throw new InternalServerException("L???i khi c???p nh???t ????n h??ng");
        }
    }

    public void updateRevenue(User createdBy, long amount, Order order) {
        Finance finance = new Finance();
        finance.setAmount(amount);
        finance.setOrder(order);
        finance.setCreatedBy(createdBy);
        finance.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        financeRepository.save(finance);
    }
}