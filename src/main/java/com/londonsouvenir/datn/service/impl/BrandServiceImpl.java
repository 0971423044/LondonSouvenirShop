package com.londonsouvenir.datn.service.impl;

import com.londonsouvenir.datn.entity.Brand;
import com.londonsouvenir.datn.exception.BadRequestException;
import com.londonsouvenir.datn.exception.InternalServerException;
import com.londonsouvenir.datn.exception.NotFoundException;
import com.londonsouvenir.datn.model.dto.BrandInfo;
import com.londonsouvenir.datn.model.request.CreateBrandReq;
import com.londonsouvenir.datn.repository.BrandRepository;
import com.londonsouvenir.datn.repository.ProductRepository;
import com.londonsouvenir.datn.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Optional;

@Component
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandRepository brandRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Brand> getListBrand() {
        return brandRepository.findAll();
    }

    @Override
    public List<BrandInfo> getListBrandAndProductCount() {
        return brandRepository.getListBrandAndProductCount();
    }

    @Override
    public Brand createBrand(CreateBrandReq req) {
        Brand brand = new Brand();
        brand.setName(req.getName());
        brand.setThumbnail(req.getThumbnail());

        brandRepository.save(brand);

        return brand;
    }

    @Override
    public void updateBrand(int id, CreateBrandReq req) {
        // Check brand exist
        Optional<Brand> rs = brandRepository.findById(id);
        if (rs.isEmpty()) {
            throw new NotFoundException("Nhãn hiệu không tồn tại");
        }

        Brand brand = rs.get();
        brand.setName(req.getName());
        brand.setThumbnail(req.getThumbnail());

        try {
            brandRepository.save(brand);
        } catch (Exception ex) {
            throw new InternalServerException("Lỗi khi chỉnh sửa nhãn hiệu");
        }
    }

    @Override
    public void deleteBrand(int id) {
        // Check category exist
        Optional<Brand> rs = brandRepository.findById(id);
        if (rs.isEmpty()) {
            throw new NotFoundException("Nhãn hiệu không tồn tại");
        }

        // Check product in brand
        int count = productRepository.countByBrandId(id);
        if (count > 0) {
            throw new BadRequestException("Có sản phẩm thuộc nhãn hiệu không thể xóa");
        }

        Brand brand = rs.get();

        try {
            brandRepository.delete(brand);
        } catch (Exception ex) {
            throw new InternalServerException("Lỗi khi xóa nhãn hiệu");
        }
    }
}
