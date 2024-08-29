package org.example.jhta_2402_2_final.service;

import lombok.RequiredArgsConstructor;
import org.example.jhta_2402_2_final.dao.ProductDao;
import org.example.jhta_2402_2_final.dao.distribution.DistributionDao;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductDao productDao;


    public List<Map<String, Object>> findAll(){
        return productDao.findAll();
    }
}
