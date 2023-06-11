package com.kosta.dorang.controller;

import java.util.List;

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
            tripList = mainServiceI.selectBestTripList();
            model.addAttribute("place",tripList);

            mateList = mainServiceI.selectHotMateList();
            model.addAttribute("mateA",mateList);

            long user_code =  (long) session.getAttribute("user");
            mateList = mainServiceI.selectMyMateList(user_code);
            model.addAttribute("mateB",mateList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main";
    }
	
	@RequestMapping(value = "/getSession", method=RequestMethod.POST)
	@ResponseBody
	public long getSession() {
		System.out.println("메인 컨트롤러에 들어오기 성공");
		long user_code=(long) session.getAttribute("user");
		System.out.println("getSession : "+user_code);
		return user_code;
		
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
