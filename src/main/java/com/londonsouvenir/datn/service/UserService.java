package com.londonsouvenir.datn.service;

import com.londonsouvenir.datn.entity.User;
import com.londonsouvenir.datn.model.request.ChangePasswordReq;
import com.londonsouvenir.datn.model.request.CreateUserReq;
import com.londonsouvenir.datn.model.request.UpdateProfileReq;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    public User createUser(CreateUserReq req);

    public void changePassword(User user, ChangePasswordReq req);

    public User updateProfile(User user, UpdateProfileReq req);
    public User getCurrentlyLoggedInUser(Authentication authentication);

}
