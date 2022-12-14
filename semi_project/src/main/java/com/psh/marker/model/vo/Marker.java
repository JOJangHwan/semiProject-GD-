package com.psh.marker.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Marker {
	private int markerNo;
	private int movelineNo;
	private String longgitude;
	private String latitude;
	private String address;
	private String memo;
	private String movelineDay;
	private String placeName;
	private int price;
	private String markerTime;
}
