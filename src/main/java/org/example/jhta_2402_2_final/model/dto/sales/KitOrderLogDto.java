package org.example.jhta_2402_2_final.model.dto.sales;

import lombok.Data;

import java.util.UUID;

@Data
public class KitOrderLogDto {
    private UUID kitOrderLogId;
    private String kitOrderId;
    private String userId;
}
