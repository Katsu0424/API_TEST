package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Onsen {

    private String onsenName;

    private LocalDate visitedAt;

    private String type;

    private String areaName;

    private String prefecturesName;
}
