package com.kjh.travelBoard.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TravelPlaceMark {
	private int travelPlaceNo;
	private int boardNo;
	private String travelPlaceName;
	private String travelPlaceAddress;
	private double latitude;
	private double longitude;
}
