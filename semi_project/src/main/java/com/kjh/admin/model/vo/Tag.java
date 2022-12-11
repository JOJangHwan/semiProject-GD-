package com.kjh.admin.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Tag {
	private int tagNo;
	private String tagTitle;
}
