package com.londonsouvenir.datn.service;

import com.londonsouvenir.datn.entity.Category;
import com.londonsouvenir.datn.model.dto.CategoryInfo;
import com.londonsouvenir.datn.model.request.CreateCategoryReq;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface CategoryService {
    public List<Category> getListCategory();

    public List<CategoryInfo> getListCategoryAndProductCount();

    public Category createCategory(CreateCategoryReq req);

    public void updateCategory(int id, CreateCategoryReq req);

    public void deleteCategory(int id);
}
