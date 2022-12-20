package com.psh.marker.model.vo;

import java.sql.Date;

import com.psh.moveline.model.vo.MoveLine;
import com.psh.movelineboard.model.vo.MoveLineBoard;

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
	private double longgitude;
	private double latitude;
	private String address;
	private String memo;
	private String movelineDay;
	private String placeName;
	private int price;
	private String markerTime;
	private MoveLineBoard mlb;
	private MoveLine ml;
	
}
