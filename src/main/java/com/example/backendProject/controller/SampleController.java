package com.example.backendProject.controller;

import com.example.backendProject.dto.SampleDTO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class SampleController {
    @GetMapping
    public SampleDTO hello() {
        SampleDTO sample = new SampleDTO();
        sample.setId(100);
        sample.setName("taro");

        System.out.println("チェック");
        System.out.println(sample);
        return sample;
    }
}
