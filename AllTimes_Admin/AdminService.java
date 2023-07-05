package com.AllTimes.service;

import java.io.File;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.controller.AdminController;
import com.AllTimes.dao.AdminDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.CommentsDto;
import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.PagingDto;
import com.AllTimes.dto.ReporterDto;
import com.AllTimes.dto.homeInfoDto;
import com.AllTimes.paging.Criteria;

@Service
public class AdminService {

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	@Autowired
	private AdminDao AdminDao;

	@Autowired
	private AdminController AdminController;
	
	//File file = new File("");
	@Autowired
	private HttpServletRequest request;
	
	private String savePath
	= "C:\\Users\\vkfks\\eclipse-workspace\\2021\\AllTimes\\src\\main\\webapp\\resources\\upLoadedFile\\ReporterProfile";
	private String articleSavePath
	= "C:\\Users\\vkfks\\eclipse-workspace\\2021\\AllTimes\\src\\main\\webapp\\resources\\upLoadedFile\\ArticleFile";
	public ModelAndView Admin_Home() {
		System.out.println("AdminService.Admin_Home()");
		mav = new ModelAndView();
		homeInfoDto homeInfo = new homeInfoDto();
		
		int totalMember = AdminDao.getTotalAccountM();
		homeInfo.setCountM(totalMember);
		int totalReporter = AdminDao.getTotalAccountR();
		homeInfo.setCountR(totalReporter);
		
		mav.addObject("homeInfo", homeInfo);
		mav.setViewName("Admin/Admin_Home");
		session.setAttribute("activeEle", "adminHome");
		return mav;
	}
	
	/*---------회원 계정 관리 페이지 이동--------*/
	public ModelAndView Admin_MemberManagement(Criteria cri) {
		

		System.out.println("AdminService.Admin_MemberManagement()");
		mav = new ModelAndView();
		int totalAccount = AdminDao.getTotalAccountM();
		PagingDto paging = new PagingDto(cri, totalAccount);
		ArrayList<MemberDto> MemberList = AdminDao.MemberList(cri);
		
		System.out.println(MemberList);
		
		mav.addObject("paging", paging);
		mav.addObject("MemberList", MemberList);
		mav.setViewName("Admin/Admin_MemberManagementPage");
		session.setAttribute("activeEle", "memManagement");
		
		
		return mav;
	}

	/*---------회원 계정 수정 페이지 이동--------*/
	public ModelAndView Admin_MemberModifyPage(String mid) {
		System.out.println("AdminService.Admin_MemberModifyPage()");
		
		mav = new ModelAndView();
		MemberDto MemberInfo = AdminDao.MemberInfoSelect(mid);
		
		mav.addObject("MemberInfo",MemberInfo);
		mav.setViewName("Admin/Admin_MemberModifyPage");
		
		return mav;
	}
	/*---------회원 계정 수정--------*/
	public ModelAndView Admin_MemberModify(MemberDto memberInfo, RedirectAttributes ra) {
		System.out.println("AdminService.Admin_MemberModify()");
		int MemberModify = 0;
		String MemberPwState = memberInfo.getMpw();
		mav = new ModelAndView();
		if(MemberPwState=="") {
			String MemberPwGet = AdminDao.MemberPwGet(memberInfo.getMid());
			memberInfo.setMpw(MemberPwGet);
			System.out.println("mpw: "+MemberPwGet);
			System.out.println("비밀번호 변경되지 않음");
		}

			MemberModify = AdminDao.MemberModify(memberInfo);

		
		if(MemberModify > 0) {
			ra.addFlashAttribute("ModifyMsg", "회원 정보를 수정했습니다.");
		}else {
			ra.addFlashAttribute("ModifyMsg", "정보수정이 실패했습니다.");
		}
		
		
		mav.setViewName("redirect:/Admin_MemberManagement");
		
		return mav;
	}
	/*---------회원 연락처 중복 확인--------*/
	public String memberTelCheck(String inputContact) {
		
		System.out.println("AdminService.memberNameCheck()");
		String telCheckResult = "NO";
		
		String telCheck = AdminDao.memberTelCheck(inputContact);

		if(telCheck == null) {telCheckResult = "OK";	}
		
		return telCheckResult;
	}
	
	/*---------기자 계정 목록 페이지--------*/
	public ModelAndView Admin_ReporterManagement(Criteria cri) {
		System.out.println("AdminService.Admin_ReporterManagement");
		
		mav = new ModelAndView();

		int totalAccount = AdminDao.getTotalAccountR();
		PagingDto paging = new PagingDto(cri, totalAccount);
		ArrayList<ReporterDto> ReporterList = AdminDao.reporterList(cri);
		
		mav.addObject("ReporterList", ReporterList);

		mav.addObject("paging", paging);
		
		mav.setViewName("Admin/Admin_ReporterManagementPage");

		session.setAttribute("activeEle", "repManagement");
		return mav;
	}
	
	/*---------기자 계정 수정 페이지--------*/
	public ModelAndView Admin_ReporterModifyPage(String rid) {
		
		System.out.println("AdminService.Admin_ReporterModifyPage()");
		mav = new ModelAndView();
		
		
		ReporterDto ReporterInfo = AdminDao.ReporterInfo(rid);
		
		mav.addObject("ReporterInfo", ReporterInfo);
		mav.setViewName("Admin/Admin_ReporterModifyPage");
		
		return mav;
	}
	
	/*---------기자 계정 수정--------*/
	public ModelAndView Admin_ReporterModify(ReporterDto reporterInfo, RedirectAttributes ra){
		System.out.println("AdminService.Admin_ReporterModify()");
		
		
		mav = new ModelAndView();
		int ReporterModify = 0;
		String ReporterPwState = reporterInfo.getRpw();

		if(ReporterPwState=="") {
			String ReporterPwGet = AdminDao.ReporterPwGet(reporterInfo.getRid());
			reporterInfo.setRpw(ReporterPwGet);
			System.out.println("rpw: "+ReporterPwGet);
			System.out.println("비밀번호 변경되지 않음");
		}

		ReporterModify = AdminDao.ReporterModify(reporterInfo);
		if(ReporterModify > 0) {
			ra.addFlashAttribute("ModifyMsg", "기자 정보를 수정했습니다.");
		}else {
			ra.addFlashAttribute("ModifyMsg", "정보수정이 실패했습니다.");
		}
		
		
		mav.setViewName("redirect:/Admin_ReporterManagement");
		return mav;
	}
	
	/*---------기자 프로필 사진 변경--------*/
	public ModelAndView Admin_ReporterProfileChange(ReporterDto Reporter) {
		System.out.println("Admin_Service.Admin_ReporterProfileChange()");
		String rfilename = "";
		String dtoRid = Reporter.getRid();
		
		//변경 전 파일 선택
		String oldFileName = AdminDao.oldFileSelect(dtoRid);
		File oldFile = new File(savePath+"\\"+oldFileName);
			
		MultipartFile rfile = Reporter.getRfile();
	
		
		try {
			if(rfile.getOriginalFilename()=="") {
				rfilename = oldFileName;
			}else {
				if(!rfile.isEmpty()) {
					System.out.println("프로필 변경");
					UUID uuid = UUID.randomUUID();
					rfilename = uuid.toString()+"_"+rfile.getOriginalFilename();
					//변경전 파일 삭제
					rfile.transferTo(new File(savePath, rfilename));
					oldFile.delete();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Reporter.setRprofile(rfilename);
		int profileChange = AdminDao.profileChange(Reporter);
		
		mav.setViewName("redirect:/Admin_ReporterModifyPage?rid="+dtoRid);
		
		return mav;
	}
	
	/*---------기자 계정 삭제--------*/
	public ModelAndView Admin_ReporterDelete(String rid, RedirectAttributes ra) {
		System.out.println("AdminService.ReporterDelete()");
		mav = new ModelAndView();
		
		int reporterDelete = AdminDao.reporterDelete(rid);
		
		if(reporterDelete>0) {
			ra.addFlashAttribute("deleteMsg", "삭제를 완료했습니다.");
		}else {
			ra.addFlashAttribute("deleteMsg", "삭제를 실패했습니다.");
		}
		
		mav.setViewName("redirect:/Admin_ReporterManagement");
		
		return mav;
	}
	
	/*---------기자 글 작성 권한 변경--------*/
	public ModelAndView Admin_ReporterStateToggle(String rid, int rstate) {
		System.out.println("AdminService.ReporterStateToggle()");
		mav = new ModelAndView();
		
		int stateToggle = AdminDao.stateToggle(rid, rstate);
		
		mav.setViewName("redirect:/Admin_ReporterManagement");
		
		
		return mav;
	}
	
	/*---------기자 계정 추가--------*/
	public ModelAndView Admin_registReporter(ReporterDto reporterForm, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.Admin_ReporterJoin()");
		mav = new ModelAndView();
		
		
		MultipartFile rfile = reporterForm.getRfile();
		
		String rfilename = "";
		if(!rfile.isEmpty()) {
			System.out.println("프로필 등록");
			UUID uuid = UUID.randomUUID();
			rfilename = uuid.toString()+"_"+rfile.getOriginalFilename();
			
			rfile.transferTo(new File(savePath, rfilename));
		}
		reporterForm.setRprofile(rfilename);
		
		int ReporterJoin = AdminDao.registReporter(reporterForm);
		
		
		if(ReporterJoin>0) {
			System.out.println("기자계정 추가 성공");
			ra.addFlashAttribute("rJoinMsg", "기자계정 추가를 완료했습니다.");
		}else {
			System.out.println("기자계정 추가 실패");
			ra.addFlashAttribute("rJoinMsg", "계정 추가가 실패했습니다.");
		}
		mav.setViewName("redirect:/Admin_ReporterManagement");
		
		return mav;
	}
	
	/*---------기자 아이디 즁복 확인--------*/
	public String reporterIdCheck(String inputId) {
		System.out.println("AdminService.reporterIdCheck()");
		String idCheckResult = "NO";
		
		String idCheck = AdminDao.reporterIdCheck(inputId);

		if(idCheck == null) {idCheckResult = "OK";	}
		
		return idCheckResult;
	}
	
	
	/*---------기자  연락처 즁복 확인--------*/
	public String reporterTelCheck(String inputContact) {
		
		String telCheckResult = "NO";
		
		String telCheck = AdminDao.reporterTelCheck(inputContact);

		if(telCheck == null) {telCheckResult = "OK";	}
		
		return telCheckResult;
		
	}

	/*---------기자 계정 목록 검색--------*/
	public ModelAndView reporterSearch(String keyword, String searchType, Criteria cri) {
		System.out.println("AdminService.reporterSearch()");
		List<ReporterDto> searchResultList = new ArrayList<ReporterDto>();
		int searchAccount = AdminDao.getSearchAccountR(keyword);
		PagingDto paging = new PagingDto(cri, searchAccount);
		System.out.println("계졍수: "+searchAccount);
		if(keyword=="") {
			AdminController.Admin_ReporterManagement(cri);
		} else {
			System.out.println(searchType);
			if(searchType.equals("tId")){
				System.out.println("아이디검색");
				searchResultList = AdminDao.rSearchId(keyword, cri);
			}else if(searchType.equals("tName")){
				System.out.println("이름검색");
				searchResultList = AdminDao.rSearchName(keyword, cri);
			}else if(searchType.equals("tAll")){
				System.out.println("전체검색");
				searchResultList = AdminDao.rSearchAll(keyword, cri);
			}
			mav.addObject("keyword", keyword);
			mav.addObject("paging", paging);
			mav.addObject("searchResult", searchResultList);
			mav.setViewName("Admin/Admin_ReporterSearchResult");
		}

		return mav;
	}
	
	/*---------회원 계정 목록 검색--------*/
	public ModelAndView memberSearch(String keyword, String searchType, Criteria cri) {
		
		System.out.println("AdminService.memberSearch()");
		List<MemberDto> searchResultList = new ArrayList<MemberDto>();
		int searchAccount = AdminDao.getSearchAccountM(keyword);
		PagingDto paging = new PagingDto(cri, searchAccount);
		
		if(keyword=="") {
			mav.setViewName("Admin/Admin_MemberManagementPage");
		} else {
			System.out.println(searchType);
			if(searchType.equals("tId")){
				System.out.println("아이디검색");
				searchResultList = AdminDao.mSearchId(keyword, cri);
			}else if(searchType.equals("tName")){
				System.out.println("이름검색");
				searchResultList = AdminDao.mSearchName(keyword, cri);
			}else if(searchType.equals("tAll")){
				System.out.println("전체검색");
				searchResultList = AdminDao.mSearchAll(keyword, cri);
			}
			mav.addObject("paging", paging);
			mav.addObject("searchResult", searchResultList);
			mav.setViewName("Admin/Admin_MemberSearchResult");
		}
		

		return mav;
	}

	public ModelAndView Admin_ArticleManagement(String ar_genre, Criteria cri) {
		System.out.println("AdminService.articleManagement()");
		mav = new ModelAndView();
		List<ArticleDto> selectArticleList = new ArrayList<ArticleDto>();
		PagingDto paging;
		
		if(ar_genre.equals("all")) {
			selectArticleList = AdminDao.selectAllArticle();
			int totalArticle = AdminDao.getTotalArticle();
			paging = new PagingDto(cri, totalArticle);
		}else {
			selectArticleList = AdminDao.selectArticleList(ar_genre);
			int searchArticleCount = AdminDao.getSearchArticle(ar_genre);
			paging = new PagingDto(cri, searchArticleCount);
		}
		mav.addObject("paging", paging);
		mav.addObject("ArticleList", selectArticleList);
		mav.setViewName("Admin/Admin_ArticleManagementPage");
		session.setAttribute("activeEle", "artiManagement");
		return mav;
	}

	public ModelAndView Admin_ArticleInfoPage(int ar_no) {
		System.out.println("AdminService.Admin_ArticleInfoPage()");
		mav = new ModelAndView();
		ArticleDto ArticleInfo = AdminDao.selectArticleInfo(ar_no);
		String arContent = ArticleInfo.getAr_detail();
		
		arContent = arContent.replaceAll("\r\n", "<br>");
		arContent = arContent.replaceAll(" ", "&nbsp");
		
		ArticleInfo.setAr_detail(arContent);
		
		System.out.println(ArticleInfo.getAr_detail());
		ArrayList<CommentsDto> selectComment = AdminDao.selectComment(ar_no);
		System.out.println(selectComment);
		
		mav.addObject("ArticleInfo", ArticleInfo);
		mav.addObject("Comments", selectComment);
		mav.setViewName("Admin/Admin_ArticleInfoPage");
		
		return mav;
	}

	public ModelAndView Admin_ArticleDelete(int ar_no, RedirectAttributes ra) {
		System.out.println("AdminService.Admin_ArticleDelete()");
		mav = new ModelAndView();
		
		int articleDelete = AdminDao.articleDelete(ar_no);
		int Ar_commentAllDelete = AdminDao.Ar_commentAllDelete(ar_no);
		if(articleDelete>0) {
			ra.addFlashAttribute("deleteMsg", "삭제를 완료했습니다.");
		}else {
			ra.addFlashAttribute("deleteMsg", "삭제를 실패했습니다.");
		}
		
		mav.setViewName("redirect:/Admin_ArticleManagement?ar_genre=all");
		
		return mav;
	}
	
	public ModelAndView articleSearch(String keyword, String searchType, Criteria cri) {
		System.out.println("AdminService.articleSearch()");
		
		List<ArticleDto> searchResultList = new ArrayList<ArticleDto>();
		int searchAccount = AdminDao.getSearchAccountM(keyword);
		PagingDto paging = new PagingDto(cri, searchAccount);
		
		if(keyword=="") {
			mav.setViewName("Admin/Admin_ArticleManagementPage");
		} else {
			System.out.println(searchType);
			if(searchType.equals("tName")){
				System.out.println("아이디검색");
				searchResultList = AdminDao.aSearchName(keyword, cri);
			}else if(searchType.equals("tTitle")){
				System.out.println("제목검색");
				searchResultList = AdminDao.aSearchTitle(keyword, cri);
			}else if(searchType.equals("tAll")){
				System.out.println("전체검색");
				searchResultList = AdminDao.aSearchAll(keyword, cri);
			}
			mav.addObject("paging", paging);
			mav.addObject("searchResult", searchResultList);
			mav.setViewName("Admin/Admin_ArticleSearchResult");
		}
		

		return mav;
	}

	public ModelAndView Admin_articleModifyPage(int ar_no) {
		System.out.println("AdminService.Admin_articleModifyPage()");
		
		mav = new ModelAndView();
		
		ArticleDto ArticleInfo = AdminDao.selectArticleInfo(ar_no);
		mav.addObject("ArticleInfo",ArticleInfo);
		mav.setViewName("Admin/Admin_ArticleModifyPage");
		
		return mav;
	}

	public ModelAndView Admin_articleImgChange(ArticleDto article) {
		System.out.println("AdminService.Admin_articleImgChange()");
		String ar_filename = "";
		int dtoAr_no = article.getAr_no();
		mav = new ModelAndView();
		System.out.println(articleSavePath);
		String oldFileName = AdminDao.Ar_oldFileSelect(dtoAr_no);
		File oldFile = new File(articleSavePath + "\\" + oldFileName);
		
		MultipartFile ar_file = article.getAr_file();
		
		try {
			if(ar_file.getOriginalFilename()=="") {
				ar_filename = oldFileName;
			}else {
				if(!ar_file.isEmpty()) {
					System.out.println("기사 이미지 변경");
					UUID uuid = UUID.randomUUID();
					ar_filename = uuid.toString()+" "+ar_file.getOriginalFilename();
					
					ar_file.transferTo(new File(articleSavePath, ar_filename));
					oldFile.delete();
				}
			}
				
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		article.setAr_img(ar_filename);
		int Ar_imgChange = AdminDao.Ar_imgChange(article);
		
		mav.setViewName("redirect:/Admin_articleModifyPage?ar_no="+dtoAr_no);
		
		
		return mav;
	}

	public ModelAndView Admin_articleModify(ArticleDto article, RedirectAttributes ra) {
		System.out.println("AdminService.Admin_articleModify()");
		mav = new ModelAndView();
		
		int articleModify = AdminDao.articleModify(article);
		
		if(articleModify > 0) {
			ra.addFlashAttribute("ModifyMsg", "기사를 수정했습니다.");
		}else {
			ra.addFlashAttribute("ModifyMsg", "기사 수정이 실패했습니다.");
		}
		int ar_no = article.getAr_no();
		mav.setViewName("redirect:/Admin_ArticleInfoPage?ar_no="+ar_no);
		
		return mav;
	}

	public ModelAndView Admin_commentDelete(int ar_no, int cm_no, RedirectAttributes ra) {
		System.out.println("AdminService.Admin_commentDelete()");
		
		mav = new ModelAndView();
		
		int commentDelete = AdminDao.commentDelete(ar_no, cm_no);
		
		if(commentDelete>0) {
			ra.addFlashAttribute("CommentDelMsg", "댓글을 삭제했습니다.");
		}else {
			ra.addFlashAttribute("CommentDelMsg", "댓글 삭제가 실패했습니다.");
		}
		mav.setViewName("redirect:/Admin_ArticleInfoPage?ar_no="+ar_no);
		
		return mav;
	}






	
}
