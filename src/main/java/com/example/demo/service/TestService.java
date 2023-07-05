package com.example.demo.service;

import com.example.demo.mapper.TestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestService {

    private final TestMapper testMapper;

    public List<String> selectTypeList(){
        return testMapper.selectTypeList();
    }
}
