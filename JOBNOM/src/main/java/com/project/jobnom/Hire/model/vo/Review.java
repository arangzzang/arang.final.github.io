package com.project.jobnom.Hire.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int review_no;
	private int rec_no;
	private int ent_no;
	private int mem_no;
	private String review_title;
	private String review_contents;
	private String review_writer;
	private int review_satisfaction;
	private int review_welfare;
	private int review_promotion;
	private int review_executive;
	private Date re_enroll_date;
	
	private String rec_title;
	private String ent_name;
	private String mem_check;

}
