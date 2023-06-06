package com.kosta.dorang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.Console;
import java.io.File;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;
import com.kosta.dorang.dto.MateCriteria;
import com.kosta.dorang.dto.MatePageMaker;
import com.kosta.dorang.dto.User;
import com.kosta.dorang.service.MateService;
import com.kosta.dorang.service.MateServiceI;



@Controller
@RequestMapping("/mate")
public class MateController {

	@Autowired
	MateService mateService;
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value = "/writelist", method = RequestMethod.GET)
	public String mateMyPage(Model m, @RequestParam(defaultValue = "1") int page) throws Exception {
		
		
		long user_code =  (long) session.getAttribute("user");
	   
		System.out.print(user_code);
		
	    MateCriteria cri = new MateCriteria();
	    cri.setPage(page);
	    cri.setPerPageNum(6);
	   
	    
	 	System.out.println(user_code);
	    try {
	    	List<Mate> mateWriteList = mateService.getmyMateWriteList(user_code,cri);
	    	m.addAttribute("mateWriteList", mateWriteList);

		} catch (Exception e) {
			e.printStackTrace();
		}
	    MatePageMaker pm = new MatePageMaker();
	 	pm.setCri(cri);
	 	pm.setTotalCount(mateService.totalCount());
	 	m.addAttribute("pm", pm);

	    return "/mate/mateMypage";
	}

	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String mateList(Model m, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "sortByDate") String sortBy) throws Exception {
		MateCriteria cri = new MateCriteria();
		cri.setPage(page);
		cri.setPerPageNum(9);
		cri.setSortBy(sortBy);
	    
	    MatePageMaker pm = new MatePageMaker();
	    pm.setCri(cri);
	    pm.setTotalCount(mateService.totalCount());
	   
	    m.addAttribute("pm",pm);

	    
	    return "/mate/mateList";
	}
	
	
	@RequestMapping(value = "/listSort", method = RequestMethod.GET)
	@ResponseBody
	public List<Mate> listSort(Model m, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "sortByDate") String sortBy) {
	    
		MateCriteria cri = new MateCriteria();
		cri.setPage(page);
		cri.setPerPageNum(9);
		cri.setSortBy(sortBy);

		try {
			 List<Mate>  matelistSortBy = mateService.getMateListViewSort(cri);
			 m.addAttribute("mateList", matelistSortBy); 
			 MatePageMaker pm = new MatePageMaker();
			 pm.setCri(cri);
			 pm.setTotalCount(mateService.totalCount());
			   
			 m.addAttribute("pm",pm);
			 
	        return matelistSortBy;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	
	
	
	

	@RequestMapping(value = "/writeform")
	public String Writeform() {
		return "/mate/mateWriteForm";
	}


	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String select(Model m,@RequestParam("mate_code") int mate_code,@ModelAttribute("cri") MateCriteria cri) {
		Mate mt = null;
		try {
		   mt = mateService.selectMate(mate_code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("mt",mt);
			
		return "/mate/mateDetail";
	}
	
	
	@RequestMapping(value="/mateCommunity",method = RequestMethod.GET)
    public String mateCommunity(Model m,@RequestParam("mate_code") int mate_code,@ModelAttribute("cri") MateCriteria cri) {
		
		Mate mt = null;
		try {
		   mt = mateService.selectMate(mate_code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("mt",mt);
		
		return "/mate/myMateCommunity";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model m,@RequestParam("mate_code") int mate_code,@ModelAttribute("cri") MateCriteria cri) {
		Mate mt = null;
		try {
			   mt = mateService.selectMate(mate_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
			m.addAttribute("mt",mt);
		
		return "/mate/mateUpdateForm";
	}
	
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@RequestParam("image") MultipartFile multi, HttpServletRequest request) throws Exception {
	   
		
		
		String directory = null;
	    directory = request.getSession().getServletContext().getRealPath("resources/upload/mate/");
	    String fileName = multi.getOriginalFilename();
	    int lastIndex = fileName.lastIndexOf(".");
	    String ext = "";
	    if (lastIndex >= 0 && lastIndex < fileName.length() - 1) {
	        ext = fileName.substring(lastIndex + 1);
	    }
		String newFileName = LocalDate.now() + "_" + System.currentTimeMillis() + ext;
	    
		System.out.print(directory);
	    try {
	        
	        File imageFile = new File(directory + newFileName);
	        
	        multi.transferTo(imageFile);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    long user_code = Long.parseLong(request.getParameter("user_code"));
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    String type = request.getParameter("type");
	    String direction = request.getParameter("direction");
	    String number = request.getParameter("number");
	    String age = request.getParameter("age");
	    String gender = request.getParameter("gender");
	    String daterange = request.getParameter("daterange");
	    String tags = request.getParameter("tags");
	    String status = request.getParameter("status");
	    String first_ask = request.getParameter("first_ask");
	    String second_ask = request.getParameter("second_ask");
	    String third_ask = request.getParameter("third_ask");
	    String image =  newFileName;

	    Mate m = new Mate(user_code, title, content, type, direction, number, age, gender, daterange, tags, status, image, first_ask, second_ask, third_ask, null);

	    mateService.insertMate(m); // mate 테이블에 저장

	    return "redirect:/mate/list";
	}
	
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateMate(@RequestParam("image") MultipartFile multi, HttpServletRequest request, MateCriteria cri,RedirectAttributes rttr) throws Exception {

	    String directory = null;
	    directory = request.getSession().getServletContext().getRealPath("resources/upload/mate/");
	    String fileName = multi.getOriginalFilename();
	    int lastIndex = fileName.lastIndexOf(".");
	    String ext = "";
	    if (lastIndex >= 0 && lastIndex < fileName.length() - 1) {
	        ext = fileName.substring(lastIndex + 1);
	    }
		String newFileName = LocalDate.now() + "_" + System.currentTimeMillis() + ext;

	    try {
	        File imageFile = new File(directory + newFileName);
	        multi.transferTo(imageFile);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Exception occurred while processing multipart request");
	    }

	    int mate_code = Integer.parseInt(request.getParameter("mate_code"));
	    long user_code = Long.parseLong(request.getParameter("user_code"));
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    String type = request.getParameter("type");
	    String direction = request.getParameter("direction");
	    String number = request.getParameter("number");
	    String age = request.getParameter("age");
	    String gender = request.getParameter("gender");
	    String daterange = request.getParameter("daterange");
	    String tags = request.getParameter("tags");
	    String status = request.getParameter("status");
	    String first_ask = request.getParameter("first_ask");
	    String second_ask = request.getParameter("second_ask");
	    String third_ask = request.getParameter("third_ask");
	    String image = null;

	    if (!multi.isEmpty()) {
	        String oldImage = mateService.selectMate(mate_code).getImage();
	        File oldImageFile = new File(directory + oldImage);
	        if (oldImageFile.exists()) {
	            oldImageFile.delete();
	        }
	     image = newFileName;
	        
	    } else {
	        // 파일이 선택되지 않은 경우 기존 이미지 유지
	        Mate originMate = mateService.selectMate(mate_code);
	        if (originMate != null) {
	            image = originMate.getImage();
	        }
	    }

	    Mate m = new Mate(mate_code, title, content, type, direction, number, age, gender, daterange, tags, status, image, first_ask, second_ask, third_ask);
	    mateService.updateMate(m);
	    rttr.addAttribute("page",cri.getPage());
	    rttr.addAttribute("perPageNum",cri.getPerPageNum());

	    return "redirect:/mate/list";
	}

	

	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public String applyMate(@RequestBody MateApply mp) throws Exception {
		
		
		int mate_code = mp.getMate_code();
        long user_code = mp.getUser_code();
	  
		   
	    try {
	        MateApply mpResult = mateService.selectMateApply(mate_code, user_code);
	        System.out.println(mpResult);

	        if (mpResult != null) { // 이미 신청된 게시글인 경우
	            return "already";
	        }else {
	        	 mateService.insertMateApply(mp);
	 	         return "success"; // 성공적으로 처리되었음을 알리는 응답 반환
	        }
	        

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error"; // 오류가 발생했음을 알리는 응답 반환
	    }
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteMate(@RequestParam("mate_code") int mate_code,MateCriteria cri,RedirectAttributes rttr) throws Exception {
		 mateService.deleteMate(mate_code);
		 
		 rttr.addAttribute("page",cri.getPage());
		 rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		 
		 return "redirect:/mate/list";
	}

	
	@RequestMapping(value = "/count", method = RequestMethod.POST)
	@ResponseBody
	public Mate updateMateCount(@RequestParam("mate_code") int mate_code) {
	    try {
	        mateService.mateCount(mate_code);
	        
	        Mate mt = mateService.selectMate(mate_code);
	        System.out.println(mt.getCount());
	       
	        return mt;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	

	// 응심이가 만든거 삭제 ㄴㄴ
	@RequestMapping(value="/mymatepage", method=RequestMethod.GET)
	public String mateReply(Model model){
		System.out.println("들어오기");
		return "/mate/mateCommunity";
	}
	
	
	
	
	
}
