package com.londonsouvenir.datn.service;

import com.londonsouvenir.datn.entity.Image;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface ImageService {
    public void save(Image img);

    public List<String> getListImageOfUser(long userId);

    public void deleteImage(String uploadDir, String filename);
}
