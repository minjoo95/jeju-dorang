package com.kosta.dorang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Notice;
import com.kosta.dorang.dto.NoticeUser;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.dto.User;
import com.kosta.dorang.service.MainServiceI;

@Controller
public class MainController{

	@Autowired
	HttpSession session;
	
	@Autowired
	MainServiceI mainServiceI;
	

	@RequestMapping(value = "/", method=RequestMethod.GET)
    public String main(Model model) throws Exception{

        List<Trip> tripList=null;
        List<MateUser> mateList=null;

        try {
        	//BEST 여행
            tripList = mainServiceI.selectBestTripList();
            
            int[] tripIds = new int[3];
            String[] tripTitles = new String[3];
            for (int i = 0; i < tripList.size() && i < 3; i++) {
                Trip a = tripList.get(i);
                System.out.println(a.getTrip_id());
                System.out.println(a.getTitle());
               
                tripIds[i] = a.getTrip_id();
                tripTitles[i] = a.getTitle();
            }
            int trip_id1=tripIds[0];
            int trip_id2=tripIds[1];
            int trip_id3=tripIds[2];
            
            String trip_title1=tripTitles[0];
            String trip_title2=tripTitles[1];
            String trip_title3=tripTitles[2];
            
            Map<String, Object> tripID = new HashMap<>();
            tripID.put("trip_id1", trip_id1);
            tripID.put("trip_id2", trip_id2);
            tripID.put("trip_id3", trip_id3);
            model.addAttribute("tripID",tripID);
            
            Map<String, Object> tripTitle = new HashMap<>();
            tripTitle.put("trip_title1", trip_title1);
            tripTitle.put("trip_title2", trip_title2);
            tripTitle.put("trip_title3", trip_title3);
            model.addAttribute("tripTitle",tripTitle);

            //HOt동행
            mateList = mainServiceI.selectHotMateList();
            model.addAttribute("mateA",mateList);
            
            //MY 동행
            long user_code =  (long) session.getAttribute("user");
            mateList = mainServiceI.selectMyMateList(user_code);
            model.addAttribute("mateB",mateList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main2";
    }

	@RequestMapping(value="/notice",method=RequestMethod.POST)
	@ResponseBody
	public List<NoticeUser> selectNotice(@RequestParam int lastNtcCode) {
		System.out.println("알림 컨트롤러");
		List<NoticeUser> noticeList=null;
		//List<Notice> noticeList=null;
		long user_code =  (long) session.getAttribute("user");
		System.out.println(user_code);
		
		try {
			noticeList=mainServiceI.selectNoticeByUserCode(user_code,lastNtcCode);
			if(noticeList!=null) { 
				for(Notice a:noticeList) {
					System.out.println("noticeList : "+a.getNtc_code());
				}
			}else {
				System.out.println("새로운 데이터가 없습니다.");
			}
		        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}
	
	
		@RequestMapping(value="/deletenotice",method=RequestMethod.POST)
		@ResponseBody
		public void deleteNotice(@RequestParam int ntc_code) {
			System.out.println("알림 삭제 컨트롤러");
			System.out.println("ntc_code : "+ntc_code);
			
			try {
				mainServiceI.deleteNoticeByNtcCode(ntc_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
