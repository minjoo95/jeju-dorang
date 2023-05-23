package com.kosta.dorang.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Trip {
	private Integer trip_id; 
	private String place_id; 	//여행지 아이디 : contentsid
	private String category; 	//테마 : contentscd.value  ex)c1 
	private String theme;		//contentscd.label ex)관광지
	private String title; 	 	//장소명 : title
	private String region_code;	//지역코드1 : region1cd.label
	private String city_code;	//지역코드2 : region2cd.label
	private String address;		//도로명주소 : roadaddress
	private String postcode;	//우편번호 : postcode
	private String tel; 		//전화번호 : phoneno
	private String hashtag; 	//태그 : tag, split(",")
	private String introduction;//설명 : introduction
	private String thumbnail; 	//썸네일url : repPhoto.photoid.thumbnailpath
	private String image;		//메인사진url : repPhoto.photoid.imgpath
	private Double latitude;	//위도 : latitude
	private Double longitude;	//경도 : longitude
	private String info;		//기타 정보 : alltag, split(",")
	private Integer like_count = 0; //북마크 수 : Bookmark table join 
	
	//constructor
	public Trip() {
	}

	public Trip(String place_id, String category, String theme, String title, String region_code, String city_code,
			String address, String postcode, String tel, String hashtag, String introduction, String thumbnail,
			String image, Double latitude, Double longitude, String info) {
		this.place_id = place_id;
		this.category = category;
		this.theme = theme;
		this.title = title;
		this.region_code = region_code;
		this.city_code = city_code;
		this.address = address;
		this.postcode = postcode;
		this.tel = tel;
		this.hashtag = hashtag;
		this.introduction = introduction;
		this.thumbnail = thumbnail;
		this.image = image;
		this.latitude = latitude;
		this.longitude = longitude;
		this.info = info;
	}

	@Override
	public String toString() {
		return "Trip [place_id=" + place_id + ", category=" + category + ", theme=" + theme + ", title=" + title
				+ ", region_code=" + region_code + ", city_code=" + city_code + ", address=" + address + ", postcode="
				+ postcode + ", tel=" + tel + ", hashtag=" + hashtag + ", introduction=" + introduction + ", thumbnail="
				+ thumbnail + ", image=" + image + ", latitude=" + latitude + ", longitude=" + longitude + ", info="
				+ info + ", bookmark_like=" + like_count + "]";
	}
	
	

	
	
	
	
	
	
}
