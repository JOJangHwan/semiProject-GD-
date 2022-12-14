package com.psh.moveline.model.vo;

import java.sql.Date;
import java.util.List;

import com.psh.marker.model.vo.Marker;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MoveLine {
	private int movelineNo;
	private int userNo;
	private Date tripdateStart;
	private Date tripdateFinish;
	private String movelineName;
	private char openandclosed;
	private Date movelineEnroll;
//	private List<Marker> mList;
}
