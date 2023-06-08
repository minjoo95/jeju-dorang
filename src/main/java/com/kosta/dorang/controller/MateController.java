package com.kosta.dorang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import java.net.http.HttpRequest;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;
import com.kosta.dorang.dto.MateComments;
import com.kosta.dorang.dto.MateCommentsUser;
import com.kosta.dorang.dto.MateCriteria;
import com.kosta.dorang.dto.MatePageMaker;
import com.kosta.dorang.dto.User;
import com.kosta.dorang.service.MateService;
import com.kosta.dorang.service.MateServiceI;



@Controller
@RequestMapping("/mate")
public class MateController {

	@Autowired
	MateServiceI mateServiceI;
	@Autowired
	MateService mateService;
	@Autowired
	HttpSession session;
	
	

	///
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
	public Map<String, Object> listSort(Model m, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "sortByDate") String sortBy) {
	    
		MateCriteria cri = new MateCriteria();
		cri.setPage(page);
		cri.setPerPageNum(9);
		cri.setSortBy(sortBy);

		try {
			 List<Mate>  matelistSortBy = mateService.getMateListViewSort(cri);
			 MatePageMaker pm = new MatePageMaker();
			 pm.setCri(cri);
			 pm.setTotalCount(mateService.totalCount());
			 
			 Map<String, Object> response = new HashMap<>();
			 response.put("mateList", matelistSortBy); 
			 response.put("pm",pm);
			 
	        return response;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
/////
	@RequestMapping(value = "/writelist", method = RequestMethod.GET)
	public String mateMyPage(Model m, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "getmyMateWriteList") String sortBy) throws Exception {
		
		long user_code =  (long) session.getAttribute("user");
	    MateCriteria cri = new MateCriteria();
	    cri.setPage(page);
	    cri.setPerPageNum(6);
	    cri.setSortBy(sortBy);
	   
	   
	    MatePageMaker pm = new MatePageMaker();
	 	pm.setCri(cri);
	 	pm.setTotalCount(mateService.totalmyCount(user_code,cri));
	 	m.addAttribute("pm", pm);

	    return "/mate/mateMypage";
	}
	
	@RequestMapping(value = "/myPageListSort", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myPageListSort(Model m, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") int endPage,
			@RequestParam(defaultValue = "getmyMateWriteList") String sortBy) {
	    
		long user_code =  (long) session.getAttribute("user");
		   
		MateCriteria cri = new MateCriteria();
		cri.setPage(page);
		cri.setPerPageNum(6);
		cri.setSortBy(sortBy);
		

		try {
			 List<Mate> myPageListSortby = mateService.getmyMateListViewSort(user_code,cri);
			 MatePageMaker pm = new MatePageMaker();
			 pm.setCri(cri);
			 pm.setTotalCount(mateService.totalmyCount(user_code,cri));
			 
			 Map<String, Object> response = new HashMap<>();
			 response.put("myPageListSortby", myPageListSortby);	 
			 response.put("pm",pm);
			
			 System.out.println(pm.getCri().getPage());
			
			 
	        return response;
	        
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
		List<MateCommentsUser> mateCommentsUser=null;
		try {
		   mt = mateService.selectMate(mate_code);
		   mateCommentsUser=mateServiceI.selectMateReplyListByMateCode(mate_code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("mt",mt);
		m.addAttribute("mate_code",mate_code);
		m.addAttribute("mateReplyList", mateCommentsUser);
		return "/mate/myMateCommunity";
	}
	
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model m,@RequestParam("mate_code") int mate_code,@ModelAttribute("cri") MateCriteria cri,
			@RequestParam("backPageName") String backPageName) {
		Mate mt = null;
		
		try {
			   mt = mateService.selectMate(mate_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
			m.addAttribute("mt",mt);
			m.addAttribute("backPageName",backPageName);
		
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
	public String updateMate(@RequestParam("image") MultipartFile multi, HttpServletRequest request, MateCriteria cri,RedirectAttributes rttr,
			 @RequestParam("backPageName") String backPageName) throws Exception {

		
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
	        Mate originMate = mateService.selectMate(mate_code);
	        if (originMate != null) {
	            image = originMate.getImage();
	        }
	    }

	    Mate m = new Mate(mate_code, title, content, type, direction, number, age, gender, daterange, tags, status, image, first_ask, second_ask, third_ask);
	    mateService.updateMate(m);
	    rttr.addAttribute("page",cri.getPage());
	    rttr.addAttribute("sortBy",cri.getSortBy());
	    rttr.addAttribute("perPageNum",cri.getPerPageNum());
	    
	    if (backPageName.equals("myMateCommunity")) {
	        return "redirect:/mate/writelist";
	    } else {
	        return "redirect:/mate/list";
	    }

	}

	

	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public String applyMate(@RequestBody MateApply mp) throws Exception {
		
		
		int mate_code = mp.getMate_code();
        long user_code = mp.getUser_code();
	  
		   
	    try {
	        MateApply mpResult = mateService.selectMateApply(mate_code, user_code);
	       

	        if (mpResult != null) { 
	            return "already";
	        }else {
	        	 mateService.insertMateApply(mp);
	 	         return "success"; 
	        }
	        

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteMate(HttpServletRequest request ,MateCriteria cri,RedirectAttributes rttr, @RequestParam("backPageName") String backPageName) throws Exception {
		 
		//신청된 게시판이 잇으면 신청된 게시판 삭제처리 //댓글달린 게시판이면 댓글데이터 삭제후 게시판 삭제처리 
		 int mate_code = Integer.parseInt(request.getParameter("mate_code"));
		 
		 try {
			 MateApply mpResult =  mateService.selectApplyMateByMateCode(mate_code);
			 List<MateComments> MateCommList =  mateService.selectMateCommListByMateCode(mate_code);
			 if (mpResult != null) { 
		           mateService.deleteApplyMate(mate_code);
		        }
			 if(MateCommList!=null) {
				  mateService.deleteMateCommListByMateCode(mate_code);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 mateService.deleteMate(mate_code); 
		 rttr.addAttribute("page",cri.getPage());
		 rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		 if (backPageName.equals("myMateCommunity")) {
		        return "redirect:/mate/writelist";
		    } else {
		        return "redirect:/mate/list";
		    }
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
	

	//응심이 INSERT
	@RequestMapping(value="/mateReplyInsert", method=RequestMethod.POST)
	@ResponseBody
	public void mateReplyInsert(@RequestParam("mate_code") int mate_code,@RequestParam("mateReplyContent") String mateReplyContent) throws Exception{
		System.out.println("댓글 insert 컨트롤러 들어오기 성공");
//		User user=(User) session.getAttribute("userInfo");
		long user_code=(long) session.getAttribute("user");
		System.out.println("mate_code : "+mate_code);
		System.out.println("user_code : "+user_code);
		MateComments mateComments=new MateComments();
		mateComments.setContent(mateReplyContent);
		mateComments.setMate_code(mate_code);
		mateComments.setUser_code(user_code);
		System.out.println(mateComments.getContent());
		try {
			mateServiceI.insertMateReply(mateComments);
			System.out.println("insert 다음");
//			mateServiceI.selectMateReplyList(mate_code);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//응심이 SELECT
	@RequestMapping(value="/mateReplySelect", method=RequestMethod.GET)
	@ResponseBody
	public List<MateCommentsUser> mateReplySelect(@RequestParam("mate_code") int mate_code) throws Exception{
		System.out.println("댓글 select 컨트롤러 들어오기 성공");
//		User user=(User) session.getAttribute("userInfo");
		System.out.println("mate_code : "+mate_code);
//		MateComments mateComments=new MateComments();
//		mateComments.setContent(mateReplyContent);
//		mateComments.setMate_code(mate_code);
//		mateComments.setUser_code(user.getUser_code());
//		System.out.println(mateComments.getContent());
		List<MateCommentsUser> mateComments=null;
		try {
			mateComments=mateServiceI.selectMateReplyListByMateCode(mate_code);
			System.out.println("댓글 리스트 ---------------------------------");
			for(MateComments a:mateComments) {
				System.out.println(a.getContent());
			}
			System.out.println("--------------------------------------------");
		} catch (Exception e) {
			e.printStackTrace();
		}
//		if(mateComments!=null) {
//			Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
//			return gson.toJson(mateComments);
//		}else {
//			
//			return "";
//		}
		return mateComments;
	}
	
	
	//응심이 수정 댓글 하나 가져오기
		@RequestMapping(value="/onematereply", method=RequestMethod.GET)
		@ResponseBody
		public MateCommentsUser selectOneMateReply(@RequestParam("comment_code") int comment_code) throws Exception{
			System.out.println("댓글 select 컨트롤러 들어오기 성공");
			System.out.println("comment_code : "+comment_code);
			MateCommentsUser mateCommentUser=null;
			JSONObject jsonObj=new JSONObject();
			try {
				mateCommentUser=mateServiceI.selectOneMateReply(comment_code);
				System.out.println("reply content : "+mateCommentUser.getContent());
				System.out.println("select 성공");
				//jsonObj.put("content", mateCommentUser.getContent());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mateCommentUser;
		}
	
		//응심이 UPDATE
		@RequestMapping(value="/mateReplyUdate", method=RequestMethod.POST)
		@ResponseBody
		public void mateReplyUpdate(@RequestParam("comment_code") int comment_code, @RequestParam("content") String content) throws Exception{
			System.out.println("댓글 update 컨트롤러 들어오기 성공");
			System.out.println("comment_code : "+comment_code);
			System.out.println("content : "+content);
			MateComments mateComments=new MateComments();
			mateComments.setContent(content);
			mateComments.setComment_code(comment_code);
			try {
				mateServiceI.updateMateReply(mateComments);
				System.out.println("update 성공");
				System.out.println("update content : "+mateComments.getContent());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//응심이 DETETE
		@RequestMapping(value="/mateReplyDelete", method=RequestMethod.POST)
		@ResponseBody
		public void mateReplyDelete(@RequestParam("comment_code") int comment_code) throws Exception{
			System.out.println("댓글 delete 컨트롤러 들어오기 성공");
			System.out.println("comment_code : "+comment_code);
			try {
				mateServiceI.deleteMateReply(comment_code);
				System.out.println("delete 성공");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
}
