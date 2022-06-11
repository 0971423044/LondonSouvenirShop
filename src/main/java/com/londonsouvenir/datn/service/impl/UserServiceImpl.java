package com.londonsouvenir.datn.service.impl;

import com.londonsouvenir.datn.entity.User;
import com.londonsouvenir.datn.exception.BadRequestException;
import com.londonsouvenir.datn.exception.DuplicateRecordException;
import com.londonsouvenir.datn.model.mapper.UserMapper;
import com.londonsouvenir.datn.model.request.ChangePasswordReq;
import com.londonsouvenir.datn.model.request.CreateUserReq;
import com.londonsouvenir.datn.model.request.UpdateProfileReq;
import com.londonsouvenir.datn.repository.UserRepository;
import com.londonsouvenir.datn.security.CustomUserDetails;
import com.londonsouvenir.datn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Component;

@Component
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User createUser(CreateUserReq req) {
        // Check email exist
        User user = userRepository.findByEmail(req.getEmail());
        if (user != null) {
            throw new DuplicateRecordException("Email đã tồn tại trong hệ thống. Vui lòng sử dụng email khác.");
        }

        user = UserMapper.toUser(req);
        userRepository.save(user);

        return user;
    }

    @Override
    public void changePassword(User user, ChangePasswordReq req) {
        // Validate password
        if (!BCrypt.checkpw(req.getOldPassword(), user.getPassword())) {
            throw new BadRequestException("Mật khẩu cũ không chính xác");
        }

        String hash = BCrypt.hashpw(req.getNewPassword(), BCrypt.gensalt(12));
        user.setPassword(hash);
        userRepository.save(user);
    }

    @Override
    public User updateProfile(User user, UpdateProfileReq req) {
        user.setAddress(req.getAddress());
        user.setPhone(req.getPhone());
        user.setFullName(req.getFullName());

        return userRepository.save(user);
    }

    @Override
    public User getCurrentlyLoggedInUser(Authentication authentication) {
        if(authentication==null)
            return null;
        User user = null;
        Object principal = authentication.getPrincipal();
        if( principal instanceof CustomUserDetails)
        {
            user = ((CustomUserDetails) principal).getUser();
        }
        return user;
    }
}
