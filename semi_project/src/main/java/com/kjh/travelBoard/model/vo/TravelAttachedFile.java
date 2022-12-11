package com.kjh.travelBoard.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TravelAttachedFile {
	private int fileNo;
	private int boardNo;
	private String fileName;
}
