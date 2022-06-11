package com.londonsouvenir.datn.service;

import com.londonsouvenir.datn.entity.Brand;
import com.londonsouvenir.datn.model.dto.BrandInfo;
import com.londonsouvenir.datn.model.request.CreateBrandReq;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface BrandService {
    public List<Brand> getListBrand();

    public List<BrandInfo> getListBrandAndProductCount();

    public Brand createBrand(CreateBrandReq req);

    public void updateBrand(int id, CreateBrandReq req);

    public void deleteBrand(int id);
}
