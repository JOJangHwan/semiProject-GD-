package com.kjh.admin.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TravelPick {
	private String userId;
	private int boardNo;
}
