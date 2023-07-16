package com.example.demo;

import com.example.demo.entity.Onsen;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class BackendProjectApplicationTests {

	// APIを発行するためのMockオブジェクトを生成
	@Autowired
	private MockMvc mockMvc;

	@Test
	void contextLoads() throws Exception{
		// 結果を検証するためのクラスを生成して、期待値をセット
		List<Onsen> onsenList = new ArrayList<>();
		onsenList.add(Onsen.builder()
						   .onsenName("北海道温泉1")
						   .visitedAt(null)
						   .type("露天風呂")
						   .areaName("北海道")
						   .prefecturesName("北海道")
						   .build()
		);

		// 「/onsen/{onsenName}」パスのAPIを実行してレスポンスを検証
		String result = mockMvc.perform(get("/onsen/北海道温泉1"))
							   .andExpect(status().isOk())
							   .andReturn()
							   .getResponse()
							   .getContentAsString(StandardCharsets.UTF_8);

		// JavaのObjectをJSONに変換するためのクラスを生成
		ObjectMapper objectMapper = new ObjectMapper();
		Onsen actual = objectMapper.readValue(result, Onsen.class);

		assertEquals(onsenList.get(0), actual);
	}

}
