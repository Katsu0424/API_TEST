package com.example.demo.service;

import com.example.demo.entity.Onsen;
import com.example.demo.mapper.OnsenMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class OnsenService {

    private final OnsenMapper onsenMapper;

    public Onsen selectOnsen(String onsenName){
        return onsenMapper.selectOnsen(onsenName);
    }

}
