package com.londonsouvenir.datn.model.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PageableDto {
    private Object items;

    private int totalPages;

    private int currentPage;
}
