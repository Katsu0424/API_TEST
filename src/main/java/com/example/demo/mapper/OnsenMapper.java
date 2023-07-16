package com.example.demo.mapper;

import com.example.demo.entity.Onsen;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OnsenMapper {
    Onsen selectOnsen(String onsenName);
}
