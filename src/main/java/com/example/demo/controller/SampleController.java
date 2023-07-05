package com.example.demo.controller;

import com.example.demo.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class SampleController {

    private final TestService testService;

    @RequestMapping("/hello")
    public String hello() {
//        SampleDTO sample = new SampleDTO();
//        sample.setId(100);
//        sample.setName("jiro");

        List<String> typeList = testService.selectTypeList();
        System.out.println(typeList);

        return "";
    }
}
