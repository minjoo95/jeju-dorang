package com.kosta.dorang.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.net.HttpURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.dorang.dto.Trip;

@Controller
public class TripController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	/**
	 * 여행지 정보 DB 저장 (1회 호출)
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/api/data/all", method=RequestMethod.GET)
	public String callApiWithJson(Model model) {
		String serviceKey = "3lzfym8rxc69s4ak";
		//c1 = 관광지, c2 = 쇼핑, c3 = 숙박, c4 = 음식점, c5 = 축제/행사, c6 = 테마여행, c7 = 정보
		//String categoryUrl = "";
		//첫 페이지
		Integer currentPage = 1;
		Integer lastPage = 29;
		String cid = "";
		Integer count = 0;
		
		try {
			while(currentPage <= lastPage) {
				System.out.println(">>>>> 현재 페이지 :" + currentPage);
				StringBuilder urlBuilder = new StringBuilder("http://api.visitjeju.net/vsjApi/contents/searchList");
				urlBuilder.append("?" + URLEncoder.encode("apiKey", "UTF-8") + "=" + serviceKey);
				urlBuilder.append("&" + URLEncoder.encode("locale", "UTF-8") + "=kr");
				urlBuilder.append("&" + URLEncoder.encode("category", "UTF-8") + "=" + "c1");
				urlBuilder.append("&" + URLEncoder.encode("category", "UTF-8") + "=" + "c2");
				//urlBuilder.append("&" + URLEncoder.encode("category", "UTF-8") + "=" + "c3");
				urlBuilder.append("&" + URLEncoder.encode("category", "UTF-8") + "=" + "c4");
				//urlBuilder.append("&" + URLEncoder.encode("category", "UTF-8") + "=" + "c6");
				urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "=" + currentPage);
				urlBuilder.append("&" + URLEncoder.encode("cid", "UTF-8") + "=" + cid);
				
				URL url = new URL(urlBuilder.toString());
				//System.out.println(url);
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				urlConnection.setRequestMethod("GET");
				urlConnection.setRequestProperty("Content-type", "application/json");
				System.out.println(">>> Response code: " + urlConnection.getResponseCode());
				
				BufferedReader br;
				if(urlConnection.getResponseCode() >= 200 && urlConnection.getResponseCode() <= 300) {
					br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(urlConnection.getErrorStream()));
				}
				
				StringBuilder result = new StringBuilder();
				String line;
				while((line = br.readLine()) != null) {
					result.append(line);
				}
				
				br.close();
				urlConnection.disconnect();
				
				JSONParser parser = new JSONParser();
				JSONObject data = (JSONObject)parser.parse(result.toString());
				//System.out.println(">>> data");
				Long pageCount = (Long) data.get("pageCount");
				//아이템 목록(배열)
				JSONArray items = (JSONArray) data.get("items");
				System.out.println(">>> items ");
				//System.out.println(items);
				//System.out.println(items.size()); //100

				
				//page당 반복문
				List<Trip> pageList = new ArrayList<>();
				for (int i=0; i<items.size(); i++) {
					JSONObject item = (JSONObject) items.get(i);
					String id = (String) item.get("contentsid");

					JSONObject themeArray = (JSONObject) item.get("contentscd");
					String category = (String) themeArray.get("value");
					String theme = (String) themeArray.get("label");
					
					String title = (String) item.get("title");
					
					JSONObject regionArr1 = (JSONObject) item.get("region1cd");
					String region_code = (String) regionArr1.get("label");
					JSONObject regionArr2 = (JSONObject) item.get("region2cd");
					String city_code = (String) regionArr2.get("label");
					
					String address = (String) item.get("roadaddress");
					String postcode = (String) item.get("postcode");
					String tel = (String) item.get("phoneno");
					String hashtag = (String) item.get("tag");
					String introduction = (String) item.get("introduction");
					Double latitude = (Double) item.get("latitude");
					Double longitude = (Double) item.get("longitude");
					String info = (String) item.get("alltag");
					
					JSONObject picArr1 = (JSONObject) item.get("repPhoto");
					JSONObject picArr2 = (JSONObject) picArr1.get("photoid");
					String thumbnail = (String) picArr2.get("thumbnailpath");
					String image = (String) picArr2.get("imgpath");
					
					Trip place = new Trip(id, category, theme, title, region_code, city_code, address, postcode, tel, hashtag, introduction, thumbnail, image, latitude, longitude, info);
					sqlSession.insert("TripMapper.insertPlace", place);
					System.out.println(place);
					pageList.add(place);
					count++;
				}//for문
				currentPage++;
				
			}//while문
			System.out.println(">>> 페이지 로딩 완료");
			System.out.println(">>> 데이터 갯수 :"+count);
			model.addAttribute("result", "데이터 저장 완료");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
}
